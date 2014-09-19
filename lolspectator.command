#!/usr/bin/env bash

echo -----------------------
echo League Spectator OSX 
echo -----------------------
echo ShadowFyren shadowfyren@gmail.com
echo ===================
echo

#eg "fspectate.op.gg:4181 5pGEihX+9qyz5c4vhACDeIsbINhrBoqz 1561339145 NA1"
SPECTATE_ARGS="$1"

echo $SPECTATE_ARGS

if [ "$#" -ne 1 ]; then
    echo "Usage: \"[ip:port] [token] [number] [region]\" (without brackets/quotes) [ENTER]:"
    read SPECTATE_ARGS
fi


cd "/Applications/League of Legends.app/Contents/LoL/RADS/projects/lol_air_client/releases/"

for CLIENT_PATH in `ls -v`
do
    if test -d $CLIENT_PATH
    then
      break
    fi
done

echo "$CLIENT_PATH"


cd "/Applications/League of Legends.app/Contents/LoL/RADS/solutions/lol_game_client_sln/releases/"

for LAUNCHER_PATH in `ls -v`
do
    if test -d $LAUNCHER_PATH
    then
      break
    fi
done

echo "$LAUNCHER_PATH"


cd "$LAUNCHER_PATH/deploy/LeagueOfLegends.app/Contents/MacOS"
riot_launched=true "/Applications/League of Legends.app/Contents/LoL/RADS/solutions/lol_game_client_sln/releases/$LAUNCHER_PATH/deploy/LeagueOfLegends.app/Contents/MacOS/LeagueofLegends" 8394 LoLLauncher "/Applications/League of Legends.app/Contents/LoL/RADS/projects/lol_air_client/releases/$CLIENT_PATH/deploy/bin/LolClient" "spectator $SPECTATE_ARGS"
