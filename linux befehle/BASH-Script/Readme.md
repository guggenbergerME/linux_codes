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
