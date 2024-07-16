# Statistik löschen

Wie kann ich nach einer osTicket Installation und mehreren Testtickets vor Start der produktiven Nutzung die Statistik des osTickets löschen?

## Login

Login auf die ssh Konsole des Ticketservers

Anmelden an mySQL:

```
mysql -u root -p
Enter password:
```
Datenbank finden:
```
mysql> show databases;
```
Datenbank wählen:
```
mysql> use datenbankname;
```
Tabellen anzeigen lassen (man kann auch gleich zu Punkt 6 springen, wer die Tabellen sehen will, nimmt diesen Punkt mit);
```
mysql> show tables;
```
Tabellennamen wählen und Löschen Befehl absetzen (es wird nur der Inhalt gelöscht, die Struktur bleibt erhalten):
```
mysql> delete from 'ost_ticket_event';
```
mySQL verlassen:
```
mysql> exit
Bye
```
Fertig
Natürlich können auch heidisql, phpmyadmin o.ä. genutzt werden, um den Inhalt von ost_ticket_event zu löschen.
