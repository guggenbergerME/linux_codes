# FTP Server

Docker

```
docker run \
	--detach \
	--env FTP_PASS=123 \
	--env FTP_USER=user \
	--name my-ftp-server \
	--publish 20-21:20-21/tcp \
	--publish 40000-40009:40000-40009/tcp \
	--volume /data:/home/user \
	garethflowers/ftp-server
```

### Infos
+ [Repo](https://github.com/garethflowers/docker-ftp-server)
