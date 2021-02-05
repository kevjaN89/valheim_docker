# Valheim Docker Container

I’m currently working on my first Docker Image :) </br>
All Credits goes to CM2Walki for his steamcmd Container</br>
and his Dockerfile from Modhau Project</br>
https://github.com/CM2Walki

# What is Valheim
Valheim. A brutal exploration and survival game for 1-10 players, set in</br> a procedurally-generated purgatory 
inspired by viking culture. Battle, build, and conquer your </br>way to a saga worthy of Odin's patronage!

> [Valheim](https://store.steampowered.com/app/892970/Valheim/)

<img src="https://media.indiedb.com/images/games/1/67/66055/valheim_logo.png" alt="logo" width="300" /></img>

# How to use this image

Running using a bind mount for data persistence on container recreation:
```console
$ mkdir -p $(pwd)/valheim
$ chmod 777 $(pwd)/valheim # Makes sure the directory is writeable by the unprivileged container user
$ docker run -d --net=host -e SERVER_Name=yourservername -v $(pwd)/valheim:/home/steam/valheim --name=valheim_dedicated valheim_dedicated:latest
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

## Immportant before restart the Container
If you want to restart the container, you should save the created world first. Unfortunately, </br>
I have not yet found a way to pack this directly into the image. From here two possibilities. </br>
If you don't do this, a new world will be generated after the container restart. </br>
</br>
Create the following file for this here $(pwd)/valheim
```console
$ cd (pwd)/valheim
$ echo 1 > server_exit.drp
```
As soon as the file "server_exit.drp" is created, the world is saved and will be restarted. Now you can turn off the Docker container</br>

The second possibility would be via docker exec. The command looks like this for it:</br>
```console
docker exec -it containername echo 1 > server_exit.drp
```
Now the container can be switched off or restarted!</br>
</br>
And finally, do not forget to open the firewall ports. 2456/udp, 2457/udp and 2568/udp



