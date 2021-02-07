#!/bin/bash

#Stop the Container for save the Game
trap "echo 1 > server_exit.drp;" SIGTERM

#Start Valheim Dedicated Server
export LD_LIBRARY_PATH=./linux64:$LD_LIBRARY_PATH
export SteamAppId=892970
${STEAMAPPDIR}/valheim_server.x86_64 -name $SERVER_Name -port $SERVER_PORT -world $SERVER_WORLD -password $SERVER_PW -public $SERVER_PUBLIC & 

#Server exit
while wait $!; [ $? != 0 ]; do true; done
