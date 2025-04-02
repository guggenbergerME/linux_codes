# SSH


## Abfragen Port
Prüfen welches Programm aktuell auf den SSH Port 22 zugreift

    lsof -i -P -n | grep

Prozess killen

    kill <process id>
