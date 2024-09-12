# Paperless installation
Installation von Paperless-ngx unter Ubuntu

## System update
```
sudo apt update

sudo apt upgrade
```

## Grundlegende Programme installieren
```
sudo apt install git build-essential gcc python3-dev python3-pip libsm6 libxrender1 libfontconfig1
```

## Paperless-ngx clonen
```
sudo git clone https://github.com/jonaswinkler/paperless-ng.git /opt/paperless-ng
```

## Install Paperless-ngx
```
cd /opt/paperless-ng

sudo pip3 install -r requirements.txt
```
