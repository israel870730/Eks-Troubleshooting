# Especificar la imagen base de Jenkins
FROM jenkins/jenkins

# Actualizar el índice de paquetes e instalar paquetes necesarios para instalar Docker
USER root
RUN apt-get update \
    && apt-get install -y apt-transport-https \
                          ca-certificates \
                          curl \
                          gnupg \
                          lsb-release

# Agregar la clave GPG oficial de Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Agregar el repositorio de Docker al sistema
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Instalar Docker
RUN apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io

# Volver al usuario jenkins
USER jenkins
