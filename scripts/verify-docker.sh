#!/bin/sh
set -eu

PROJECT_NAME="${COMPOSE_PROJECT_NAME:-docker-repair-equipment-system}"
APP_PORT="${APP_PORT:-8080}"

compose() {
  docker compose -p "$PROJECT_NAME" "$@"
}

pass() {
  printf 'OK: %s\n' "$1"
}

fail() {
  printf 'ERROR: %s\n' "$1" >&2
  exit 1
}

compose ps

backend_id="$(compose ps -q backend)"
frontend_id="$(compose ps -q frontend)"
db_id="$(compose ps -q db)"

[ -n "$backend_id" ] && [ -n "$frontend_id" ] && [ -n "$db_id" ] ||
  fail "los tres servicios deben estar en ejecución"

curl --fail --silent "http://127.0.0.1:${APP_PORT}/" >/dev/null ||
  fail "el frontend no responde"
pass "frontend accesible en el puerto ${APP_PORT}"

curl --fail --silent "http://127.0.0.1:${APP_PORT}/api/health" |
  grep -q '"ok":true' || fail "la API o MySQL no responden"
pass "recorrido frontend -> backend -> MySQL"

published_ports() {
  docker inspect --format '{{range $port, $bindings := .NetworkSettings.Ports}}{{if $bindings}}{{$port}} {{end}}{{end}}' "$1"
}

[ -z "$(published_ports "$backend_id")" ] ||
  fail "backend tiene un puerto publicado"
pass "backend no publicado al host"

[ -z "$(published_ports "$db_id")" ] ||
  fail "MySQL tiene un puerto publicado"
pass "MySQL no publicado al host"

[ "$(docker inspect --format '{{.Config.User}}' "$backend_id")" = "node" ] ||
  fail "backend no se ejecuta como node"
pass "backend ejecutado como usuario node"

[ "$(docker inspect --format '{{.Config.User}}' "$frontend_id")" = "nginx" ] ||
  fail "frontend no se ejecuta como nginx"
pass "frontend ejecutado como usuario nginx"

frontend_networks="$(docker inspect --format '{{range $name, $_ := .NetworkSettings.Networks}}{{$name}} {{end}}' "$frontend_id")"
backend_networks="$(docker inspect --format '{{range $name, $_ := .NetworkSettings.Networks}}{{$name}} {{end}}' "$backend_id")"
db_networks="$(docker inspect --format '{{range $name, $_ := .NetworkSettings.Networks}}{{$name}} {{end}}' "$db_id")"

case "$frontend_networks" in
  *frontend_net*) ;;
  *) fail "frontend no pertenece a frontend_net" ;;
esac
case "$frontend_networks" in
  *backend_net*) fail "frontend tiene acceso a backend_net" ;;
esac
case "$backend_networks" in
  *frontend_net*backend_net*|*backend_net*frontend_net*) ;;
  *) fail "backend no conecta ambas redes" ;;
esac
case "$db_networks" in
  *backend_net*) ;;
  *) fail "MySQL no pertenece a backend_net" ;;
esac
case "$db_networks" in
  *frontend_net*) fail "MySQL tiene acceso a frontend_net" ;;
esac
pass "redes segmentadas correctamente"

printf '\nTodas las verificaciones finalizaron correctamente.\n'
