# Plotter an Linux Mint betreiben

## USB Anschluss

Prüfen ob man als Benutzer in der Gruppe ```dialout````ist.

    id

Hinzufpgen des Benutzers zu dialout

    sudo addgroup [USERNAME] dualout

Linux Mint

    usermod -a -G dialout user

    sudo usermod -aG dialout $(whoami)

    sudo usermod -a -G uucp $USER

brltty löschen

    sudo apt remove brltty


![Alternativtext](https://github.com/guggenbergerME/linux_codes/blob/main/Drucker/Plotter/Inkscape.png "optional image title")

![Alternativtext](https://github.com/guggenbergerME/linux_codes/blob/main/Drucker/Plotter/Inkscape.png "optional image title")

## Plotterprogram
+ [Inkscape](https://inkscape.org/de/)
