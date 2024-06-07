# Docker Container starten und stoppen

Wir beginnen damit, die bereits vorhandenen Docker Container auf unserem Host zu identifizieren. Dies kann man dem Befehl docker ps erledigt werden. 
Geben wir diesen jetzt einfach auf dem Host ein, kann es sein, dass wir keine Container angezeigt bekommen. Das liegt daran, dass docker ps 
nur die Container aufgelistet, die im Moment den Status running haben.
```
docker ps
```
Wenn alle vorhandenen Container angezeigt werden soll, muss der Befehl mit dem Parameter -a für all erweitert werden. Das ganze sieht bei mir auf dem System dann wie folgt aus:
```
docker ps -a
```

## Starten von vorhandenen Docker Containern
Die bereits vorhandenen Docker Container können von uns wieder gestartet werden. Das macht ja auch Sinn, falls man eine Applikation hat die Daten im Container speichern soll. 
Würde man immer wieder einen neuen Container benötigen würde das keinen Sinn machen.
Um einen Docker Container zu starten benötigt man entweder die Container ID oder den Container Name. Beides lässt sich mit docker ps -a anzeigen.

Haben wir diese Informationen, lässt sich der Container ganz einfach mit docker start <container_name> oder docker start <container_id> starten.
```
docker start ec7313f6399e
```
## Wie stoppe ich einen Docker Container?

Das stoppen eines Docker Containers funktioniert fast genau so wie das starten eines Containers. Man muss lediglich start durch stop im Befehl tauschen. Auch das stoppen kann über die Container ID oder den Container Namen erfolgen. Die Befehle wären dann docker stop <container_name> oder docker stop <container_id>.
Das ganze sieht dann wie folgt aus im Terminal:
```
docker stop [CONTAINER ID]
```

## Docker Container löschen – Weg mit dem Ballast

Zu guter Letzt schauen wir uns noch an, wie man Docker Container die nicht mehr benötigt werden. Um Container zu löschen verwendet man den Befehl docker rm. 
Dieser kann wie auch die Befehle zuvor entweder mit der Container ID oder dem Container Namen ausgeführt werden. Die beiden Befehl würde dann so aussehen: 
docker rm <container_name> oder docker rm <container_id>.
Achtung: Ich sehe ganz oft Personen die direkt den Parameter -f beim Löschen angeben. Damit erzwingt man das löschen des Containers. 
Ich rate davon ab. Das löschen von Container macht nur dann Probleme, wenn es Abhängigkeiten gibt. Wenn das der Fall ist, sollte man diese Abhängigkeiten 
lieber sauber auflösen anstelle den Parameter -f zu verwenden.
Wenn wir einen Container löschen, sieht das ganze dann auf dem Terminal wie folgt aus;
```
docker rm CONTAINERID
```
