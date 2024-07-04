# Ventoy

**Download der Software**
+ [Download](https://www.ventoy.net/en/download.html)

## Linux CLI
Download der tar Datei und entpacken.

Dann das Installationsscript starten
```
sh Ventoy2Disk.sh { -i | -I | -u } /dev/XXX
```
XXX ist der USB Stick

```
Ventoy2Disk.sh CMD [ OPTION ] /dev/sdX
  CMD:
    -i   install ventoy to sdX (fail if disk already installed with ventoy)
    -I   force install ventoy to sdX (no matter installed or not)
    -u   update ventoy in sdX
    -l   list Ventoy information in sdX
    
  OPTION: (optional)
   -r SIZE_MB  preserve some space at the bottom of the disk (only for install)
   -s          enable secure boot support (default is disabled)
   -g          use GPT partition style, default is MBR style (only for install)
   -L          Label of the main partition (default is Ventoy)
```

### Links
+ [Ventoy Website](https://www.ventoy.net)
