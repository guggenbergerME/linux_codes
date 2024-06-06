# RustDesk installieren

## Server installieren
Bitte richten Sie Ihre Firewall auf Ihrem Server ein, bevor Sie das Skript ausführen.
Stellen Sie sicher, dass Sie über SSH oder auf andere Weise Zugang haben, bevor Sie die Firewall einrichten. Die Beispielbefehle für UFW (Debian-basiert) lauten:
```
ufw allow proto tcp from YOURIP to any port 22
```
Wenn Sie UFW installiert haben, verwenden Sie die folgenden Befehle, um die Firewall zu konfigurieren (Port 8000 wird nur benötigt, wenn Sie die automatisch generierten Installationsdateien verwenden möchten):
```
ufw allow 21114:21119/tcp
ufw allow 8000/tcp
ufw allow 21116/udp
```
```
sudo ufw enable
```
Führen Sie die folgenden Befehle aus:
```
wget https://raw.githubusercontent.com/techahold/rustdeskinstall/master/install.sh
chmod +x install.sh
./install.sh
```
Es gibt auch ein Update-Skript auf Techaholds Repository.

## RustDesk start|stop|status
```
sudo systemctl stop rustdeskrelay.service rustdesksignal.service
```

## RustDesk löschen
```
sudo systemctl stop rustdeskrelay.service rustdesksignal.service
sudo systemctl disable rustdeskrelay.service rustdesksignal.service
sudo rm -rf /var/log/rustdesk/
sudo rm -rf /opt/rustdesk/
sudo rm -rf /etc/systemd/system/rustdesksignal.service
sudo rm -rf /etc/systemd/system/rustdeskrelay.service

sudo systemctl stop gohttpserver.service
sudo systemctl disable gohttpserver.service
sudo rm -rf /var/log/gohttp/
sudo rm -rf /opt/gohttp/
sudo rm -rf /etc/systemd/system/gohttpserver.service
```
