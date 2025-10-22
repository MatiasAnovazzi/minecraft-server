# Usa OpenJDK 17, compatible con versiones modernas de Minecraft (1.16+)
FROM openjdk:17-jdk-slim

# Define el directorio de trabajo
ENV SERVER_DIR=/minecraft

# Crea el directorio de trabajo
RUN mkdir -p ${SERVER_DIR}
WORKDIR ${SERVER_DIR}

# Instala curl para descargar archivos
RUN apt-get update && apt-get install -y curl

# Descarga el archivo server.jar para Minecraft 1.16.5
RUN curl -o server.jar https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar

# Copia archivos de configuración
COPY eula.txt .
COPY server.properties .

# Expone el puerto por defecto del servidor de Minecraft
EXPOSE 25565

# Comando para iniciar el servidor
CMD ["java", "-Xmx2G", "-Xms1G", "-jar", "server.jar", "nogui"]
