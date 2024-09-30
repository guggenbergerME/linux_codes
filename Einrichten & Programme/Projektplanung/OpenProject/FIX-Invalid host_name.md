# FIX Invalid host_name

Beginnend mit OpenProject 14.3 ist die Hostname-Kontrolle strenger geworden (siehe config/environments/production.rb:182 ff.). 
OpenProject hinter einem Apache-Reverse-Proxy kann dazu führen, dass die Anfrage mit verschiedenen Quellen-Hostnamen erfolgt, 
aber der Standard ist es bisher, nur die OPENPROJECT_HOST__NAMEUmgebungsvariablen auf den öffentlichen Hostnamen, der von Apache bedient wird. Um dies zu lösen

## Apach Status prüfen
```
systemctl reload apache2.service
```

## Anpassen der Konfiguration

öffnen der Datei
```
 /etc/openproject/conf.d/other
```
ersetzen der Zeile
```
export OPENPROJECT_ADDITIONAL__HOST__NAMES=
```
durch 
```
export OPENPROJECT_ADDITIONAL__HOST__NAMES=["127.0.0.1:6000"]
```

Neustart des ganzen Systems

## Konfig ausführen

Nachfolgender Befehl setzt alles wieder zurück

```
openproject configure
```

## Beispiel Config

```
export OPENPROJECT_INSTALLATION__TYPE="packager"
export OPENPROJECT_ADDITIONAL__HOST__NAMES=["127.0.0.1:6000"]
export OPENPROJECT_SMTP__OPENSSL__VERIFY__MODE=none
export SERVER_PATH_PREFIX_PREVIOUS="/"
export SYS_API_KEY="APWYDhVewHO5mUR7c5TCW1rOrGf7b5ly"
export SVN_REPOSITORIES=""
export GIT_REPOSITORIES=""
export OPENPROJECT_SEED_ADMIN_USER_MAIL="tobiasguggenberger1977@gmail.com"

export EXECJS_RUNTIME="Node"
export OPENPROJECT_RAILS__CACHE__STORE="memcache"
export OPENPROJECT_ATTACHMENTS__STORAGE__PATH="/var/db/openproject/files"
export HOST="127.0.0.1"
export WEB_TIMEOUT="300"
export SECRET_KEY_BASE="e4cf40670d1dba0415cade9cb1a6ca7b1bb0d5e68a4eda07eefc4f82d6dadc4cc0413fe889b4b1825f734da6ff1efec3b55f7eedc40cdac117181122972b4f4d"
export SECRET_TOKEN="e4cf40670d1dba0415cade9cb1a6ca7b1bb0d5e68a4eda07eefc4f82d6dadc4cc0413fe889b4b1825f734da6ff1efec3b55f7eedc40cdac117181122972b4f4d"
export RECOMPILE_RAILS_ASSETS=""""
export OPENPROJECT_ADDITIONAL__HOST__NAMES=["127.0.0.1:6000"]
export OPENPROJECT_HTTPS="false"
export OPENPROJECT_HSTS="false"
```
Änderung in der Config vornehmen und Server neu starten.


## Problem mit öffnen in neuen Tabs
```
set OPENPROJECT_HTTPS=true
```

Änderung in der Config vornehmen und Server neu starten.
