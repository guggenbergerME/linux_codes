# Linux Serielle Schnittstelle

## Hinweis zu CH340 USB / Serial Adapter
Sollte der Zugriff auf die Schnitstelle nicht möglich sein bitte in der Ausgabe von
```
sudo dmesg
```
den Fehler suchen.

In vielen Fällen findet man folgende Information
```
[ 2315.090957] ch341 1-1:1.0: ch341-uart converter detected
[ 2315.091436] ch341-uart ttyUSB0: break control not supported, using simulated break
[ 2315.091573] usb 1-1: ch341-uart converter now attached to ttyUSB0
[ 2315.676517] input: BRLTTY 6.4 Linux Screen Driver Keyboard as /devices/virtual/input/input20
[ 2315.678934] usb 1-1: usbfs: interface 0 claimed by ch341 while 'brltty' sets config #1
[ 2315.680200] ch341-uart ttyUSB0: ch341-uart converter now disconnected from ttyUSB0
[ 2315.680252] ch341 1-1:1.0: device disconnected
```
In disem Beispiel liegt das Problem an dem BRLTTY Treiber.

Diesen nun einfach Deinstallieren

```
sudo apt-get remove brltty
```

