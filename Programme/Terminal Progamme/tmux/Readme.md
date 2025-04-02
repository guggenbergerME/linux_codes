# TMUX

## Installation

tmux ist in den offiziellen Paketquellen enthalten und kann über das folgende Paket installiert werden [1]:

- tmux (universe)

Befehl zum Installieren der Pakete:

    sudo apt-get install tmux 

## Bedienung

Start und Konfiguration

tmux wird über ein normales Terminal [2] gestartet:

	tmux  

Sollte kein Server gestartet sein, wird dieser automatisch mitgestartet. tmux kennt eine Reihe von Aufrufoptionen, die in der Manpage sehr gut beschrieben sind. Zum Starten von tmux mit Unterstützung für 256 Farben im Terminal und eigener Konfigurationsdatei wird z.B. folgender Befehl genutzt:

	tmux -2 -f tmux.conf 

Alternativ kann tmux mit einem Bash-Script (z.B. tmux.sh) gestartet werden, in der die jeweilige tmux.conf eingebunden wird[3]:
verkleinern

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

## Beispiele der Kommandos

+ [Übersicht](Befehle.md)

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
