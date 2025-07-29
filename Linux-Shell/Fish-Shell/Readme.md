# Fish Shell

+ [Projekt](https://fishshell.com/)

## Debian 12 installation

Führen Sie für Debian 12 folgendes aus
```
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/4/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/shells:fish:release:4.list
curl -fsSL https://download.opensuse.org/repositories/shells:fish:release:4/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/shells_fish_release_4.gpg > /dev/null
sudo apt update
sudo apt install fish
```
## Ubuntu - LM

```
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
```

## Wechseln zu FISh Shell

1. Fish installieren:

Falls Fish noch nicht installiert ist, installiere es mit sudo apt-get update && sudo apt-get install fish.

2. Überprüfen, ob Fish in **/etc/shells** eingetragen ist:

Öffne die Datei mit sudo nano /etc/shells.
Füge /usr/bin/fish hinzu, falls es noch nicht vorhanden ist.
Speichere und schließe die Datei.

## Shell mit chsh ändern:
Gib 

    chsh -s /usr/bin/fish 

ein und bestätige mit Enter.

Gib dein Passwort ein, wenn du dazu aufgefordert wirst.

## Anmelden und Abmelden:
Um die Änderung wirksam zu machen, melde dich von deiner aktuellen Sitzung ab und wieder an.
