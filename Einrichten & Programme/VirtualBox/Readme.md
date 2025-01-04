# VirtualBox

## Installieren

Update

```
sudo apt update
sudo apt upgrade -y
```

Starten Sie Ihr System nach der Installation der Updates mit folgendem Befehl neu.

    sudo reboot


VirtualBox benötigt einige Abhängigkeiten, um auf deinem System installiert zu werden. To do so, enter the following command

    sudo apt install dkms build-essential linux-headers-$(uname -r) -y

## VirtualBox Apt Repository hinzufügen

VirtualBox 7.1 is available at the time of writing this post. Aber in den Standard-Paket-Repositories von Linux Mint 22 ist sein Paket nicht verfügbar. Um die neueste Version von VirtualBox zu installieren, muss das offizielle apt-Repository hinzugefügt werden.. Die folgenden Befehle werden nacheinander ausgeführt.

```
sudo apt install curl wget apt-transport-https gnupg2 -y
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian noble contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list
```

## Installieren von VirtualBox auf Linux Mint 22
Nun sind wir bereit, VirtualBox zu installieren, indem wir die apt-Befehle ausführen,

```
sudo apt update
sudo apt install virtualbox-7.1 -y
```

## Fügen Sie Ihren lokalen Benutzer der Gruppe der VBox-Benutzer hinzu
Wenn Sie möchten, dass Ihr lokaler Benutzer die VirtualBox verwaltet, fügen Sie ihn der Gruppe “VBoxusers” hinzu.

```
sudo usermod -aG vboxusers $USER
newgrp vboxusers
```


+ [VirtualBox Linux Mint 22 installieren](https://www.linuxtechi.com/how-to-install-virtualbox-on-linuxmint/)

## Fenster verlassen

Vollbild verlassen

```
STRG [rechts] + F
```
