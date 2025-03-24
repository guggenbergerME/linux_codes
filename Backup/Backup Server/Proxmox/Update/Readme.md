# Proxmox updaten


## Proxmox VE Kein Abmelde-Repository

Wie der Name schon sagt, benötigen Sie keinen Abo-Schlüssel zum Zugriff dieses Repository. Es kann für Tests und Nichtproduktionen verwendet werden Nutzung. Es wird nicht empfohlen, dies auf Produktionsservern zu verwenden, da diese Pakete sind nicht immer so stark getestet und validiert.

Wir empfehlen, dieses Projektarchiv in /etc/apt/sources.list.
Datei ```/etc/apt/sources.list```

```
deb http://ftp.debian.org/debian bookwm main contrib
deb http://ftp.debian.org/debian bookworm-updates main contrib

Proxmox VE pve-no-subscription Repository bereitgestellt von proxmox.com,
NICHT für den Einsatz in der Produktion empfohlen
deb http://download.proxmox.com/debian/pve bookworm pve-no-subscription

- Sicherheitsupdates
deb http://security.debian.org/debian-security bookwm-security main contrib
```

Danach kann der Server aktualisiert werden

```
apt update && apt dist-upgrade
```
