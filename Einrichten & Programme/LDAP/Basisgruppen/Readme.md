# Basisigruppen

Nachdem du den Basis-DN (Distinguished Name) des OpenLDAP-Servers konfiguriert hast, wirst du nun eine neue Basisgruppe für OpenLDAP-Benutzer erstellen. In dieser Demo erstellst du zwei verschiedene Basisgruppen: die Gruppe „People“ für die Speicherung von Benutzern und die Gruppe „Groups“ für die Speicherung von Gruppen auf deinem OpenLDAP-Server.

Um neue LDAP-Inhalte wie Benutzer und Gruppen zu erstellen, kannst du die LDIF-Datei (LDAP Data Interchange Format) und das LDAP-Tool„ldapadd“ verwenden.

Erstelle eine neue LDIF-Datei„base-groups.ldif“ mit dem unten stehenden Befehl.

    sudo nano base-groups.ldif

Füge die folgende Konfiguration in die Datei ein.

    dn: ou=People,dc=localdomain,dc=com
    objectClass: organizationalUnit
    ou: People

dn: ou=Groups,dc=localdomain,dc=com
objectClass: organizationalUnit
ou: Groups

Führe nun den unten stehenden Befehl„ldapadd“ aus, um neue Basisgruppen in der Datei„base-groups.ldif“ anzulegen. Du wirst zur Eingabe des OpenLDAP-Administrator-Passworts aufgefordert, also achte darauf, das richtige Passwort einzugeben.

    sudo ldapadd -x -D cn=admin,dc=localdomain,dc=com -W -f base-groups.ldif
