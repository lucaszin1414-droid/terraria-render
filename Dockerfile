
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y wget unzip mono-complete tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /server

# Baixar TShock 5.2.1 (link oficial, nome fixo)
RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.1/TShock.zip -O TShock.zip && \
    unzip TShock.zip -d /server && \
    rm TShock.zip

EXPOSE 7777

# Iniciar servidor de forma segura
CMD exec mono --server --gc=sgen -O=all /server/TerrariaServer.exe \
    -configpath /server \
    -port 7777 \
    -world /server/world.wld \
    -autocreate 1 \
    -worldname "ServidorRender"


