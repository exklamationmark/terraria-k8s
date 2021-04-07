FROM ubuntu:20.04 AS base

RUN apt-get update
RUN apt-get install -y \
	unzip

ADD ./releases /tmp/releases

RUN mkdir -p /opt/terraria
RUN mkdir -p /tmp/terraria/pc
RUN mkdir -p /tmp/terraria/mobile

RUN unzip /tmp/releases/pc.zip -d /tmp/terraria/pc
RUN mv /tmp/terraria/pc/1421/Linux /opt/terraria/pc
RUN chmod +x /opt/terraria/pc/TerrariaServer
RUN chmod +x /opt/terraria/pc/TerrariaServer.bin.x86_64

RUN unzip /tmp/releases/mobile.zip -d /tmp/terraria/mobile
RUN unzip /tmp/terraria/mobile/Linux_MobileServer_1_4_0_5.zip -d /tmp/terraria/mobile
RUN mv /tmp/terraria/mobile/ServerLinux /opt/terraria/mobile
RUN chmod +x /opt/terraria/mobile/TerrariaServer
RUN chmod +x /opt/terraria/mobile/TerrariaServer.bin.x86
RUN chmod +x /opt/terraria/mobile/TerrariaServer.bin.x86_64

