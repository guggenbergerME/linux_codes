# Display ansprechen

Installieren der Erweiterungen **os-lcdproc-sdeclcd**

## Verbinden mit der FW per ssh

+ OPNsense Menü mit 8 verlassen

## Nano auf der FW installieren
```
pkg install nano
```
## Config File des Display bearbeiten
```
nano /usr/local/etc/LCDd-sdeclcd.conf
````

**Driver** ändern auf hd44780

## Konfig XG330
```
[server]
DriverPath=/usr/local/lib/lcdproc/
Driver=hd44780
Bind=127.0.0.1
Port=13666
ReportToSyslog=yes
User=nobody
Foreground=no
Hello="  Welcome to"
Hello="   OPNsense!"
GoodBye="Thanks for using"
GoodBye="   OPNsense!"
WaitTime=10
TitleSpeed=10
ServerScreen=on
Backlight=open
ToggleRotateKey=Enter
PrevScreenKey=Up
NextScreenKey=Down
 
[menu]
MenuKey=Escape
EnterKey=Enter
UpKey=Up
 
[hd44780]
ConnectionType=ezio
Device=/dev/cuau1
Keypad=yes
Size=16x2
KeyMatrix_4_1=Down
KeyMatrix_4_2=Escape
KeyMatrix_4_3=Up
KeyMatrix_4_4=Enter
```

## Konfig XG230
```
[server]
DriverPath=/usr/local/lib/lcdproc/
Driver=hd44780
Bind=127.0.0.1
Port=13666
ReportToSyslog=yes
User=nobody
Foreground=no
Hello="  Welcome to"
Hello="   OPNsense!"
GoodBye="Thanks for using"
GoodBye="   OPNsense!"
WaitTime=5
TitleSpeed=5
ServerScreen=on
Backlight=open
ToggleRotateKey=Enter
PrevScreenKey=Up
NextScreenKey=Down
 
[menu]
MenuKey=Escape
EnterKey=Enter
UpKey=Up
 
[hd44780]
ConnectionType=ezio
Device=/dev/cuau1
Keypad=yes
Size=16x2
KeyMatrix_4_1=Enter
KeyMatrix_4_2=Up
KeyMatrix_4_3=Down
KeyMatrix_4_4=Escape
```
