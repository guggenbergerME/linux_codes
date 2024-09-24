# Zabbix Installiere eine neue Sprache

Zuerst müssen wir eine neue Sprache auf dem Zabbix Server Linux installieren.

Verwenden Sie auf der Linux-Konsole die folgenden Befehle, um die installierten Sprachen aufzulisten.
```
# locale -a
```
```
C
C.UTF-8
en_US.utf8
POSIX
```
In unserem Beispiel wurde standardmäßig nur die englische Sprache installiert.

Verwenden Sie den folgenden Befehl, um alle verfügbaren Sprachen aufzulisten.
```
cat /usr/share/i18n/SUPPORTED
```
Sehen Sie sich den Inhalt der UNTERSTÜTZTEN Datei an und wählen Sie die gewünschte Sprache.

Verwenden Sie den folgenden Befehl, um eine neue Sprache zu installieren.

Nachdem Sie eine neue Sprache installiert haben, müssen Sie den Apache-Dienst neu starten.
```
locale-gen pt_BR.UTF-8
```
```
service apache2 restart
```
Mit dem folgenden Befehl kann anstelle des Befehls locale-gen eine neue Sprache installiert werden.

```
dpkg-reconfigure locales
```

Wählen Sie die neue Sprache über die grafische Benutzeroberfläche.

Nachdem Sie eine neue Sprache installiert haben, müssen Sie den Apache-Dienst neu starten.
```
service apache2 restart
```
In unserem Beispiel wurde der Befehl locale-gen verwendet, um die brasilianische Sprache zu installieren.
Die können jetzt das Zabbix-Server-Dashboard verwenden, um die Sprache der Weboberfläche zu ändern.
