# https://developer.valvesoftware.com/wiki/SteamCMD
# https://docs.docker.com/config/containers/start-containers-automatically/


sudo docker run -it --name steamcmd-lfd2 -v /storage/steamcmd-servers/steamcmd-lfd2:/home/steam/lfd2 cm2network/steamcmd bash #/home/steam/lfd2/run_lfd2.sh 
CONTAINER=$( sudo docker ps -a | grep steamcmd | awk {'print $1'} )
sudo docker kill $CONTAINER
sudo docker rm $CONTAINER

