# arch Linux installieren

## Installation
Das neueste ISO-Abbild kann von [www.archlinux.de/download/](https://www.archlinux.de/download/) heruntergeladen werden.

+ [Anleitung für Anfänger](https://wiki.archlinux.de/title/Anleitung_f%C3%BCr_Einsteiger)
+ [Vorbereitung der Installation](https://wiki.archlinux.de/title/1._Vorbereitung)
+ [Installation](https://kofler.info/arch-linux-installieren/)
+ [Installation weitere Anleitung](https://ro-kom.de/video-archinstall/)
+ [Installation](https://akolles.de/arch-linux/arch-linux-installation)

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

## Verbindung per SSH
Vergeben eines Passworts
```
passwd
```

## Ändern der Tastaturbelegung

Zu diesem Zeitpunkt ist noch das US-englische Tastaturlayout eingestellt. Zum deutschsprachigen Tastaturlayout wird wie folgt gewechselt:

    loadkeys de-latin1

## Partitionierung der Festplatte

Meine für diese Anleitung verwendete 2 TByte große M.2 Samsung SSD 970 EVO Plus wird gelöscht und soll anschließend in eine **512 MByte Boot**- sowie in eine **35 GByte Swap-Partition** aufgeteilt werden, die von der Größe her in etwa der des Arbeitsspeichers entspricht. Die dritte Partition wird für das Betriebssystem bereitgestellt, auf der Archlinux samt Homeverzeichnis installiert werden soll. Die einzelnen Partitionen sind dabei in nvme0n1p1 .. p2 .. p3 unterteilt.

Mit **lsblk** verschafft man sich einen Überblick über vorhandene Partitionen und angeschlossene Festplatten. Hier muß man sehr darauf achten, die richtige Festplatte zu "erwischen", ansonsten droht Datenverlust! Nicht benötigte, externe Festplatten sollte man sowieso vorher abklemmen.

Zum Partionieren eines UEFI Systems benutze ich nun das mitgelieferte Partitionierungswerkzeug **gdisk**. Der Aufruf erfolgt in meinem Beispiel mit

```
gdisk /dev/nvme0n1
```
Mit Eingabe von **"o"** lösche ich alle evtl. vorhandenen Partitionen und mit Eingabe von **"n"** wird eine neue Partition angelegt. Die möglichen einzelnen Arbeitsschritte sehen in tabellarischer Form folgendermaßen aus:

### BOOT-Partition

![BILD](Bild.jpg)

![BILD](Bild.jpg)

![BILD](Bild.jpg)

