# Umbrell / Nostr

## umbrell ssh
```
ssh umbrel@[IP]
```
Passwort entspricht dem aus dem Setup!

## System update
```
sudo apt update && sudo apt full-upgrade -y
```

## NVMe prüfen
Als nächster Schritt muss geprüft werden ob die NVMe erkannt wurde
```
lsblk
```
sollt hier als Ergebis die "Festplatte" auflisten

## PI reboot
Nach dem Update sollte der PI noch einmal neu gestartet werden
```
sudo reboot
```

## Pi konfigurieren
```
sudo raspi-config
```


