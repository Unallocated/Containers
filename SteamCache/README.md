# Awful documentation by Jelly

# Requirements: Storage, Docker

# Order of operation
- Create directories for persistent storage/scripts
- start_steamcache.sh
	- This script downloads steamcache and runs it persistently on 10.0.1.42:80/tcp
- start_steamcache-dns.sh
	- Download and start SteamDNS.
	- Specifies where SteamCache is running (IP and Port)
	- Passes 53/tcp and 53/udp throuh host at 10.0.1.42
- WE HAVE STEAMCACHE!!!
- Optional: Cache things

### Create Directories
- We assume persistent storage is available for SteamCache (download/serve games) and SteamCMD (SteamCache doesn't have an update manager, we use this to force updates to the cache)
- If you change/rename a directory, change the start_steamcache*.sh file('s).
```sh
$ sudo mkdir -p /storage/steamcache/tmp_steamcmd # SteamCMD
$ sudo mkdir -p /storage/steamcache/logs # SteamCache logs
$ sudo mkdir -p /storage/steamcache/data # SteamCache Game Files
$ sudo chown -R 1000:1000 /storage/steamcache/tmp_steamcmd
$ sudo chown -R 100:101 /storage/steamcache/logs
$ sudo chown -R 100:101 /storage/steamcache/data
```

### Install scripts
```sh
$ mkdir scripts
$ git clone https://github.com/Unallocated/Containers
$ cd SteamCache
$ cp start_steamcache.sh start_steamcache-dns.sh ~/scripts
$ chmod ~/scripts/*.sh
```

### Add more IP addresses
```sh
$ cd /etc/netplan
# We can 'cat' any files in here to see existing configuration or 'ip addr'
$ ls
$ sudo vi 60-interface2.yaml
network:
    version: 2
    renderer: networkd
    ethernets:
        ens192:
            addresses:
            - 10.0.0.30/24
# Check Syntax
$ sudo netplan generate 
# Test (automatic revert in 120 seconds)
$ sudo netplan try
# Commit
$ sudo ifdown ens192 && sudo ifup ens192
```

### Configure and Execute
```sh
$ cd ~/scripts
# Change IP Address to the IP SteamCache should bind 80/tcp to through the host machine. Also, update directories (if applicable).
$ vim start_steamcache.sh  
# Change IP address to the IP address SteamCache-DNS should bind to (53/tcp and 53/udp) and to what IP SteamCache is bound. Also, update directories (if applicable).
$ vim start_steamcache-dns.sh
$ ./start_steamcache.sh
$ ./start_steamcache-dns.sh
```

### Optional: Cache things
- These scripts will pull down copies of all games referenced in 'games.txt' as an anonymous user. 
- If anonymous downloads or not authorized, credentials will need to be entered in 'download_games.sh'
- List of all Steam UIDs can be found at: https://github.com/dgibbs64/SteamCMD-AppID-List
```sh
$ screen -S SteamCMD
$ sudo cp SteamCMD/steamcmd_download_games.sh SteamCMD/games.txt /storage/steamcache/tmp_steamcmd
$ sudo chmod +x /storage/steamcache/tmp_steamcmd/*.sh
$ sudo chown -R 1000:1000 /storage/steamcache/tmp_steamcmd
$ ~/scripts/start_steamcmd.sh
$ /home/steam/tmp/download_games.sh
```

## Troubleshooting.
### Check if host is listening
```sh
# Are you listening, are you listening? https://www.youtube.com/watch?v=1ZO9x0xnmJI
$ netstat -tln
```

### Check if docker is forwarding
```sh
# Does it look like this? SPECIFICALLY the ports field
$ sudo docker ps | grep steamcache
bbbbbbbbbbbb        steamcache/steamcache-dns:latest   "bash /scripts/boots…"   28 minutes ago      Up 28 minutes       10.0.1.42:53->53/tcp, 10.0.1.42:53->53/udp   steamcache-dns
aaaaaaaaaaaa        steamcache/steamcache:latest       "/scripts/bootstrap.…"   29 minutes ago      Up 29 minutes       10.0.1.42:80->80/tcp                         steamcache
```

### Check DNS
- Configure your laptop or PiHole to forward all DNS requests to 10.0.1.42
```sh
$ cat /etc/resolv.conf
$ nslookup google.com
```

### Are files being written to disk?
- Start downloading games (laptop/desktop/SteamCMD) and watch this to see if files are being written to the SteamCache data directory
```sh
$ ~/scripts/SteamCache_Download_Watch.sh
```


















