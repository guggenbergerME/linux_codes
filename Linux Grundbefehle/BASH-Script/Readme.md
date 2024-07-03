# BASH Script

## Name des Skriptes¶

Es ist sinnvoll, dass der Name des Skriptes dessen Funktion andeutet. Dabei wäre zu beachten, dass man keine Sonderzeichen verwendet, und es sollte nicht 
schon einen gängigen Systembefehl mit diesem Namen geben. Man sollte sein Skript z.B. nicht cp nennen, da es diesen Befehl schon gibt. Das Ganze lässt sich vermeiden, 
indem man einfach testet, ob es schon ein Programm mit dem gewünschten Skriptnamen gibt, und das geht folgendermaßen:
```
type mein_Skript.sh 
```
Erhält man hier ein Resultat, ist der Name bereits vorhanden, und man sollte sich einen anderen ausdenken.

## Ausführbar machen und aufrufen

Damit ein Skript ohne Angabe des Interpreters ausgeführt werden kann, muss es zuerst ausführbar gemacht werden. Dies geschieht z.B. in der Konsole durch folgenden Befehl.
```
chmod +x /pfad/zu/mein_Skript.sh 
```
Mehr Informationen dazu findet man auch in [Rechte](https://wiki.ubuntuusers.de/Rechte/).

Ist das Skript nun ausführbar gemacht, lässt es sich durch Angabe von Pfad und Namen starten:
```
/pfad/zu/mein_Skript.sh 
```
Einfacher geht dies, wenn man sich bereits im Verzeichnis befindet in welchem auch das Skript ist:
```
./mein_Skript.sh 
```
Dabei sollte nicht vergessen werden, dass sich Skripte auch ausführen lassen, wenn sie selbst nicht ausführbar gemacht sind. 
Ein Aufruf des Interpreters mit dem Skriptnamen als Argument führt den Skriptinhalt ebenfalls aus:
```
bash mein_Skript.sh
```

## Skript verfügbar machen

Man kann das Skript, nachdem es ausführbar gemacht wurde, in einen Ordner (z.B. ~/bin/) verlinken oder verschieben, welchen man der Umgebungsvariablen $PATH bekannt macht. 
Dies ist vor allem dann sinnvoll, wenn ein fertiges Skript von überall her einfach durch die Eingabe des Skriptnamens aufrufbar sein soll. 
In Ubuntu sorgt ein Mechanismus in der Datei ~/.profile dafür, dass ~/bin/ automatisch an den Anfang von $PATH gesetzt wird, sofern dieses Verzeichnis existiert.

Es sollte (insbesondere bei von mehreren Personen benutzten Rechnern und Servern) darauf geachtet werden, dass Skripte, die in globalen Verzeichnissen wie ```/usr/local/bin/``` abgelegt werden, dem Benutzer root gehören und nur dieser in die Datei schreiben darf, ansonsten öffnet man eine Sicherheitslücke.

Auch Skripte in ~/bin/ können ein Sicherheitsproblem sein, wenn sie den gleichen Namen wie Systemprogramme haben. So könnte ein Angreifer mit einfachen Nutzerrechten beispielsweise ein Skript in diesen Ordner legen, das einfach sudo heißt und damit das Passwort des Nutzers abfangen.

Konkret sind folgende Befehle hilfreich um ein Skript allen Benutzern des Rechners sicher zur Verfügung zu stellen:
```
ls -l /usr/local/bin
sudo chown root /usr/local/bin/mein_Skript.sh
sudo chgrp root /usr/local/bin/mein_Skript.sh
sudo chmod 755 /usr/local/bin/mein_Skript.sh 
```
Ist das Skript wie oben beschrieben verfügbar gemacht worden, dann kann es einfacher aufgerufen werden mit folgendem Befehl (Der Punkt plus Schrägstrich entfällt):
```
mein_Skript.sh
```

### Links
+ [BASH Tutorial [deu]](https://www.ernstlx.com/linux90script.html)

