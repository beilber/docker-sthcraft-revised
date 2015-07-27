# docker-gameofsthcraft

A specialized server intented to be used with the Game of STHCraft private modpack.
This is pretty useless without the pack, but is part of my TechnicPack/Launcher
consolidation project.

This was initally based on overshard/minecraft, and all that remains from the
overshard repo is the baseline of this readme.

For help on getting started with docker see the [official getting started guide][0].
For more information on Minecraft and check out it's [website][1].


## Building docker-gameofsthcraft

    git clone https://github.com/beilber/docker-gameofsthcraft
    cd docker-gameofsthcraft
    sudo docker build -t beilber/gameofsthcraft .


## Running docker-gameofsthcraft

The image runs a minecraft server with Dynamp using default ports, 25565 and
8123 accordingly. There are 3 volumes but I am not building the image correctly
so the volumes in the example below is useless (for now....)

    sudo docker run -it -d -p 25565:25565 -p 80:8123 \
    -v "/opt/minecraft/gameofsthcraft/config:/server/config" \
    -v "/opt/minecraft/gameofsthcraft/dynmap:/server/dynmap" \
    -v "/opt/minecraft/gameofsthcraft/world:/server/world" \
    beilber/gameofsthcraft

### Notes on the run command

 + `-v` is the volume you are mounting `-v=host_dir:docker_dir`
 + `beilber/gameofsthcraft` is simply what I called my docker build of this image
 + `-it -d` allows this to run cleanly as a daemon with an interactive terminal
 + `-p` is the port it connects to, `-p=host_port:docker_port`

[0]: http://www.docker.io/gettingstarted/
[1]: http://minecraft.net/

