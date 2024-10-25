# Ermittlung des USB Anschluss

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
