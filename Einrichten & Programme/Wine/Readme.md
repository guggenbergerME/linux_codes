# Wine installieren

## Wine installieren
```
sudo apt-get install wine-stable 
```

## WINEPREFIX anlegen

```
WINEPREFIX="/home/guggenberger/WINE" WINEARCH=win64 winecfg
```
## Programm starten
```
WINEPREFIX="/home/guggenberger/WINE" wine '/home/guggenberger/Downloads/KindleForPC-installer-2.6.70964.exe'
```

## Wine Controlpanel
```
wine control
```


## Programme starten
```
wine start /unix /ABSOLUER/PFAD/ZUR/DATEI.exe
```

## Windows-Programme deinstallieren
```
wine uninstaller
```
## Konfiguration
```
winecfg
```

## Wo befinden sich die Programme
Im Persönlichen Ordner versteckte Dateien sichtbar machen
```
/.wine
```

## Fehler

Wenn folgender Fehler erzeugt wird:

```
ERROR: ld.so: object '/usr/local/lib/AppProtection/libAppProtection.so' from /etc/ld.so.preload cannot be preloaded (wrong ELF class: ELFCLASS64): ignored.
```
Hilft ein löschen des preload
```
sudo mv /etc/ld.so.preload /etc/ld.so.preload.org 
```


+ [Installation](https://wine.htmlvalidator.com/install-wine-on-linux-mint-22.html)

