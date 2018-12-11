sudo docker run -d \
	--restart unless-stopped \
	--name steamcache \
	-p 10.0.1.42:80:80 \
	-v /storage/steamcache/data:/data/cache \
	-v /storage/steamcache/logs:/data/logs \
	steamcache/steamcache:latest
