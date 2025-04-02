# tmux Befehle

Auflisten aller aktuell laufenden tmux-Sitzungen:

    tmux ls 

Neue tmux-Sitzung mit dem Namen „hans“ starten:

    tmux new -s hans 

Verbinden zur bestehenden Sitzung mit dem Namen „hans“:

    tmux attach -t hans 

Beendet tmux-Server und -Clients und zerstört alle Sitzungen:

    tmux kill-server 

Tmus beenden

    exit

Verbindung zu letzter tmux-Sitzung wiederherstellen

    tmux a -t [Sitzungsname]

oder

    tmux a #

Alle tmux-Sitzungen anzeigen (Anzeigen von Sitzungsnamen und Anzahl geöffneter Fenster)

    tmux 1s
Panes anpassen mit [Strg] + [B] + [:] und resize-pane

Wenn Sie ein Fenster in Panes aufteilen, haben Sie die Möglichkeit, die Panes nach Belieben zu konfigurieren. Hierzu drücken Sie zunächst die Tastenkombination [Strg] + [B] + [:]. Nun können Sie mit folgenden Befehlen Panes anpassen:

- resize-pane -D: Trennlinie zwischen Panes nach unten („downwards“) bewegen
- resize-pane -U: Trennlinie zwischen Panes nach oben („upwards“) bewegen
- resize-pane -R: Trennlinie zwischen Panes nach rechts bewegen
- resize-pane -L: Trennlinie zwischen Panes nach links bewegen

 Sie können die Trennlinie auch wie folgt um vordefinierte Zellen bewegen; dies wirkt sich jedoch auf alle Panes im Fenster aus:

- resize-pane -U 10: Trennlinie 10 Zellen nach oben bewegen
- resize-pane -t 2 -R 5: Trennlinie 5 Zellen nach rechts bewegen

Pane maximieren und minimieren (zuvor die Tastenkombination [Strg] + [B] + [:])

    resize-pane -Z

Abtrennen („detach“) von bestehender Sitzung (ggf. mit Sitzungsnamen)

    tmux detach

Verbinden („attach“) zu bestehender Sitzung (ggf. mit Sitzungsnamen)

    tmux attach

tmux-Tastenkombinationen
Abgesehen von der Steuerung und Ausführung über Kommandozeilenbefehle und Skripte erfolgt die Bedienung von tmux über Tastenkombinationen. Um die Steuerung über Tastenkürzel einzuleiten, drücken Sie [Strg] + [B]. Alle nachfolgenden Eingaben lösen die gewünschte Aktion aus. Zu den wichtigsten Kürzeln zählen:

Befehle für Sitzungen:

- S: Anzeige aller Sitzungen und Wechsel zwischen Sitzungen
- $: Aktuelle Sitzung umbenennen
- D: Bestehende Sitzung abtrennen („detach“) und in Hintergrund verschieben
- ?: Anzeige der aktuell aktiven Tastenkombinationen (Hilfe-Bereich öffnen)

Befehle für Fenster:

- C: Neues Fenster erzeugen/öffnen
- W: Alle aktuell bestehenden Fenster auflisten, zwischen Fenstern wechseln
- L: Zum letzten benutzten Fenster wechseln
- P: Zum chronologisch vorausgehenden Fenster wechseln
- N: Zum chronologisch nächsten Fenster wechseln
- ,: Aktuelles Fenster umbenennen
- &: Aktuelles Fenster beenden (mit „y“ bestätigen)
- 1, 2, 3, (…): Zu Fenster Nummer X springen
- [: Scrollmodus nutzen (mit Pfeiltasten in aktuellem Fenster scrollen)

Befehle für Panes:

- X: Aktuelles Pane schließen
- %: Aktuelles Pane vertikal teilen (zweites Pane im Fenster entsteht)
- ": Aktuelles Pane horizontal teilen (zweites Pane im Fenster entsteht)
- Pfeiltasten (links, rechts, oben, unten): Navigieren zwischen den Panes
- H: Zum linken Pane springen
- I: Zum rechten Pane springen
- J: Zum unteren Pane springen
- K: Zum oberen Pane springen
- Q: Anzahl der Panes anzeigen
- O: Chronologisch durch alle Panes navigieren
- }: Aktuelles Pane mit den darauffolgenden vertauschen
- {: Aktuelles Pane mit dem vorausgehenden vertauschen
- Leertaste: Zwischen den Aufteilungen von Panes wechseln
- !: Aktuelles Pane lösen und in neuem Fenster öffnen
