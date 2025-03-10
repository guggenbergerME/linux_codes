# Ermittlung des USB Anschluss

Der einfachste Weg um ein USB Gerät ausfindig zu machen ist das auslesen des Kern Logfiles

```
tail -f /var/log/kern.log
```

```
dmesg | grep usb
```

## udev monitor

```
sudo udevadm monitor -u
```
## Ausgabe grep

```
ls -Rl /dev | grep -i usb
```
## lsusb
Detalierte Informationen
```
lsusb -v
```
## Busdevice
```
usb-devices
```
## USB Schnittstellen Eigentümer
```
ls -l /dev/
```
