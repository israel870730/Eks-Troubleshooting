# Especificar la imagen base de Jenkins
FROM jenkins/jenkins:lts

# Actualizar el índice de paquetes e instalar paquetes necesarios para instalar Docker
USER root
RUN apt-get update \
    && apt-get install -y apt-transport-https \
                          ca-certificates \
                          curl \
                          gnupg \
                          lsb-release \
                          software-properties-common

# Agregar la clave GPG oficial de Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Agregar el repositorio de Docker al sistema
RUN echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Instalar Docker
RUN apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io

# Volver al usuario jenkins
USER jenkins
