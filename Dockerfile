FROM ubuntu:22.04
RUN apt update && apt install -y wget unzip mono-complete
WORKDIR /server
RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.0-pre/TShock5.2_PreRelease.zip -O tshock.zip \
    && unzip tshock.zip \
    && rm tshock.zip
EXPOSE 7777
CMD mono --server --gc=sgen -O=all /server/TerrariaServer.exe -configpath /server -port 7777 -world /server/world.wld -autocreate 1 -worldname "ServidorRender"
