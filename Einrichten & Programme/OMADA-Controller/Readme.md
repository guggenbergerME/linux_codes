# Omada Controller

## Installation per Docker

```
apt install docker.io
```


Omada Docker Image installieren

```
docker pull mbentley/omada-controller:latest
```

Docker Volume erstellen

```
sudo mkdir -p /opt/tplink/EAPController/data
sudo mkdir -p /opt/tplink/EAPController/logs
```

```
docker run -d \
  --name omada-controller \
  --restart unless-stopped \
  --ulimit nofile=4096:8192 \
  -p 8088:8088 \
  -p 8043:8043 \
  -p 8843:8843 \
  -p 27001:27001/udp \
  -p 29810:29810/udp \
  -p 29811-29816:29811-29816 \
  -e MANAGE_HTTP_PORT=8088 \
  -e MANAGE_HTTPS_PORT=8043 \
  -e PGID="508" \
  -e PORTAL_HTTP_PORT=8088 \
  -e PORTAL_HTTPS_PORT=8843 \
  -e PORT_ADOPT_V1=29812 \
  -e PORT_APP_DISCOVERY=27001 \
  -e PORT_DISCOVERY=29810 \
  -e PORT_MANAGER_V1=29811 \
  -e PORT_MANAGER_V2=29814 \
  -e PORT_TRANSFER_V2=29815 \
  -e PORT_RTTY=29816 \
  -e PORT_UPGRADE_V1=29813 \
  -e PUID="508" \
  -e SHOW_SERVER_LOGS=true \
  -e SHOW_MONGODB_LOGS=false \
  -e SSL_CERT_NAME="tls.crt" \
  -e SSL_KEY_NAME="tls.key" \
  -e TZ=Etc/UTC \
  -v omada-data:/opt/tplink/EAPController/data \
  -v omada-logs:/opt/tplink/EAPController/logs \
  mbentley/omada-controller:latest
```

## Omada Controller aufrufen

```
https://[IP]:8043
```

## Update des Controllers

Docker Files updaten

    docker compose pull && docker compose up -d

## Aufrufen der webgui
Der Server benötig ca. 5 Minuten zum erzeugen der Zertifikate!

+ [Anleitung](https://github.com/mbentley/docker-omada-controller)
