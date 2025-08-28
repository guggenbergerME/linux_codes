# FTP upload

## Installieren eines FTP Servers

Mit diesem Befehl installiert man „vsftpd“:

    apt install vsftpd

Mit dem Texteditor „vi“ muss man nun noch ein paar Einstellungen in der Config des FTP Servers ändern (diese sind mit einem „#“ auskommentiert, um die Einstellung zu übernehmen, muss einfach das „#“ entfernt werden):

    $ nano /etc/vsftpd.conf

[Beispiel vsftpd.conf Datei](https://github.com/guggenbergerME/linux_codes/blob/main/Einrichten%20%26%20Programme/Dokumentverwaltung/Paperless/ftp/vsftpd.conf)

FTP Server neu starten:

```
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
```

## Firewall
Ausschalten der Proxmox Firewall und beachten der Gateway Firewall Regeln.

## Neuen ftp User anlegen

    adduser [NAME]

Anlegen eines FTP Ordners

## pdf per crontab in den Paperless Ordner schieben

    */2 * * * * mv /home/d1/*.pdf [zielordner]

## FTp testen

Terminal eingabe

    ftp benutzer@[IP]

Eingabe GUI Ordner

    ftp://[AnmeldeName]@10.115.0.5/home/[Anmeldename]
