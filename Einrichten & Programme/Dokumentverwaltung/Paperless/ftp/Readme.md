# FTP upload

## Installieren eines FTP Servers

Mit diesem Befehl installiert man „vsftpd“:

    apt install vsftpd

Mit dem Texteditor „vi“ muss man nun noch ein paar Einstellungen in der Config des FTP Servers ändern (diese sind mit einem „#“ auskommentiert, um die Einstellung zu übernehmen, muss einfach das „#“ entfernt werden):

    $ vi /etc/vsftpd.conf

    local_enable=YES     (Zeile: 28)
    write_enable=YES     (Zeile: 31)
    chroot_local_user=YES  (Zeile: 114)

FTP Server neu starten:

    $ /etc/init.d/vsftpd restart

## Neuen ftp User anlegen

    adduser [NAME]

## pdf per crontab in den Paperless Ordner schieben

    */2 * * * * mv /home/d1/*.pdf [zielordner]

## ftp Verbinden

    ftp://[AnmeldeName]@10.115.0.5/home/[Anmeldename]
