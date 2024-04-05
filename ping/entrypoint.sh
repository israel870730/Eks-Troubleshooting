#!/bin/sh
# Permitir solo el comando ping
if [ "$1" != "ping" ]; then
  echo "No se permite ejecutar otros comandos"
  exit 1
fi
# Ejecutar el comando ping con los argumentos pasados
exec ping "$@"
