#!/bin/sh

# Verificar que solo se permita ejecutar el comando ping
if [ "$#" -ne 1 ]; then
  echo "Uso incorrecto: se requiere una dirección IP o un nombre de dominio como único argumento"
  exit 1
fi

# Verificar si el argumento es una dirección IP válida
if echo "$1" | grep -E "^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$" >/dev/null; then
  # Si es una dirección IP, ejecutar el comando ping directamente
  exec /bin/ping -c 10 "$1"
else
  # Si es un nombre de dominio, usar ping con la opción -c para especificar el número de intentos
  exec /bin/ping -c 10 "$1"
fi

#######################################
# Verificar que solo se permita ejecutar el comando ping
# if [ "$#" -ne 1 ]; then
#   echo "Uso incorrecto: se requiere una dirección IP como único argumento"
#   exit 1
# fi

# # Verificar si el argumento es una dirección IP válida
# if ! echo "$1" | grep -E "^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$" >/dev/null; then
#   echo "La dirección IP '$1' no es válida"
#   exit 1
# fi

# # Ejecutar el comando ping con la dirección IP proporcionada y limitar a 10 ejecuciones
# exec /bin/ping -c 10 "$1"