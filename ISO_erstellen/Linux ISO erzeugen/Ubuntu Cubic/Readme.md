# Eigene Linux Version erstellen

# Cubic - Erstellen benutzerdefinierte ISO-Images

Cubic (Custom Ubuntu ISO Creator) ist ein grafisches Frontend für die Linux-Fähigkeiten, in gemountete ISO-Images mit einer Chroot-Umgebung neue Dateien einzubauen und danach ein geändertes ISO zu schreiben. Der Schritt-für-Schritt-Assistent ist vorbildlich übersichtlich, erweitert die Standard-Live-Medien von Ubuntu & Co mühelos um Software und Benutzerdateien und baut optimierte Livesysteme. Detailliertere Anpassungen sind möglich, setzen aber auch mit Cubic gute Kenntnis der Verzeichnishierarchie des Livesystems voraus.

Wie auf der Porjektseite https://launchpad.net/cubic beschreiben, installieren Sie das Tool mit folgenden Terminalbefehlen:
```
sudo apt-add-repository ppa:cubic-wizard/release
```

```
sudo apt update
```

```
sudo apt install cubic
```
Nach dem Start geben Sie erst ein (beliebiges) „Project Directory“ an, wo Cubic das Livesystem zusammenbauen soll. Nach „Next“ und „Select“ wählen Sie zunächst das ISO-Image des originalen Livesystems. Weitere Änderungen sind in diesem Dialog nicht nötig und nach „Next“ wird das Dateisystem des ISO-Abbilds temporär ausgepackt.

Nach weiterem „Next“ wird es spannend: In chroot-Konsole können Sie jetzt alle Anpassungen erledigen. Mit apt install […] rüsten Sie alles nach, was dem originalen Livesystem nach Ihrer Meinung fehlt. Benutzer- und Konfigurationsdateien können Sie einfach per Drag & Drop vom laufenden System in die chroot-Konsole von Cubic ziehen und dann mit der „Copy“-Schaltfläche in das Livesystem integrieren. Beachten Sie dabei, vorher mit cd in der chroot-Konsole in das gewünschte Verzeichnis zu wechseln – genau dort werden die Dateien später vorliegen. Sie können auch mit mkdir Ordner erstellen, um das Livesystem zu optimieren. Im konkreten Beispiel des von uns gewählten Lubuntu lautet das Live-Konto „lubuntu“, jedoch existiert kein Home-Ordner für dieses Konto. Wenn Sie dieses mit
```
mkdir /home/lubuntu
```
anlegen, können Sie es mit weiteren Ordner bestücken (etwa „Desktop“, „Bilder“) und diese wiederum mit Benutzerdateien sowie Konfigurationsdateien füllen (.bashrc. etc), aber auch mit einer kompletten Thunderbird-Konfiguration. Um Ordner und Dateien richtig anzulegen, sollten Sie die Ordnerstruktur des originalen Livesystems gut kennen oder parallel vor sich haben. Mit „Next“ verlassen Sie die chroot-Konsole, mit weiterem „Next“ die Paketübersicht. Danach wird das angepasste System zusammengebaut. Das fertige ISO können Sie mit den üblichen Werkzeugen auf DVD brennen oder auf USB schreiben.

Trotz Beschränkung auf Ubuntu & Co ist Cubic aktuell das wohl komfortabelste Tool, um Livesysteme individuell aufzubessern. Das im nächsten Punkt beschriebene Systemback ist im Prinzip noch flexibler, wird aber nicht mehr aktualisiert und hat technische Hürden.

### Links
+ [Anleitung](https://apfelböck.de/cubic-ubuntu-live/)
