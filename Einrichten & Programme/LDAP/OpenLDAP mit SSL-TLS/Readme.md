# OpenLDAP mit SSL/TLS

In diesem Abschnitt wirst du sicheres LDAPS auf dem OpenLDAP-Server einrichten und aktivieren. Du erstellst SSL/TLS-Zertifikate, die vom OpenLDAP-Server verwendet werden, richtest dann OpenLDAP für die Verwendung von SSL/TLS-Zertifikaten ein und aktivierst das sichere LDAPS-Protokoll.

Gib den folgenden„openssl„-Befehl ein, um die selbstsignierten SSL/TLS-Zertifikate zu erzeugen. Gib detaillierte Informationen über deine Zertifikate ein. 
Wenn du fertig bist, werden deine Zertifikate im Verzeichnis„**/etc/pki/tls/**“ gespeichert.

```
sudo openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout /etc/pki/tls/ldapserver.key \
  -out /etc/pki/tls/ldapserver.crt
```
