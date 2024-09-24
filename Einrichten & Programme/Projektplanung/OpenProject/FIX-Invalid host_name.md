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
