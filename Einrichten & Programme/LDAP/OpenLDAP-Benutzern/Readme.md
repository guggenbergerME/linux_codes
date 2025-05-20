  # Hinzufügen von OpenLDAP-Benutzern

Nachdem du eine Gruppe auf dem OpenLDAP-Server erstellt hast, ist es an der Zeit, einen LDAP-Benutzer über die LDIF-Datei zu erstellen.

Bevor du einen neuen Benutzer anlegst, führe den folgenden Befehl aus, um ein verschlüsseltes Passwort für den neuen LDAP-Benutzer zu generieren. Gib das neue Passwort ein und wiederhole es. Kopiere dann das verschlüsselte Passwort„{SSHA}ZdNAB+uH/zbK1mdS9JWlfOwRDf0mrsla„.

    sudo slappasswd

Erstelle nun eine neue LDIF-Datei „user.ldif“ mit dem folgenden Befehl.

    sudo nano user.ldif

Füge die folgende Konfiguration in die Datei ein. In dieser Demo erstellen wir einen neuen Benutzer„john“ mit dem Standard-Home-Verzeichnis „/home/john“ und der Standard-Shell„/bin/bash„. Außerdem kannst du oben in der Konfigurationsdatei sehen, dass dieser Benutzer Teil der Gruppe„People“ ist und die gidNummer„5000“ verwendet.

```
dn: uid=john,ou=People,dc=localdomain,dc=com
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: shadowAccount
uid: john
sn: Doe
givenName: John
cn: John Doe
displayName: John Doe
uidNumber: 10000
gidNumber: 5000
userPassword: {SSHA}ZdNAB+uH/zbK1mdS9JWlfOwRDf0mrsla
gecos: John Doe
loginShell: /bin/bash
homeDirectory: /home/john
```

Speichere und schließe die Datei, wenn du fertig bist.

Als nächstes führst du den Befehl„ldapadd“ aus, um einen neuen Benutzer in der Datei„user.ldif“ hinzuzufügen. Gib nun das Admin-Passwort für den OpenLDAP-Server ein.

    sudo ldapadd -x -D cn=admin,dc=localdomain,dc=com -W -f user.ldif

Zum Schluss führst du den Befehl„ldapsearch“ aus, um den neuen LDAP-Benutzer zu überprüfen und zu verifizieren. Nun sollte der Benutzer„john“ erstellt und auf dem OpenLDAP-Server verfügbar sein.

    sudo ldapsearch -x -LLL -b dc=localdomain,dc=com '(uid=john)' cn uidNumber gidNumber
