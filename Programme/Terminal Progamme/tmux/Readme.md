# TMUX

## Installation

tmux ist in den offiziellen Paketquellen enthalten und kann über das folgende Paket installiert werden [1]:

- tmux (universe)

Befehl zum Installieren der Pakete:

    sudo apt-get install tmux 

## Bedienung

### Start und Konfiguration

tmux wird über ein normales Terminal [2] gestartet:

    tmux  

Sollte kein Server gestartet sein, wird dieser automatisch mitgestartet. tmux kennt eine Reihe von Aufrufoptionen, die in der Manpage sehr gut beschrieben sind. Zum Starten von tmux mit Unterstützung für 256 Farben im Terminal und eigener Konfigurationsdatei wird z.B. folgender Befehl genutzt:

    tmux -2 -f tmux.conf 

Alternativ kann tmux mit einem Bash-Script (z.B. tmux.sh) gestartet werden, in der die jeweilige tmux.conf eingebunden wird[3]:
vergrößern

```
#!/bin/bash
SESSION=main
tmux="tmux -2 -f tmux.conf"

# if the session is already running, just attach to it.
$tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
       echo "Session $SESSION already exists. Attaching."
       sleep 1
       $tmux attach -t $SESSION
       exit 0;
fi
                                 
# create a new session, named $SESSION, and detach from it
$tmux new-session -d -s $SESSION
$tmux new-window    -t $SESSION:0 
$tmux split-window  -h -t $SESSION:0
$tmux new-window    -t $SESSION:1 
$tmux new-window    -t $SESSION:2  
$tmux new-window    -t $SESSION:3  
$tmux split-window  -h -t $SESSION:3
$tmux new-window    -t $SESSION:4
$tmux select-window -t $SESSION:0
$tmux attach -t $SESSION
```

     

tmux
Dieser Artikel wurde für die folgenden Ubuntu-Versionen getestet:

    Ubuntu 20.04 Focal Fossa

Du möchtest den Artikel für eine weitere Ubuntu-Version testen? Mitarbeit im Wiki ist immer willkommen! Dazu sind die Hinweise zum Testen von Artikeln zu beachten.

Zum Verständnis dieses Artikels sind folgende Seiten hilfreich:

    ⚓︎
    Installation von Programmen

    ⚓︎
    Ein Terminal öffnen

    ⚓︎
    Einen Editor öffnen 

Inhaltsverzeichnis

    Installation
    Bedienung
        Start und Konfiguration
            Beispiele der Kommandos
            Beispiele für Konfigurationen 
        Kommandos
        Tastenkombinationen
            Allgemein
            Sitzungen / sessions
            Fenster / windows
            Fensterscheibe / pane (Unterfenster) 
        X11-Selektion 
    Links 

Wiki/Icons/terminal.png tmux 🇬🇧 ist ein Terminal-Multiplexer für die Kommandozeile, vergleichbar mit screen oder Terminator. tmux ermöglicht es, innerhalb eines Terminals oder einer Terminalemulation verschiedene virtuelle Konsolensitzungen zu erzeugen und zu verwalten. Sitzungen können getrennt („detach“) und später weitergeführt werden („attach“). Mit tmux ist es möglich, Konfigurationen für unterschiedliche Zwecke zu definieren, sodass man die jeweils gewünschte Umgebung zur Verfügung hat.

Merkmale:

    Client-Server Struktur

    Darstellung mittels ncurses (und damit für die Konsole geeignet)

    Horizontales und vertikales Aufteilen des Fensters

    Fenster können frei vergrößert oder verkleinert werden

    Statusleiste mit Informationen wie Sitzungen, Fenstern, Programmnamen, Hostname und Datum/Uhrzeit

    Copy & Paste zwischen den verschiedenen Anwendungen

    Verwaltung mehrerer „paste buffer“

    Benennen und Finden von Sitzungen

    Steuerung mittels Tastenkombinationen und Befehlen, sowie „Aliasen“

    Tastaturbelegung frei wählbar

    Gut dokumentierte Befehlsschnittstelle (manpage)

    Anpassbar über die tmux.conf oder zur Laufzeit

    Über Skripte steuerbar

Installation

tmux ist in den offiziellen Paketquellen enthalten und kann über das folgende Paket installiert werden [1]:

    tmux (universe)

Befehl zum Installieren der Pakete:

sudo apt-get install tmux 

Bedienung
Start und Konfiguration

tmux wird über ein normales Terminal [2] gestartet:

tmux  

Sollte kein Server gestartet sein, wird dieser automatisch mitgestartet. tmux kennt eine Reihe von Aufrufoptionen, die in der Manpage sehr gut beschrieben sind. Zum Starten von tmux mit Unterstützung für 256 Farben im Terminal und eigener Konfigurationsdatei wird z.B. folgender Befehl genutzt:

tmux -2 -f tmux.conf 

Alternativ kann tmux mit einem Bash-Script (z.B. tmux.sh) gestartet werden, in der die jeweilige tmux.conf eingebunden wird[3]:
verkleinern

 1
 2
 3
 4
 5
 6
 7
 8
 9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24

	

#!/bin/bash
SESSION=main
tmux="tmux -2 -f tmux.conf"

# if the session is already running, just attach to it.
$tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
       echo "Session $SESSION already exists. Attaching."
       sleep 1
       $tmux attach -t $SESSION
       exit 0;
fi
                                 
# create a new session, named $SESSION, and detach from it
$tmux new-session -d -s $SESSION
$tmux new-window    -t $SESSION:0 
$tmux split-window  -h -t $SESSION:0
$tmux new-window    -t $SESSION:1 
$tmux new-window    -t $SESSION:2  
$tmux new-window    -t $SESSION:3  
$tmux split-window  -h -t $SESSION:3
$tmux new-window    -t $SESSION:4
$tmux select-window -t $SESSION:0
$tmux attach -t $SESSION

## Beispiele der Kommandos

Auflisten aller aktuell laufenden tmux-Sitzungen:

    tmux ls 

Neue tmux-Sitzung mit dem Namen „hans“ starten:

    tmux new -s hans 

Verbinden zur bestehenden Sitzung mit dem Namen „hans“:

    tmux attach -t hans 

Beendet tmux-Server und -Clients und zerstört alle Sitzungen:

    tmux kill-server 


### Links
+ [Projekt](https://github.com/tmux/tmux/wiki)
+ [Ubuntu Wiki](https://wiki.ubuntuusers.de/tmux/#Bedienung)
