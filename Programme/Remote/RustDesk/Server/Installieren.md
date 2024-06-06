# RustDesk installieren


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
