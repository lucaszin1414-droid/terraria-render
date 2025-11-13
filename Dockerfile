FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Instalar dependências
RUN apt update && \
    apt install -y wget unzip mono-complete tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /server

# Baixar TShock atualizado (substitua pelo link oficial mais recente)
RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.1/TShock.zip -O tshock.zip && \
    unzip tshock.zip && \
    rm tshock.zip

EXPOSE 7777

CMD exec mono --server --gc=sgen -O=all /server/TerrariaServer.exe \
    -configpath /server \
    -port 7777 \
    -world /server/world.wld \
    -autocreate 1 \
    -worldname "ServidorRender"

