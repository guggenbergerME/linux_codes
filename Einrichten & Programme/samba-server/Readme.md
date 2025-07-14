# Samba Filehost für Linux und Windows

## Samba installation

Aktualisieren Sie zuerst das Software-Repository Ihres Systems:

    sudo apt update
    sudo apt upgrade

Installieren Sie dann das Samba-Paket. 

    sudo apt install samba samba-ad-dc

Version prüfen

    samba --version

## Samba-Konfiguration

Die Hauptkonfigurationsdatei für Samba befindet sich unter /etc/samba/smb.conf. Es ist eine gute Praxis, eine Sicherungskopie der Originalkonfigurationsdatei zu erstellen, bevor Sie Änderungen vornehmen. Führen Sie dazu den folgenden Befehl aus:

    sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.backup

Nun öffnen Sie die Konfigurationsdatei mit Ihrem bevorzugten Texteditor, z.B. nano:

    sudo nano /etc/samba/smb.conf

Am Ende der Datei können Sie einen neuen Abschnitt für den Ordner hinzufügen, den Sie freigeben möchten. Zum Beispiel:

```
[MeineFreigabe]
   path = /pfad/zum/freigeben/ordner
   read only = no
   browsable = yes
```

Ersetzen Sie **/pfad/zum/freigeben/ordner** durch den tatsächlichen Pfad des Ordners, den Sie freigeben möchten. Speichern Sie die Datei und schließen Sie den Editor.

## Benutzer und Berechtigungen

Für den Zugriff auf die freigegebenen Ordner muss ein Samba-Benutzer eingerichtet werden. Dieser Benutzer muss auf dem Linux-System existieren. Um einen neuen Benutzer hinzuzufügen und ihn zu Samba hinzuzufügen, verwenden Sie die folgenden Befehle:

```
sudo adduser meinbenutzer
sudo smbpasswd -a meinbenutzer
```
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

## Samba-Dienst steuern

Nachdem Sie die Konfiguration abgeschlossen haben, müssen Sie den Samba-Dienst neu starten, um die Änderungen zu übernehmen. Verwenden Sie dazu den folgenden Befehl:

    sudo systemctl restart smbd

Überprüfen Sie den Status des Dienstes, um sicherzustellen, dass alles korrekt läuft:

    sudo systemctl status smbd

## Zugriff Linux

Einfügen des smb Links

    smb://[IP-DES-SERVER]/MeineFreigabe/

## Zugriff von Windows aus

Um auf die Samba-Freigabe von einem Windows-Computer aus zuzugreifen, öffnen Sie den Explorer und geben Sie **\\IP-des-Samba-Servers\MeineFreigabe** in die Adressleiste ein, wobei Sie **IP-des-Samba-Servers** durch die tatsächliche IP-Adresse Ihres Samba-Servers ersetzen.

### Shape.host Services

Zum Schluss möchten wir noch erwähnen, dass Shape.host Cloud VPS-Dienste anbietet, die ideal für die Ausführung von Samba und anderen Netzwerkdiensten sind. Mit den Cloud VPS-Lösungen von Shape.host können Sie sicher sein, dass Ihre Daten sicher und zugänglich sind, egal wo Sie sich befinden.

Durch die Verwendung eines Cloud VPS für Ihre Samba-Freigaben profitieren Sie von der Skalierbarkeit, Zuverlässigkeit und Leistung, die erforderlich sind, um Ihre Daten effizient zu verwalten und zu teilen. Shape.host bietet eine Reihe von Paketen an, die auf die
