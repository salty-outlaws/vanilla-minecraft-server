FROM openjdk:8u212-jre-alpine

RUN apk -U --no-cache upgrade

RUN apk add --no-cache -U \
  bash \
  curl wget \
  nano
  
WORKDIR /server

RUN wget https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar -P /server

COPY server.properties /server
COPY eula.txt /server
COPY ops.txt /server
COPY start.sh /server

CMD ["bash", "/server/start.sh"]
