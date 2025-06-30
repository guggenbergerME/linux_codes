# hosts Datei

Um DNS-Einträge in Linux zu konfigurieren, kann man die Datei /etc/resolv.conf bearbeiten oder die Netzwerkeinstellungen über die grafische Benutzeroberfläche oder den Befehl nmcli anpassen. Für lokale Tests kann die Datei /etc/hosts verwendet werden, um bestimmte Domain-Namen auf lokale IP-Adressen zu verweisen. 

```
sudo nano /etc/hosts
```

## Beispile Eintrag ldap

```
# LDAP
10.100.1.3      ldap.localdomain.com ldap
```
