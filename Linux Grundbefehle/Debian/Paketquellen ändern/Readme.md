# Paketquellen

##Debian /etc/apt/sources.list ändern

Hier eine Beispieldatei nach der Installation mit mehreren CDs: /etc/apt/sources.list

Zeilenumbrüche sind platzbedingt und in der Originaldatei nicht vorhanden.

```
    #deb cdrom:[Debian GNU/Linux 5.0.3 _Lenny_ - Official i386 NETINST Binary-1 20090906-12:06]/ lenny main

    deb http://ftp.de.debian.org/debian/ lenny main non-free contrib
    deb-src http://ftp.de.debian.org/debian/ lenny main non-free contrib

    deb http://security.debian.org/ lenny/updates main contrib non-free
    deb-src http://security.debian.org/ lenny/updates main contrib non-free

    deb http://volatile.debian.org/debian-volatile lenny/volatile main contrib non-free
    deb-src http://volatile.debian.org/debian-volatile lenny/volatile main contrib non-free
```
