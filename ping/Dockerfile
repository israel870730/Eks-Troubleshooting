# Image base
FROM alpine

# Install ping command
RUN apk update && apk add --no-cache iputils

# To delete apk to avoid additional installations
RUN apk del apk-tools

# To delete the folder "/etc/apk" to block the access at the repositories
RUN rm -rf /etc/apk

# Create a non-privileged user with /bin/false as shell
RUN adduser -D -s /bin/false troubleshooting

# Set permissions for ping command
RUN chmod u+s /bin/ping

# Copiar script personalizado de entrada
COPY entrypoint.sh /entrypoint.sh

# Dar permisos de ejecución al script
RUN chmod +x /entrypoint.sh

# Set the non-privileged user as the default user
USER troubleshooting

# Punto de entrada personalizado
ENTRYPOINT ["/entrypoint.sh"]
