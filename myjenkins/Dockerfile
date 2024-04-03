# # Especificar la imagen base de Jenkins
# FROM jenkins/jenkins:lts

# # Actualizar el índice de paquetes e instalar paquetes necesarios para instalar Docker
# USER root
# RUN apt-get update \
#     && apt-get install -y apt-transport-https \
#                           ca-certificates \
#                           curl \
#                           gnupg \
#                           lsb-release \
#                           software-properties-common

# # Agregar la clave GPG oficial de Docker
# RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

# # Agregar el repositorio de Docker al sistema
# RUN echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# # Instalar Docker
# RUN apt-get update \
#     && apt-get install -y docker-ce docker-ce-cli containerd.io

# # RUN service docker start \
# #     && systemctl enable docker.service \
# #     && systemctl status docker.service

# # Añadir el usuario jenkins al grupo docker
# RUN usermod -aG docker jenkins

# # Volver al usuario jenkins
# #USER jenkins

# # Iniciar el servicio de Docker
# #CMD ["sh", "-c", "sudo service docker start && /sbin/tini -- /usr/local/bin/jenkins.sh"]

# Use an Ubuntu base image
FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y docker-ce docker-ce-cli containerd.io

# Modify Docker configuration (optional, might not be needed in all cases)
# Here, we're just enabling the Docker service within the container
RUN sed -i 's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H unix:\/\/\/var\/run\/docker.sock/g' /lib/systemd/system/docker.service

# Expose Docker daemon port
EXPOSE 2375

# Start Docker daemon
CMD ["/bin/bash", "-c", "service docker start && tail -f /dev/null"]
