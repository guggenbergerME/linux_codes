# arch Linux installieren

## Installation
Das neueste ISO-Abbild kann von [www.archlinux.de/download/](https://www.archlinux.de/download/) heruntergeladen werden.

+ [Anleitung für Anfänger](https://wiki.archlinux.de/title/Anleitung_f%C3%BCr_Einsteiger)
+ [Vorbereitung der Installation](https://wiki.archlinux.de/title/1._Vorbereitung)
+ [Installation](https://kofler.info/arch-linux-installieren/)
+ [Installation weitere Anleitung](https://ro-kom.de/video-archinstall/)

Das ISO-Abbild beinhaltet nur die nötigen Programme, um ein minimales GNU/Linux Grundsystem zu installieren. Beachte, dass ein minimales Grundsystem keine grafische Oberfläche enthält. Der Rest des Arch Linux Systems - einschließlich grafischer Oberfläche - wird von der Kommandozeile aus eingerichtet. Dieser Prozess wird detailliert weiter unten besprochen. 

## ISO-Abbild prüfen

Beim Download mittels Torrent oder Magnet Link wird die ISO-Datei automatisch nach dem Download auf Übereinstimmung mit dem Original überprüft. Wird das ISO-Abbild per HTTPS heruntergeladen, sollte eine Prüfung mit der SHA1-Summe stattfinden. Soll eine CD oder DVD erstellt werden, ist es besser die Prüfung auf Übereinstimmung erst nach dem Brennvorgang zu tätigen.
```
sha1sum archlinux-*-x86_64.iso
```
( * ist mit dem Datum der Arch.iso Datei zu ersetzen.) Die so ermittelte Zeichenkette sollte mit den Angaben auf der Webseite übereinstimmen. 

## ISO-Abbild auf USB-Stick übertragen

Der USB-Stick darf nicht gemountet sein. Zunächst sollte mit folgendem Befehl die Partitionsbezeichnung des USB-Stick ermittelt werden:
```
# fdisk -l
```
Danach kann die ISO-Datei auf den Stick übertragen werden.
```
# dd bs=4M if=/pfad/archlinux-*-x86_64.iso of=/dev/sdx status=progress oflag=sync
```
Dabei ist sdx der erkannte USB-Stick. (x ist durch den entsprechenden Buchstaben zu ersetzen.) Beachte: Alle Daten auf dem USB-Stick werden gelöscht!

## Ändern der Tastaturbelegung

Zu diesem Zeitpunkt ist noch das US-englische Tastaturlayout eingestellt. Zum deutschsprachigen Tastaturlayout wird wie folgt gewechselt:

    loadkeys de-latin1

## Internetverbindung herstellen

Ist beim Systemstart der LAN-Adapter mit dem Router verbunden wird die Internetverbindung automatisch aufgebaut. 

über LAN

Wurde die Verbindung nicht automatisch hergestellt, genügt es die Netzwerkkarte zu ermitteln -
```
ip link 

 1: lo: <LOOPBACK.....
 2: enp4s0: <BROADCAST...
 .
 .
 3: wlp0s1:  <BROADCAST...
```

Die Netzwerkkarte heißt in diesem Beispiel enp4s0.
(wlp0s1 ist der Wlanadapter.)

- und die kabelgebundene Netzwerkverbindung neu aufzubauen.

```
dhcpcd <Netzwerkkarte>
```

über Wlan

Die Herstellung der WLan Verbindung wird mit folgendem Komando eingeleitet:

    iwctl

Dort gelangt man nach der Eingabe des folgenden Befehls zur Passwortabfrage:

station wlan0 connect <SSID>

Verlassen wird das Konsolen-Programm iwctl mit der Tastenkombination: Strg+d oder exit 


## Partitionen erstellen und Festplatte löschen

Um das System ordnungsgemäß installieren zu können, müssen Sie zunächst Partitionen erstellen und diese dann einbinden. Sie haben zu Beginn zwei Laufwerke: zum einen die Festplatte Ihres Rechners und zum anderen das Installationsmedium für Arch Linux. Für die Partitionierung gehen Sie nun wie folgt vor:

- Zunächst wählen Sie „Boot Arch Linux (x86_64)“ aus.
- Die Partitionen erstellen Sie am einfachsten über ein Programm wie ```cfdisk```. Dieses starten Sie, indem Sie den Namen als Befehl eingeben.
- Wählen Sie nun als Partitionsstil „dos“ für den MBR-Partitionsstil. Alternativ können Sie unter „Select label type“ „gpt“, „sgi“ oder „sun“ auswählen. Sollten Sie mehrere Festplatten haben, müssen Sie sich für die richtige entscheiden.
- Starten Sie nun cfdisk über „cfdisk /dev/sda“. Heißt Ihre Festplatte anders, müssen Sie den Part „/dev/sda“ entsprechend austauschen. Dieser steht für die Benennung Ihrer Festplatte.
- Nun sehen Sie, ob die Festplatte leer ist. Ist das nicht der Fall, können Sie sie über „Delete“ löschen.


## Swap-Partition erstellen

Ist die Festplatte leer, erstellen Sie zunächst eine Swap-Partition, die als RAM für Arch Linux verwendet wird.

+ Gehen Sie dafür unten links auf „New“ und drücken Sie [Enter].
+ Dann wählen Sie „Primary“ und bestätigen wieder mit [Enter].
+ Jetzt tippen Sie eine Zahl in MB ein und bestätigen diese ebenfalls. 1024 entspricht 1 GB, 2048 2 GB und so weiter. Ihre Swap-Partition sollte doppelt oder sogar dreifach so groß sein wie Ihr RAM. Bei 2 GB RAM würden Sie entsprechend 4096 MB (entspricht viermal 1024) nehmen.
+ Wählen Sie nun „Quit“ und beenden Sie so den Vorgang.



## Hauptpartition erstellen

Die Hauptpartition wird später der Speicherplatz für Ihr eigentliches Betriebssystem und weitere Daten. Diese erstellen Sie folgendermaßen:

+ Wählen Sie die Partition „Pri/Log Free Space“ aus.
+ Gehen Sie wieder zu „New“ und drücken Sie [Enter].
+ Jetzt wählen Sie „Primary“ und bestätigen Ihre Auswahl.
+ Überprüfen Sie die Größe der Partition unter „Size Type“. Dieser Wert sollte Ihrem gesamten Speicher abzüglich der Swap-Partition entsprechen.
+ Gehen Sie nun unten links auf „Bootable“ und bestätigen Sie die Auswahl.
+ Danach wählen Sie „Write“ (zweite Option von rechts), dann „yes“ und drücken [Enter].
+ Beenden Sie nun cfdisk durch „Quit“.


## Dateisystem anlegen und Partitionen einbinden

Abschließend legen Sie das Dateisystem an und binden die beiden Partitionen ein. Dazu formatieren Sie zunächst Ihre primäre Partition mit folgendem Befehl:
```
mkfs.ext4 /dev/sda2
```
Sollten Sie einen anderen Namen für Ihre primäre Partition gewählt haben, ändern Sie die Eingabe entsprechend.

Nun binden Sie die formatierte Partition ein. Der Befehl dafür lautet:
```
mount /dev/sda2 /mnt
```
So können Sie die Partition als Laufwerk nutzen.

Im nächsten Schritt fügen Sie eine Swap-Datei in der Swap-Partition ein. Dafür verwenden Sie die folgenden Befehle und bestätigen sie jeweils mit [Enter]:
```
mkswap /dev/sda1
```
```
swapon /dev/sda1
```
## Arch-Installation: Basissystem und Einstellungen

Nun können Sie mit der eigentlichen Arch-Installation beginnen. Um das Basissystem zu laden, müssen Sie mit dem Internet verbunden sein. Zwar ist dies auch über WLAN möglich, eine Ethernet-Verbindung ist allerdings in diesem Fall sicherer und daher empfehlenswert.
Basissystem installieren

Für die Arch-Installation geben Sie folgendes ein:

```
pacstrap /mnt base base-devel
```

## fstab erzeugen

Erzeugen Sie eine fstab mit UUIDs, damit Sie festlegen können, wo Laufwerke im Verzeichnis eingebaut werden. Der passende Befehl lautet:
```
genfstab -UP /mnt > /mnt/etc/fstab
```


## Root-Passwort festlegen

Öffnen Sie nun den chroot-Zugang, um weitere Einstellungen vorzunehmen. Der passende Befehl ist dieser:
```
arch-chroot /mnt
```
Hier können Sie nun z. B. Ihr Root-Passwort ändern.
```
passwd root
```

## Sprache, Tastaturbelegung und Zeitzone ändern

Über die Systemkonfiguration können Sie an dieser Stelle auch die Sprache festlegen. Für Deutsch ist dieser Befehl der richtige:
```
echo LANG=de_DE.UTF-8 > /etc/locale.conf
```
Die passenden Befehle für Tastaturbelegung und lokale Zeitzone lauten:
```
echo KEYMAP=de-latin1 > /etc/vconsole.conf
```
```
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
```

## Archiv anlegen

Sie benötigen ein Archiv für alle Dateien, die bei einem Systemstart verwendet werden. Diese initramfs erstellen Sie so:
```
mkinitcpio -p linux
```


### Links
+ [Anleitung für Einsteiger ](https://wiki.archlinux.de/title/Anleitung_f%C3%BCr_Einsteiger)
