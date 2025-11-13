FROM ubuntu:22.04

# Evitar travar por timezone
ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências
RUN apt update && \
    apt install -y wget unzip mono-complete tzdata && \
    rm -rf /var/lib/apt/lists/*

# Criar pasta do servidor
WORKDIR /server

# Baixar e extrair TShock
RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.0-pre/TShock5.2_PreRelease.zip -O tshock.zip && \
    unzip tshock.zip && \
    rm tshock.zip

# Abrir a porta padrão do Terraria
EXPOSE 7777

# Comando para iniciar o servidor
CMD exec mono --server --gc=sgen -O=all /server/TerrariaServer.exe \
    -configpath /server \
    -port 7777 \
    -world /server/world.wld \
    -autocreate 1 \
    -worldname "ServidorRender"
