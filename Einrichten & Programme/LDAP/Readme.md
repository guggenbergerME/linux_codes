# LDAP installieren
Bevor du mit der Installation des OpenLDAP-Servers beginnst, musst du sicherstellen, dass der FQDN (Fully Qualified Domain Name) für den OpenLDAP-Server richtig konfiguriert ist. In dieser Demo werden wir einen OpenLDAP-Server mit dem Server-Hostnamen„ldap“ und der Domain„localdomain.com“ sowie der IP-Adresse„192.168.5.25“ einrichten.

Führe den folgenden Befehl aus, um den FQDN auf „ldap.localdomain.com“ einzurichten.

    sudo hostnamectl set-hostname ldap.localdomain.com

Bearbeite die Konfigurationsdatei „/etc/hosts“ mit dem folgenden Befehl.

    sudo nano /etc/hosts

Füge die folgende Konfiguration in die Datei ein. Das Format der Datei „/etc/hosts“ ist hier„server-IP fqdn hostname„.

    192.168.5.25 ldap.localdomain.com ldap

Speichere und schließe die Datei, wenn du fertig bist.

Führe abschließend den folgenden Befehl aus, um den FQDN deines LDAP-Servers zu überprüfen. In dieser Demo solltest du eine Ausgabe wie„ldap.localdomain.com“ erhalten. Wenn du außerdem versuchst, den Hostnamen„ldap“ anzupingen, solltest du die Antwort von der Server-IP-Adresse„192.168.5.25“ statt von localhost erhalten.

    sudo hostname -f
    ping ldap

## Installieren der OpenLDAP-Pakete

Wenn du den richtigen FQDN hast, ist es an der Zeit, die OpenLDAP-Pakete zu installieren, die standardmäßig im Ubuntu-Repository verfügbar sind.

Bevor du mit der Installation der Pakete beginnst, führe den unten stehenden apt-Befehl aus, um dein Ubuntu-Systemrepository zu aktualisieren und aufzufrischen.

    sudo apt update

Installiere nun die OpenLDAP-Pakete mit dem folgenden Befehl. Gib Y ein, um die Installation zu bestätigen, und drücke ENTER, um die Installation zu starten.

    sudo apt install slapd ldap-utils

Während der Installation der OpenLDAP-Pakete wirst du aufgefordert, das Admin-Passwort für OpenLDAP einzurichten. Gib das sichere Passwort für den OpenLDAP-Admin-Benutzer ein und wähle„OK„, dann wiederhole dein Passwort. Damit ist die Installation von OpenLDAP abgeschlossen.

## OpenLDAP-Server konfigurieren

Um mit der Konfiguration des OpenLDAP-Servers zu beginnen, führe den folgenden Befehl aus. Dieser Befehl konfiguriert das Haupt-OpenLDAP-Paket „slapd“ neu und du wirst nach einigen grundlegenden OpenLDAP-Konfigurationen gefragt.

    sudo dpkg-reconfigure slapd

Bei der Frage„OpenLDAP-Serverkonfiguration auslassen?„, wähle„Nein„. Dadurch wird der OpenLDAP-Server mit einer neuen Konfigurationsdatei und einer neuen Datenbank eingerichtet.

Gib den Domänennamen für deine OpenLDAP-Installation ein und wähle„Ok„. Dieser Domainname wird als DN (Distinguished Name) deines OpenLDAP-Servers verwendet. In dieser Demo lautet der Domänenname„localdomain.com„, also wird der DN„dc=localdomain,dc=com“ lauten.

Gib den Organisationsnamen ein, der in der DN verwendet werden soll. Du kannst dafür die Domäne verwenden, aber auch einen anderen Namen.

Gib nun das Admin-Passwort für deinen OpenLDAP-Server ein und wiederhole das Passwort. Achte auch darauf, dass das Passwort richtig ist.

Wenn du gefragt wirst, ob du die alte Datenbank entfernen willst, wähle„Nein„.

Wähle nun„Ja„, um die alte OpenLDAP-Datenbank zu verschieben, und die OpenLDAP-Konfiguration ist abgeschlossen.

Unten siehst du die Ausgabe, wenn die OpenLDAP-Konfiguration abgeschlossen ist.

Nachdem du das Paket„slapd“ neu konfiguriert hast, bearbeite die Konfigurationsdatei„/etc/ldap/ldap.conf“ mit dem folgenden Befehl.

    sudo nano /etc/ldap/ldap.conf

Entferne die Kommentare in den Zeilen „BASE“ und „URI“ und gib den Domainnamen für deinen OpenLDAP-Server ein. In dieser Demo ist die„BASE“ hier„dc=localdomain,dc=com“ und die„URI“ für den OpenLDAP-Server ist„ldap://ldap.localdomain.com„.

    BASE dc=localdomain,dc=com
    URI  ldap://ldap.localdomain.com

Speichere und schließe die Datei, wenn du fertig bist.

Führe nun den folgenden Befehl aus, um den OpenLDAP-Dienst „slapd“ neu zu starten und die neuen Änderungen auf dem OpenLDAP-Server anzuwenden. Der OpenLDAP-Server läuft jetzt mit dem Basis-DN„dc=localdomain,dc=com„.

    sudo systemctl restart slapd
    sudo systemctl status slapd

## Test

Führe abschließend den folgenden Befehl aus, um die OpenLDAP-Basiskonfiguration zu prüfen und zu verifizieren. Du solltest den Basis-DN für den OpenLDAP-Server als„dc=localdomain,dc=com“ erhalten.

        sudo ldapsearch -Q -LLL -Y EXTERNAL -H ldapi:///

## LDAP Browser
- [Apache Directory Studio](LDAP-Browser/Readme.md)

## Errichten von Basisgruppen

- [Errichten von Basisgruppen](Basisgruppen/Readme.md)

### Tutorial
+ https://www.howtoforge.de/anleitung/so-installierst-du-openldap-unter-ubuntu-22-04/
