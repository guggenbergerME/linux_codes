# sftp

## Verbindung mit SFTP

Standardmäßig verwendet SFTP das SSH-Protokoll, um eine sichere Verbindung zu authentifizieren und zu erstellen. Aus diesem Grund sind die gleichen Authentifizierungsmethoden verfügbar, die auch in SSH vorhanden sind.

Obwohl Passwörter einfach zu verwenden und standardmäßig eingerichtet sind, empfehlen wir Ihnen, SSH-Schlüssel zu erstellen und Ihren öffentlichen Schlüssel auf jedes System zu übertragen, auf das Sie zugreifen müssen. Dies ist wesentlich sicherer und kann Ihnen auf lange Sicht Zeit sparen.

Bitte sehen Sie sich diesen Leitfaden zur Einrichtung von SSH-Schlüsseln für den Zugriff auf Ihren Server an, wenn Sie dies noch nicht getan haben.

Wenn Sie über SSH eine Verbindung zu dem Rechner herstellen können, haben Sie alle notwendigen Voraussetzungen erfüllt, um SFTP zur Verwaltung von Dateien zu verwenden. Testen Sie den SSH-Zugriff mit dem folgenden Befehl:
```
ssh name@XXX.XXX.XXX.XXX
```
Wenn dies funktioniert, geben Sie zum Verlassen Folgendes ein:
```
exit
```
Jetzt können wir eine SFTP-Sitzung aufbauen, indem wir den folgenden Befehl ausgeben:
```
sftp name@XXX.XXX.XXX.XXX
```
Sie stellen eine Verbindung zum Remote-System her, und Ihre Eingabeaufforderung ändert sich in eine SFTP-Eingabeaufforderung.

Wenn Sie an einem benutzerdefinierten SSH-Port arbeiten (nicht dem Standard-Port 22), können Sie eine SFTP-Sitzung wie folgt öffnen:
```
sftp -oPort=custom_port name@XXX.XXX.XXX.XXX
```
Dadurch werden Sie über den von Ihnen angegebenen Port mit dem Remote-System verbunden.
