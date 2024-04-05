#!/bin/sh

# Verificar que solo se permita ejecutar el comando ping
if [ "$#" -ne 1 ]; then
  echo "Uso incorrecto: se requiere una dirección IP como único argumento"
  exit 1
fi

# Verificar si el argumento es una dirección IP válida
if ! echo "$1" | grep -E "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$" >/dev/null; then
  echo "La dirección IP '$1' no es válida"
  exit 1
fi

# Ejecutar el comando ping con la dirección IP proporcionada y limitar a 10 ejecuciones
exec /bin/ping -c 10 "$1"
