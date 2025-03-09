# Plotter an Linux Mint betreiben

## USB Anschluss

Prüfen ob man als Benutzer in der Gruppe ```dialout````ist.

    id

Hinzufpgen des Benutzers zu dialout

    sudo addgroup [USERNAME] dualout

Linux Mint

    usermod -a -G dialout user

    sudo usermod -aG dialout $(whoami)

brltty löschen

    sudo apt remove brltty


## Plotterprogram
+ [Inkscape](https://inkscape.org/de/)
