# Der Email-Client mutt

Mutt ist ein textbasierter Email-Client, der sich durch eine hohe Funktionalität und Konfigurierbarkeit auzeichnet. Sogar HTML-Emails können mittels lynx dargestellt werden, wenn auch nur auf minimalistische Weise. Dafür ist ein Lesen sowie eine Verwaltung der Emails ohne graphische Oberfläche möglich (beispielsweise via SSH auf externen Rechnern).

Die Steuerung von mutt erfolgt ausschließlich über die Tastatur und ermöglicht folgende Features:

+ Mutt kann die einkommenden Emails in Thread-Darstellung anzeigen und in der Übersicht farblich nach benutzerdefinierten Kriterien hervorheben.
+ Mutt unterstützt die Nutzung unterschiedlicher Mailbox-Formate. Man kann mutt zudem beispielsweise so konfigurieren, dass Emails automatisch in Jahres-Archiven abgelegt werden.
+ Mutt bietet Funktionen zum schnellen Durchsuchen von Mailboxen nach Suchbegriffen und -mustern (wahlweise in den eigentlichen Email-Inhalten, oder nur in den Betreffszeilen); es können auch Emails gemäß bestimmter Kriterien ausgewählt und daraufhin gemeinsam verschoben, gelöscht, oder kopiert werden.
+ Zum Schreiben von Emails kann jeder beliebige Text-Editor verwendet werden (beispielsweise Vim).

## Installation von Mutt und Hilfsprogrammen
Zur Installation von mutt sollten folgende Pakete installiert werden:

+ Nutzt man mutt nur, um als Server-Administrator via SSH die von System-Diensten generierten lokalen Mails zu lesen, so muss lediglich das Paket mutt installiert werden; weitere Konfigurationen, wie sie in diesem Abschnitt beschrieben werden, sind in diesem Fall nicht nötig.

```
sudo apt-get install mutt
```

Nutzt man mutt in ähnlicher Weise wie Thunderbird als vollwerten Mail-User-Agent (MUA) für zum Schreiben und Empfangen gewöhnlicher Emails, so sollten folgende Pakete installiert werden:

```
sudo apt-get install lynx fetchmail procmail msmtp
```

Das Hilfsprogramm fetchmail kann Emails von einem externen Email-Provider abholen, das Programm procmail legt sie (gegebenenfalls mit selbst definierten Spam-Filtern) in einer passenden Mailbox ab. Mit mutt selbst können die Emails gelesen und Mailboxen verwaltet werden, lynx dient zum Betrachten von HTML-Emails. msmtp kommt als Hilfsprogramm zum Verschicken eigener Emails zum Einsatz.

Vor dem ersten Start sollte zunächst im Home-Verzeichnis ~ ein Mail- und ein .tmp-Ordner für Mailboxen und temporäre Dateien angelegt werden: 
