# Samba Benutzerverwaltung

## Sambabenutzer anlegen

Für den Zugriff auf die freigegebenen Ordner muss ein Samba-Benutzer eingerichtet werden. **Dieser Benutzer muss auf dem Linux-System existieren**. Um einen neuen Benutzer hinzuzufügen und ihn zu Samba hinzuzufügen, verwenden Sie die folgenden Befehle:

Benutzer unter Linux hinzufügen

    sudo adduser meinbenutzer

Benutzer als Sambabenutzer registrieren

    sudo smbpasswd -a meinbenutzer

## Alle Samba Benutzer auflisten

    pdbedit -L

smbpasswd Key Optionen

    -a: Add a new user to the Samba password database.
    -x: Delete a user from the Samba password database.
    -r: Specifies a remote machine to change passwords on.
    -U: Specifies the username for operations.
    -s: Silent mode, suppresses password prompts.
    -n: No password (used to set a blank password).
    -d: Disables the user account.
    -e: Enables the user account

Ersetzen Sie meinbenutzer durch den gewünschten Benutzernamen. Sie werden aufgefordert, ein Passwort einzugeben.

## Alle Sambabenutzer auflisten

    pdbedit -L

## Bestimmten Nutzer löschen

    smbpasswd -x [NAME]
