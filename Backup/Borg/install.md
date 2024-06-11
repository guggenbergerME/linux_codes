# Borg installieren

    sudo apt-get install borgbackup 

## Initialisierung

Bevor Backups in Archiven gespeichert werden können, muss mit Hilfe des Terminals ein Repository angelegt werden:

      mkdir REPO_VERZEICHNISPFAD
      borg init [OPTIONEN] REPO_VERZEICHNISPFAD 

REPO_VERZEICHNISPFAD gibt dabei den Pfad [4] zu einem leeren Verzeichnis an, in dem das Repository angelegt werden soll. Zu möglichen Optionen siehe nachfolgende Tabelle:

**Wichtige Optionen für den init-Befehl**
Option 	Beschreibung
-e oder --encryption {none,keyfile,repokey} 	Wählt die Art der Verschlüsselung {keine, lokale Schlüsseldatei, Schlüsseldatei im Repository} (Option erforderlich)
-v oder --verbose 	Ausführlichere Ausgabe von Meldungen
-h oder --help 	Ausgabe eines Hilfetextes

Standard ist eine Verschlüsselung mit Ablage der Schlüsseldatei im Repository (repokey). Diese Datei wird dann über eine Passphrase gesichert. Befindet sich das Repository auf einem entfernten Rechner und will man die Sicherheit erhöhen, kann man die Schlüsseldatei auch im Verzeichnis ~.config/borg/keys' auf dem lokalen Rechner speichern (keyfile). Dann sollte man die Schlüsseldatei aber unbedingt zusätzlich sichern. Sonst kann bei einem Datenverlust des lokalen Rechners das Archiv nicht wieder entschlüsselt werden!

Beispiel: Der Benutzer "peter" möchte auf seiner externen Festplatte "HD_Backup" ein Repository "borgbackups" anlegen. In diesem Fall sieht die Befehlszeile so aus:

        mkdir /media/peter/HD_Backup/borgbackups
        borg init -e repokey /media/peter/HD_Backup/borgbackups 

Nach Eingabe der Befehlszeile wird die Passphrase abgefragt, die zur Verschlüsselung verwendet werden soll.

## Links
+ [Borg Dokumentation](https://docs.borgbase.com/)
