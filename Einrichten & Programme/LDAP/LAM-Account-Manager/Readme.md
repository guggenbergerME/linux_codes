# Installation des LDAP Account Managers

An dieser Stelle hast du die grundlegende OpenLDAP-Installation abgeschlossen. Jetzt installierst du den LDAP Account Manager auf demselben Server wie den OpenLDAP-Server. Der LDAP Account Manager (LAM) ist eine Webanwendung, die als Front-End für den OpenLDAP-Server verwendet werden kann. Mit ihm kannst du den OpenLDAP-Server über den Webbrowser verwalten und neue Benutzer, Gruppen usw. einrichten.

Der LAM ist standardmäßig im Ubuntu-Repository verfügbar. Du kannst es mit dem unten stehenden apt-Befehl installieren. Dadurch werden auch andere Pakete wie PHP und der Apache2 Webserver installiert.

Gib Y ein, um die Installation zu bestätigen und drücke ENTER, um fortzufahren. Die Installation von LAM beginnt nun.

    sudo apt install ldap-account-manager

Nach Abschluss der Installation öffnest du den Webbrowser und rufst die IP-Adresse des Servers auf, gefolgt von dem URL-Pfad„/lam (d.h. ```http://[DEINE IP]/lam```). Du solltest nun die Anmeldeseite des LDAP Account Managers (LAM) sehen.

## Erstes einrichten (LAM configuration)

Im Bereich ```Edit server profiles``` LAM einrichten. 

```
Login
Profil name     lam
Passwort        lam
```

Konfigurieren der Sprache und Einstellen des ```Tree suffix```

 **Security settings**

        cn=ldap,dc=gima-profi,dc=info

**Account types**
In diesem Bereich müssen User und Groups angepasst werden.

+ [Anleitung](https://www.howtoforge.de/anleitung/so-installierst-du-openldap-server-und-ldap-account-manager-unter-debian-12/)
