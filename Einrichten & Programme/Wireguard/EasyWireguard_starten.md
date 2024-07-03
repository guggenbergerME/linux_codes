# Starten des EasyWireguard Containers

```
docker run -d \
  --name=wg-easy \
  -e WG_HOST=[DEINE DYNDNS IP] \
  -e PASSWORD=[DEIN Passwort] \
  -v ~/.wg-easy:/etc/wireguard \
  -p 51820:51820/udp \
  -p 51821:51821/tcp \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_MODULE \
  --sysctl="net.ipv4.conf.all.src_valid_mark=1" \
  --sysctl="net.ipv4.ip_forward=1" \
  --restart unless-stopped \
  weejewel/wg-easy
```
