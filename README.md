# valheim_docker
# Valheim Docker Container

I’m currently working on my first Docker Image :) </br>
Alle Credits goes to CM2Walki for his steamcmd Container</br>
and his Dockerfile from Modhau Project</br>
https://github.com/CM2Walki

# What is Valheim
Valheim. A brutal exploration and survival game for 1-10 players, set in</br> a procedurally-generated purgatory 
inspired by viking culture. Battle, build, and conquer your </br>way to a saga worthy of Odin's patronage!

# How to use this image

Running on the *host* interface (recommended):<br/>
```console
$ docker run -d --net=host -e SERVER_Name=yourservername -v /opt/valheim/valheim:/home/steam/valheim --name=valheim_dedicated valheim_dedicated:latest
```

# Configuration
## Environment Variables
Feel free to overwrite these environment variables, using -e (--env):
```dockerfile
SERVER_Name="replacethis" (default)
SERVER_PW="" (default) 
SERVER_PUBLIC=1 (default)
SERVER_PORT=2456 (default)
SERVER_WORLD="Dedicated" (default)
```

## Config
The config files can be found under */home/steam/valheim*
