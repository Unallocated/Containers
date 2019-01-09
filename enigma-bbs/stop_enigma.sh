
CONTAINER=$( sudo docker ps -a | grep enigma-bbs | awk {'print $1'} )
sudo docker stop $CONTAINER
sudo docker rm $CONTAINER
