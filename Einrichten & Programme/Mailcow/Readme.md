# Mailcow 

## Installation

### Installation mailcow

***Systemvorraussetzung***
```
CPU      min 1 GHz
RAM      min 16 GB
HD       min 20 GB (ohne Emails)
Arch     x86_64, ARN64
```

***BS***
+ Debian 11, 12
+ Ubuntu 20.04 - 24.04



### Hostname ändern
Änderung des Host Namens in der mailcow.conf

Docker stoppen
```
docker-compose down
```

Conf ändern
```
/opt/mailcow-dockerized/mailcow.conf
```
Docker starten
```
docker-compose up -d
```

### Verzeichnis
```
# cd /opt/mailcow-dockerized
```

### Links
+ [installations Anleitung](https://docs.mailcow.email/de/getstarted/install/#selinux-besonderheiten-prufen)
