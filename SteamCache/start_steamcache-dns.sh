sudo docker run -d \
	--restart=unless-stopped --name steamcache-dns \
	-p 10.0.1.42:53:53/udp \
	-p 10.0.1.42:53:53/tcp \
	-e STEAMCACHE_IP=10.0.1.42 \
	-e UPSTREAM_DNS=8.8.8.8 \
	steamcache/steamcache-dns:latest
