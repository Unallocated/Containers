


sudo docker run -d \
	--restart unless-stopped \
	--name enigma-bbs \
	-p 10.0.1.42:8888:8888 \
	-p 10.0.1.42:8889:8889 \
	-v /storage/enigma-bbs/art:/enigma-bbs/art \
	-v /storage/enigma-bbs/config:/enigma-bbs/config \
	-v /storage/enigma-bbs/db:/enigma-bbs/db \
	-v /storage/enigma-bbs/filebase:/enigma-bbs/filebase \
	-v /storage/enigma-bbs/logs:/enigma-bbs/logs \
	-v /storage/enigma-bbs/filebase:/enigma-bbs/filebase \
	-v /storage/enigma-bbs/mods:/enigma-bbs/mods \
	-v /storage/enigma-bbs/mail:/mail \
	enigma-uas

