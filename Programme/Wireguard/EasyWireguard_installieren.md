
# Easy Wireguard im Docker Container
Wenn noch nicht erfolgt, Docker installieren

```
curl -sSL https://get.docker.com | sh
```
```
sudo usermod -aG docker $(whoami)
```

## Docker Container mit Easy Wireguard starten
Um den Server erreichbar zu machen sind Anpassungen bei WG_HOST und PASSWORD nötig.
Bei WG_HOST wird die URL eingetragen, unter der der Server erreichbar ist, also i.d.R. eine Dyndns Adresse.

Das Passwort dient am Ende der Anmeldung auf der Web-Oberfläche! Die Ports können so belassen werden.
Der Port 51820 muss natürlich im Router freigeschaltet werden!
Der Port 51821 dient der Administration über den Webserver und sollte nicht von aussen zu erreichen sein.

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
Anschliessend werden noch alle fehlenden Pakete installiert.

## Docker Container auflisten
Durch den nachfolgenden Befehl können alle laufenden Container aufgelistet werden.
```
docker ps
```
## Weboberfläche öffnen
Zu erreichen ist die Weboberfläche unter
```
http://localhost:51821/
```

### Github des Projekts
https://github.com/WeeJeWel/wg-easy
