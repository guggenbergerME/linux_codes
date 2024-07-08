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

```
mkdir ~/Mail ~/.tmp
```

## Anpassen der Konfigurationsdateien

Anschließend sollten die Konfigurationsdateien der einzelnen Programme angelegt und mit grundlegenden Inhalten gefüllt werden:

In der Datei ~/.fetchmailrc werden die zum Abholen der Emails nötigen Informationen abgelegt:

```
# Datei .fetchmailrc

poll EMAIL-HOST protocol pop3 user "EMAIL@ADRESSE.DE" password "GEHEIM" ssl
```
Der Email-Host ist beispielsweise pop.gmx.net. In jeder Zeile der Datei ~/.fetchmailrc kann ein neuer Eintrag stehen für das Abholen von Emails stehen, so dass damit ein zentrales Abholen der Post auch von mehreren Email-Konten einfach möglich ist. Als Protokoll kann anstelle von pop3 auch imap verwendet werden (mit passendem Host, beispielsweise imap.gmx.net).

Da in der Datei .fetchmailrc das Email-Passwort im Klartext enthalten ist, darf die Datei nur Lese- und Schreibrechte für den Eigentümer haben. Dazu gibt man folgendes ein:

```
chown 600 ~/.fetchmailrc
```

Ebenso ist es möglich, die Datei auf einer :verschlüsselten Partition oder einem verschlüsselten USB-Stick abzulegen und im Home-Verzeichnis einen Symlink dorthin zu erstellen.

In der Datei ~/.msmtprc werden die zum Versenden der Emails nötigen Informationen angegeben:

```
# Datei .msmtprc

defaults
auth             on
tls              on

account default
host EMAIL-HOST
port 587
from EMAIL@ADRESSE.de
user EMAIL@ADRESSE.de
password GEHEIM
tls_trust_file /etc/ssl/certs/ca-certificates.crt
auth login
```

Der Email-Host ist beispielsweise mail.gmx.net. Inzwischen verlangen viele Email-Provider eine SSL- oder TLS-Verschlüsselung für die Verbindung zwischen dem Host und dem Client; dies wird durch die obigen Konfigurationen als Standard festgelegt, wobei der genutzte Port bei verschiedenen Providern unterschiedlich sein kann (Infos hierzu werden jeweils vom Provider angegeben).

Für verschiedene Email-Konten können in der Datei ~/.msmtprc wiederum verschiedene Benutzer-Accounts angelegt werden. Der jeweilils passende Account wird beim Versenden einer Email automatisch anhand des From:-Eintrags der Email ausgewählt.

Auch in dieser Datei ist das Passwort im Klartext (allerdings ohne Anführungszeichen) enthalten. Auch diese Datei darf somit nur Lese- und Schreibrechte für den Eigentümer haben:

```
chown 600 ~/.msmtprc
```

In der Datei ~/.procmailrc sind die zum Verteilen („processing“) der Emails nötigen Informationen gespeichert. Diese Datei hat etwa folgende Syntax, wobei die mit # beginnenden Zeilen Kommentare darstellen und somit von procmail ignoriert werden:

```
# Datei .procmailrc

MAILDIR=$HOME/Mail/
LOGFILE=$HOME/.procmaillog
LOGABSTRACT=no
VERBOSE=off
FORMAIL=/usr/bin/formail
NL=''

# Doppelt gesendete Mails mittels formail abfangen
:0 Whc: .msgid.  lock
| $FORMAIL -D 16384 .msgid.cache
:0 a
$MAILDIR/duplicates

# Spam nach Absender aussortieren
:0
* ^Sender:.*(video|price|addme)
$MAILDIR/spam

#Spam nach Betreff aussortieren
:0
* ^Subject:.*(credit|cheap|cash|money|debt|sale|loan)
$MAILDIR/spam

# Alle anderen Emails in die default-Mailbox ablegen:
:0
* .*
default
```







