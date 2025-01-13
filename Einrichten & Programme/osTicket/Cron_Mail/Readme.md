# Cron einrichten

## Ordner der cron.php
Struktur unter Debian
```
/var/www/html/upload/api/cron.php
```

## PHP Pfad
PHP Pfad suchen
```
find / -name 'php.ini' 2> /dev/null
```
```
/etc/php/8.1
```

## Crontab

Crontab öffnen mit ```crontab -e```

Beispiel
```
*/2 * * * * www-data /usr/bin/php /var/www/html/osticket/api/cron.php
```
