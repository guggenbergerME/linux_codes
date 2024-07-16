# Datensicherung
Datenbank und Daten von osTicket sichern

```
cp -r /var/www/deinosTicketOrdner /backup_osticket/
mysqldump -u root -p name_der_osticket_db > /backup_osticket/Backupname.sql
rm -r /var/www/deinosTicketOrdner
```
