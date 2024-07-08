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

Durch :0 wird jeweils eine Filterregel eingeleitet. Anschliessend wird die eingehende Email auf ein Muster geprüft; beispielsweise würde * ^From: .*Max Mustermann bedeuten, dass für alle Emails mit „Max Mustermann“ im Absender die darauf folgende Aktions-Zeile ausgeführt wird. Die Zeile :0 a in der ersten Filterregel bedeutet, dass zusätzlich die Aktionszeile der vorherigen Regel erfolgreich abgeschlossen worden sein muss.

Eine ausführliche Beschreibung von Filterregeln findet sich beispielsweise [hier](https://www.trash.net/wissen/e-mail-2/procmail-howto/).

In der Datei ~/.muttrc wird das Verhalten von Mutt über eine Vielzahl möglicher Konfigurationen festgelegt. Dabei können Pfade, Tastenbelegungen, Farben, Verschlüsselungs-Einstellungen usw. angepasst werden. Die Datei kann beispielsweise so aussehen:

```
# Datei .muttrc

# ---------------------------------------------------------------------------------------
# PFADEINSTELLUNGEN
# ---------------------------------------------------------------------------------------

# Pfad für Adressbuch-Datei festlegen:
set alias_file=     "~/.mutt/addressbook"
source              "~/.mutt/addressbook"

# Standard-Mailbox für eingehende Emails:
set spoolfile='+default'

# Gelesene Emails nach "inbox-JAHR" im Mail-Ordner verschieben:
# (beispielsweise "inbox-2018" für Emails aus dem Jahr 2018)
set mbox="+inbox-`date +%Y`"

# Gesendete Emails nach "sent-JAHR" im Mail-Ordner verschieben:
set record="+sent-`date +%Y`"

# Email-Entwürfe in der Mailbox "Entwuerfe" speichern:
set postponed="+Entwuerfe"

# Pfad für temporäre Dateien festlegen:
set tmpdir=~/.tmp

# ---------------------------------------------------------------------------------------
# TASTENKOMBINATIONEN
# ---------------------------------------------------------------------------------------

# Mails durch Drücken von "A" vom Provider abholen und dort löschen:
macro index,pager A "!fetchmail -m 'procmail -d %T'\r"

# Alternativ: Mails durch Drücken von "A" vom Provider abholen und dort belassen (keep and verbose):
# macro index,pager A "!fetchmail -kv -m 'procmail -d %T'\r"

# Ausgewählte Mail lesen:
bind browser <Enter> view-file

# HTML-Mails durch Drücken von "l" mit lynx betrachten:
macro pager,attach l "<pipe-entry>lynx -stdin -force_html<enter>"

# Emails durch Drücken von "f" weiterleiten:
bind index,pager f forward-message

# An alle Empfänger einer Email mit "R" antworten:
bind index,pager R group-reply


# ---------------------------------------------------------------------------------------
# ALLGEMEINE EINSTELLUNGEN
# ---------------------------------------------------------------------------------------

# Alle Header-Infos grundsätzlich ausblenden:
ignore *

# Folgende Header-Infos jedoch erlauben:
unignore      from: subject to cc mail-followup-to \
    date x-mailer x-url list-id

# Format für das Zitieren der Original-Mail in einer Antwort-Email
# ("Am DATUM schrieb ABSENDER:")
set attribution="* %n <%a> [%(%d.%m.%Y %H:%M)]:"

set nobeep                # Keine akustischen Signale bei neuen Nachrichten
set copy=yes              # Gesendete Emails immer speichern (in der Mailbox sent-JAHR)
set delete=yes            # Als gelöscht markierte Emails beim Beenden löschen (ohne Nachfrage)
set editor='vim'          # Oder ein anderer Editor, beispielsweise 'nano'
set fast_reply            # Beim Antworten auf eine Email sofort den Editor öffnen
set followup_to           # In Betreff und Email-Header "Follow up"-Markierungen setzen
set help=no               # Hilfe-Zeilen ausblenden (um den ganzen Platz des Terminal-Fensters zu nutzen)
set include=ask-yes       # Jedes mal nachfragen, ob beim Antworten die Original-Mail zitiert werden soll

set move=yes              # Gelesene Nachrichten nach inbox-JAHR verschieben
set nosave_empty          # Keine leeren Email-Entwürfe speichern
set pager_index_lines=6   # Beim Lesen von Emails mittels ENTER 6 Zeilen für Pager reservieren
set pager_stop            # Beim Lesen von Emails mittels ENTER ein Scrollen in die nächste Email verhindern
set read_inc=25           # Fortschritts-Anzeige beim Lesen von Mailboxen einblenden
set reply_to              # Zieladresse bei Antwort-Emails automatisch erkennen

set reply_regexp="^((re([\[^-][0-9]+\]?)*|Re|aw|antwort|antw|wg):[ \t]*)+"

set reverse_alias         # Namen von Email-Absendern anhand des Adressbuchs ~/.mutt/addressbook anzeigen

set send_charset="us-ascii:iso-8859-1:iso-8859-15:iso-8859-2:utf-8"

set smart_wrap            # Besserer Zeilenumbruch
set sort=threads          # Emails nach in Thread-Reihenfolge anzeigen
set sort_aux=date-sent    # Emails innerhalb von Threads nach dem Datum sortieren
set strict_threads        # Bei Threading auf In-Reply-To-Header achten, nicht auf Betreff
set weed=yes              # Standard.. :)
set wrap_search=yes       # Im Index-Modus Suche erneut von vorne zulassen

auto_view text/html       # Diesen MIME-Type standardmäßig anzeigen


# ---------------------------------------------------------------------------------------
# PERSOENLICHE EINSTELLUNGEN
# ---------------------------------------------------------------------------------------

my_hdr From:        "VORNAME NACHNAME" <EMAIL@ADRESSE.de>
my_hdr Reply-To:    "VORNAME NACHNAME" <EMAIL@ADRESSE.de>
set realname=       "VORNAME NACHNAME"
set signature=      "+.signature"

# Einstellungen für den Standard-Ordner:
folder-hook . "set from='VORNAME NACHNAME  <EMAIL@ADRESSE.de>'"
folder-hook . "set index_format='%4C %Z %{%b %d} %-15.15L (%4l) %s'"
folder-hook . "set sendmail='/usr/bin/msmtp --account=default'"


# ---------------------------------------------------------------------------------------
# FARBEN
# ---------------------------------------------------------------------------------------

# Aussehen von Mutt:

color     tree            brightmagenta     default
color     attachment      magenta           default
color     error           red               default
color     header          brightyellow      default   "^Subject: "
color     header          white             default   "^To:"
color     hdrdefault      yellow            default
color     indicator       black             white
color     markers         brightblue        default
color     message         white             default
color     normal          white             default
color     quoted          yellow            default
color     quoted1         green             default
color     quoted2         cyan              default
color     quoted3         red               default
color     signature       brightblack       default
color     status          brightyellow      blue
color     search          default           green

# Highlighting von Emails (abhängig von der "Punktezahl" einer Email):

# Mögliche Muster zur Punktevergabe:
# ~f ABSENDER     : Betrifft alle Emails, die vom ABSENDER geschickt wurden ("from")
# ~t EMPFAENGER   : Betrifft alle Emails, die an EMPFAENGER geschickt wurden ("to")
# ~s BETREFF      : Betrifft alle Emails, die BETREFF in der Betreff-Zeile enthalten ("subject")

# Reguläre Ausdrücke als Suchmuster:
# .       : Ein beliebiges Zeichen
# *       : Der vorherige Ausdruck Null mal oder beliebig oft
# [aA]    : Eines der in der Klammer enthaltenen Zeichen (a oder A)


# Alle Emails bekommen zunächst 0 Punkte:
unscore *

# Beispiel 1: 10 Punkte an alle Emails vergeben, die "grund-wissen" im Empfänger-Namen enthalten:
score '~t .*@grund-wissen.*' +10

# Beispiel 2: 25 Punkte an alle Emails vergeben, die "sphinx" in der Betreff-Zeile enthalten:
score '~s .*sphinx.*'      +25


# Zum Beispiel 1: Alle Emails mit einer Punktezahl von 10-20 hellrot hervorheben:
color index brightred default '~n 10-20'

# Zum Beispiel 2: Alle Emails mit einer Punktezahl von 25-29 blau hervorheben:
color index blue default      '~n 25-29'
```

In der obigen Beispiel-Konfigurationsdatei sollten die in Großbuchstaben gesetzten Variablen durch eigene Angaben ersetzt werden; lediglich die Variable JAHR wird automatisch anhand des aktuellen Datums gesetzt. Zudem sollte der zum Schreiben von Emails bevorzugte Editor festgelegt werden.

Damit die Mailboxen im Verzeichnis ~/Mail automatisch erkannt werden, sollte zudem folgender Eintrag zu den Pfadeinstellungen in der Datei ~/.muttrc hinzugefügt werden:

```
# Mailboxen automatisch finden:
mailboxes $(find ~/Mail/ -maxdepth 0 -type d -printf "%p)
```

Optional können durch eine Vergabe von Punkten auf bestimmte Muster im Absenderfeld oder in der Betreffzeile Emails von einzelnen Personen, Unternehmen oder Mailinglisten automatisch farblich hervorgehoben werden. Als Farben sind red, green, blue, yellow, cyan, magenta erlaubt, wobei durch die Nachrichten bei einem voran gestellten bright zusätzlich fett gedruckt erscheinen: Beispielsweise steht brightgreen für „grün“ und „fettgedruckt“.

Das Prinzip der Punktevergabe ist simpel; man muss lediglich darauf achten, dass die einkommenden Emails nicht mehrfach Punkte erhalten, beispielsweise weil sie das Wort „Python“ sowohl in der Emailadresse wie auch in der Betreffzeile enthalten. Sollten beide Muster beispielsweise mit 5 Punkten gewertet werden, so bekäme die Email insgesamt 10 Punkte und könnte dadurch gegebenenfalls eine andere Farbe bekommen.

## Bedienung von Mutt

Startet man Mutt (durch Eingabe von mutt in einer Shell), so werden bei Verwendung der obigen Einstellungen die Emails der ~/Mail/default-Mailbox aufgelistet. Dieser Ansichtsmodus von Mutt wird „Index“ genannt. Wird Mutt zum ersten Mal gestartet, ist die Index-Ansicht normalerweise leer.

### Index-Modus

Im Index-Modus können folgende Funktionen mit der obigen Konfiguration durch Drücken der jeweiligen Taste aufgerufen werden:

    Email abrufen und zwischen Emails navigieren:
    A 	Emails vom Provider abrufen
    a 	Absender der Email unter dem Cursor ins Adressbuch aufnehmen
    ? 	Hilfe einblenden
    \downarrow oder j 	Zur nächsten Email gehen
    \uparrow oder k 	Zur vorherigen Email gehen
    HOME 	Zur ersten Email gehen
    END 	Zur letzten Email gehen
    q 	Mutt beenden („quit“)

    Zudem kann man mit PageUP und PageDown die Emails seitenweise durchblättern.

    Emails schreiben, beantworten und weiterleiten:
    m 	Neue Email verfassen („mail“)
    r 	Auf Email unter dem Cursor antworten (nur dem Absender) („reply“)
    R 	Auf Email unter dem Cursor antworten (allen Empfängern) („group reply“)
    f 	Email unter dem Cursor weiterleiten („forward“)

    Zum Schreiben der Emails wird automatisch der in der Konfigurationsdatei festgelegte Editor geöffnet. Speichert man dort die verfasste Email und beendet den Editor, kehrt man automatisch zu Mutt zurück.

    Emails markieren, löschen, verschieben, kopieren:
    d 	Email unter dem Cursor löschen („delete“)
    u 	Löschmarkierung unterhalb des Cursor aufheben („undelete“)
    t 	Email unter dem Cursor mit einer Markierung versehen („tag“)
    D 	Emails nach bestimmtem Muster löschen („delete by pattern“)
    U 	Löschmarkierungen nach bestimmtem Muster aufheben („undelete by pattern“)
    T 	Emails nach bestimmtem Muster mit einer Markierung versehen („tag by pattern“)
    w 	
    Status der Email-Adresse anpassen
    (O: Old, N: New, D: Delete, r: Responded , *: Tagged, ! : Important)
    C 	Email unter dem Cursor in eine andere Mailbox kopieren („copy“)
    s 	Email unter dem Cursor in andere Mailbox abspeichern/verschieben („save“)

    Ist die Option set move=yes in der Konfigurationsdatei aktiviert, werden gelesene Emails automatisch beim Beenden von Mutt von der default-Mailbox in die mbox-Mailbox (bei obigen Einstellungen beispielsweise inbox-2018) verschoben. Möchte man eine Email jedoch noch in der (meist deutlich kleineren) Mailbox default behalten, so kann man sie mittels w o wieder als ungelesen markieren.

    Tip: Um mehrere Emails auf einmal in eine andere Mailbox zu verschieben, markiert man mittels t zunächst die einzelnen Emails. Anschließend kann man mittels Eingabe von ; den darauf folgenden Befehl auf alle markierten Emails anwenden; beispielsweise können durch ;s alle markierten Emails in eine auszuwählende Mailbox verschoben werden.

    Emails durchsuchen:
    / 	Nach Emails suchen
    n 	Zur nächsten Email gehen, auf welche die Suche zutrifft
    N 	Rückwärts zur nächsten Email gehen, auf welche die Suche zutrifft

    Bei der Suche mittels /Suchbegriff werden nur die Email-Header, also insbesondere das Absenderfeld und die Betreffszeile durchsucht.

    Möchte man auch den Inhalt der Mails durchsuchen, kann man / ~b Suchbegriff eingeben („search bodies“).

    Mit c kann man zwischen verschiedenen Mailboxen wechseln. Wahlweise kann man den Namen der zu öffnenden Mailbox angeben, oder durch Eingabe von c ? diese im erscheinenden Datei-Browser auswählen.

Bei mehreren der obigen Funktionen wird vom Benutzer eine weitere Eingabe von Text in der Eingabezeile (unten am Bildschirm) erwartet. Um diesen „Eingabe-Modus“ abzubrechen und wieder zum normalen Index zurückzukehren, muss man (etwas gewöhnungsbedürftig) Ctrl g drücken.

### Pager-Modus

Drückt man im Index-Modus Leertaste oder Enter, so wird der Inhalt der Email im so genannten Pager-Fenster angezeigt. In diesem kann man mit den Pfeiltasten oder PageUp und PageDown durch den Inhalt der Email scrollen. Durch Drücken von q gelangt man zurück in den Index-Modus. Mittels r kann man die aktuelle Email unmittelbar beantworten oder mittels d löschen; Mutt zeigt dann automatisch die nächste Email im Pager an.

Anhänge von Emails können im Pager-Modus mittels v angezeigt werden. Mit den Cursor-Tasten kann dann ein Anhang ausgewählt und mittels s gespeichert werden. Mutt speichert den Anhang dabei in dem Verzeichnis, aus dem heraus Mutt aufgerufen wurde; es kann allerdings auch manuell ein anderer Pfad angegeben werden.

Der in Mutt integrierte Pager unterstützt von sich aus keine HTML-Emails. Man kann sich jedoch leicht behelfen, indem man lynx als Pager für HTML-Emails nutzt. Bei den obigen Einstellungen kann die aktuelle Email vom Pager aus mit lynx durch Drücken von l betrachtet werden. Dabei kann PageUp und PageDown für ein seitenweises Durchblättern der Email, oder Ctrl p und Ctrl n für ein zeilenweises Scrollen verwendet werden. Mit Q oder q wird lynx wieder beendet.[1] Als Alternative dazu kann eine HTML-Email auch wie ein Anhang gespeichert und mit Firefox oder einem anderen Webbrowser geöffnet werden.

Compose-Modus

Hat man mit dem Editor eine Email verfasst und den Editor wieder beendet, so gelangt man in das so genannte „Compose“-Fenster. Hier können folgende Funktionen durch Drücken der jeweiligen Taste aufgerufen werden:
s 	Text in Betreffszeile ändern („subject“)
Esc f 	Text im Absender-Feld ändern („from“)
c 	Weitere für alle sichtbare Empfänger hinzufügen („copy“)
b 	Versteckte Empfänger hinzufügen („blind copy“)
p 	PGP-Verschlüsselungs-Einstellungen vornehmen
a 	Anhänge an die Email hinzufügen („append“)
\downarrow oder j 	Zum nächsten Anhang gehen
\uparrow oder k 	Zum vorherigen Anhang gehen
Enter 	Emailtext beziehungsweise Anhang im Pager betrachten
e 	Emailtext beziehungsweise Anhang mit Editor öffnen („edit“)
D 	Als Anhang vorgesehene Datei wieder löschen („delete“)
y 	Email versenden

Durch Drücken der Tab-Taste werden eingegebene Email-Adressen jeweils anhand des Adressbuchs vervollständigt, mittels Ctrl g kann die Eingabe abgebrochen werden.








