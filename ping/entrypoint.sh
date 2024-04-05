#!/bin/sh
# Verificar que solo se permita ejecutar el comando ping
if [ "$1" != "ping" ]; then
  echo "Solo se permite ejecutar el comando ping"
  exit 1
fi

# Ejecutar el comando ping con los argumentos proporcionados
shift  # Eliminar el primer argumento "ping"
exec /bin/ping "$@"

