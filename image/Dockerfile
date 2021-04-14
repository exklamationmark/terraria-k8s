FROM mono:6.12 AS base

RUN apt-get update
RUN apt-get install -y \
	unzip

ADD ./releases /tmp/releases

RUN mkdir -p /opt/terraria
RUN mkdir -p /tmp/terraria/pc
RUN mkdir -p /tmp/terraria/mobile
RUN mkdir -p /tmp/terraria/tshock

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

RUN unzip /tmp/releases/tshock_with_plugins.zip -d /opt/terraria/tshock
RUN chmod +x /opt/terraria/tshock/TerrariaServer.exe

ADD ./worlds /opt/terraria/builtin_worlds
ADD ./entry_point.sh /opt/terraria/tshock/entry_point.sh
ADD ./server.conf /config/server.conf
ADD ./tshock.json /config/tshock.json
ADD ./sscconfig.json /config/sscconfig.json

FROM mono:6.12

COPY --from=base /opt/terraria /opt/terraria
COPY --from=base /config /config

VOLUME ["/config", "/var/log/terraria", "/var/terraria"]
# ports:
# - 7777: Terraria server
# - 7878: Terraria TShock's REST API
# - 9763: Terraria metrics for Prometheus (:9763/metrics)
EXPOSE 7777 7878 9763

ENV WORLD_NAME=hello
ENV CONFIG_DIR=/opt/terraria/tshock/config

WORKDIR /opt/terraria/tshock
ENTRYPOINT ["/bin/sh", "/opt/terraria/tshock/entry_point.sh"]
