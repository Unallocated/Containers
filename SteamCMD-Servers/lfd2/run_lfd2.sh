
# Make install dir
mkdir -p /home/steam/lfd2-install

# Download LFD2 as anonymous
/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/lfd2-install +app_update 222860 validate +quit

# Deploy our one server config
/bin/cp /home/steam/steamcmd/lfd2/server.cfg /home/steam/steamcmd/lfd2-install/

# Run zee game
/home/steam/steamcmd/lfd2-install/srcds_run -console -game left4dead2 +port 27020 +maxplayers 8 +exec /home/steam/steamcmd/lfd2/server.cfg +map c2m1_highway

