FROM openjdk:17-jdk-slim

# Define variables
ENV MINECRAFT_VERSION=1.20.1
ENV SERVER_JAR=minecraft_server.${MINECRAFT_VERSION}.jar
ENV SERVER_DIR=/minecraft

# Crear directorio
RUN mkdir -p ${SERVER_DIR}
WORKDIR ${SERVER_DIR}

# Descargar el jar del servidor de Minecraft
RUN apt-get update && apt-get install -y curl && \
    curl -o ${SERVER_JAR} https://launcher.mojang.com/v1/objects/9c918ce0c9f678cbd2b798edc2cc74e30b057a59/server.jar

# Copiar archivos de configuración
COPY eula.txt .
COPY server.properties .

EXPOSE 25565

# Comando de inicio
CMD ["java", "-Xmx2G", "-Xms1G", "-jar", "minecraft_server.1.20.1.jar", "nogui"]
