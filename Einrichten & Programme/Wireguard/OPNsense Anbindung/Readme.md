# Linux - Client mit OPNsense Verbinden

Erzeugen einer WG Peer in der OPNsense

```
[Interface]
PrivateKey = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
Address = 123.123.123.3/32
DNS = 1.1.1.1, 8.8.8.8

[Peer]
PublicKey = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
Endpoint = [SERVER IP]:51820
AllowedIPs = 0.0.0.0/0,::/0
```

> [!IMPORTANT]  
> Jede neue WG Instanz bei OPNsense benötigt einen weiteren Port ```51820 - 51821 - 51822``` die im ```WAN``` freigegeben werden müssen. 


## WG installieren

Für jedes OS findet man [hier](https://www.wireguard.com/install/) die Installationsart.

## WG Client konfigurieren

Wechseln in das Verzeichnis von wireguard als root

```
etc/wireguard/
```

Anlegen der Datei für den von der OPNsense erzeugten privaten KEY
```
echo "Privater_key_opensens_generator" > private.key
```
Aus diesem Privaten Key erzeugen wir nun einen Public Key

```
wg pubkey < private.key > public.key
```

Nun legen wir die Wireguard Schnittstelle an

Erzeugen der Datei 

```
nano wg0.conf
```

und speicher der OPNsense PEER Vorlage in diese Datei.

```
[Interface]
PrivateKey = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
Address = 123.123.123.3/32
DNS = 1.1.1.1, 8.8.8.8

[Peer]
PublicKey = XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX=
Endpoint = [SERVER IP]:51820
AllowedIPs = 0.0.0.0/0,::/0
```

## WG Schnittstelle starten

Aktivieren der Schnitstelle automatisch bei Systemstart (Angabe der Schnittstelle ohne .conf!)

```
sudo systemctl enable wg-quick@wgXXX
```
Starten
```
sudo systemctl start wg-quick@wgXXX
```
Status
```
sudo systemctl status wg-quick@wgXXX
```
Stop
```
sudo systemctl stop wg-quick@wgXXX
```


## Ausführbare Datei auf Desktop

Erzeugen einer Bash Datei, bsp. ```vpn-start.sh```

```
#! /bin/sh
sudo systemctl start wg-quick@wgXXX
```

