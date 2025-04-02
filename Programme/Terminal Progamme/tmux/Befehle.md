# tmux Befehle

Auflisten aller aktuell laufenden tmux-Sitzungen:

    tmux ls 

Neue tmux-Sitzung mit dem Namen „hans“ starten:

    tmux new -s hans 

Verbinden zur bestehenden Sitzung mit dem Namen „hans“:

    tmux attach -t hans 

Beendet tmux-Server und -Clients und zerstört alle Sitzungen:

    tmux kill-server 
