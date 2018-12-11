# Download games one at a time, purge when done.
# List of games at :https://github.com/dgibbs64/SteamCMD-AppID-List
# games.txt is a file of UIDs for games we wish to cache, one per line.

HOME='/home/steam/tmp'
for GAME in `cat $HOME/games.txt`; do
	find /home/steam/tmp/ -name ".svn" -exec rm -r "{}" \;
	mkdir /home/steam/tmp/$GAME
	/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir ../$GAME +app_update $GAME +quit
	rm -rf /home/steam/tmp/$GAME
done
