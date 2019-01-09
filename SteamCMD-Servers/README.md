### Process of Operations
- Run 'start_steamcmd-lfd2.sh', this starts up a docker container
    - Upon start, ports 27015-27050 are passed through the container to the OS for hosting the game server
    - We mount a directory inside the Docker container which includes 3 files.
    - First, we have a script that downloads LFD2 server as an anonymous user
    - Secondly, we have a script that will copy the server.cfg file, in the directory we passed through to the container, to the downloaded game installation dir
    - This second script will start the game after the server.cfg file has been installed.

```sh
$ git clone https://github.com/Unallocated/Containers.git 
$ cd Containers/SteamCMD-Servers/lfd2
$ sudo mkdir -p /storage/steamcmd-servers/steamcmd-lfd2/
$ sudo cp ./lfd2/* /storage/steamcmd-servers/steamcmd-lfd2/
$ sudo chown -R 1000:1000 /storage/steamcmd-servers/steamcmd-lfd2
$ screen -S steamcmd-lfd2
$ ./start_steamcmd-lfd2.sh
$ /home/steam/lfd2/run_lfd2.sh 
```
