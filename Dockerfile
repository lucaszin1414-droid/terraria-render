FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y wget unzip mono-complete tzdata && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /server

RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.4/TShock.zip -O TShock.zip && \
    unzip TShock.zip -d /server && \
    rm TShock.zip

EXPOSE 7777

CMD exec mono --server --gc=sgen -O=all /server/TerrariaServer.exe \
    -configpath /server \
    -port 7777 \
    -world /server/world.wld \
    -autocreate 1 \
    -worldname "ServidorRender"


