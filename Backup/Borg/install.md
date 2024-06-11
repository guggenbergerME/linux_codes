# Borg installieren

  sudo apt-get install borgbackup 

## Initialisierung

Bevor Backups in Archiven gespeichert werden können, muss mit Hilfe des Terminals ein Repository angelegt werden:

  mkdir REPO_VERZEICHNISPFAD
  borg init [OPTIONEN] REPO_VERZEICHNISPFAD 

REPO_VERZEICHNISPFAD gibt dabei den Pfad [4] zu einem leeren Verzeichnis an, in dem das Repository angelegt werden soll. Zu möglichen Optionen siehe nachfolgende Tabelle:
