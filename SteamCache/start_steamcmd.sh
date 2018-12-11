# https://developer.valvesoftware.com/wiki/SteamCMD
# https://docs.docker.com/config/containers/start-containers-automatically/

sudo docker run -it --name steamcmd -v /storage/steamcache/tmp_steamcmd/:/home/steam/tmp cm2network/steamcmd bash #/home/steam/tmp/download_games.sh
CONTAINER=$( sudo docker ps -a | grep steamcmd | awk {'print $1'} )
#sudo docker kill $CONTAINER
sudo docker rm $CONTAINER

