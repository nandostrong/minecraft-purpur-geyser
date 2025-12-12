FROM openjdk:17-jdk-slim

WORKDIR /server

# --------------------------
# DOWNLOAD PURPUR AUTOMÁTICO
# --------------------------
ADD https://api.purpurmc.org/v2/purpur/1.21.1/latest/download purpur.jar

# Aceitar EULA automaticamente
RUN echo "eula=true" > eula.txt

# --------------------------
# DOWNLOAD GEYSER & FLOODGATE
# --------------------------
RUN mkdir -p plugins

# Geyser
ADD https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot plugins/Geyser.jar

# Floodgate
ADD https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot plugins/Floodgate.jar

# Expor portas Java e Bedrock
EXPOSE 25565/tcp
EXPOSE 19132/udp

# INICIAR PURPUR
CMD ["java", "-Xms2G", "-Xmx2G", "-jar", "purpur.jar", "--nogui"]
