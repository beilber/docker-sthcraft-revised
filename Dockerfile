# -----------------------------------------------------------------------------
# docker-gameofsthcraft
#
# A dockerized minecraft server for the gameofsthcraft modpack
#
# Needs work, comments and serious polish
#
# Authors: Brian Eilber
# Updated: March 22nd, 2015
# Require: Docker (http://www.docker.io/)
# -----------------------------------------------------------------------------


FROM   ubuntu:14.04

ENV    DEBIAN_FRONTEND noninteractive

RUN    apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common
RUN    sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update
RUN    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections  && \
       echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections  && \
       apt-get --yes install curl oracle-java7-installer unzip

RUN	mkdir /server
RUN	wget http://files.spankythehero.com/gameofsthcraft-qa.107-server.zip -O /server/pack.zip
RUN	cd /server && unzip pack.zip && rm pack.zip
RUN	cd /server && sh install.sh

EXPOSE 25565
EXPOSE 8123

VOLUME ["/server/dynmap"]
VOLUME ["/server/config"]
VOLUME ["/server/world"]

CMD    ["java", "-Xmx3G","-XX:PermSize=256M","-XX:+UseConcMarkSweepGC","-XX:+CMSIncrementalPacing","-XX:+AggressiveOpts","-jar","/server/KCauldron-1.7.10-1408.87-server.jar","nogui"]

