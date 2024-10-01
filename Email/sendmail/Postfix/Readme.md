# Install Postfix

```
apt-get install postfix
```
Anweisungen der Abfrage folgen

## Domain konfigurieren

In der nachfolgenden Datei

```
nano /etc/postfix/main.cf
```
nach dem hostname suchen und anpassen

```
myhostname = m3.example.com
```
## SMTP Username und Passwort

```
nano /etc/postfix/sasl_passwd
```
Eingeben der SMTP Daten
```
[smtp.example.com] username:password
```

Sollte der Port abweichen die Eingaben mit dem Port erstezen ```[smtp.example.com]:585 username:password```

Erzeugen des Hash Files

```
/usr/sbin/postmap /etc/postfix/sasl_passwd
```
Das neu erzeugte File noch nutzbar machen

```
chown root:root /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
```

```
chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
```

## Konfigurieren des "Relay" Host
öffnen der Datei

```
nano /etc/postfix/main.cf
```

Suchen des Eintargs ``` relayhost  ``` und eingabe der SMTP Adresse mit passendem Port

```
relayhost = [smtp.example.com]:587
```

Am ende der Datei noch folgende Konfiguration anfügen

```
# enable SASL authentication
smtp_sasl_auth_enable = yes
# disallow methods that allow anonymous authentication.
smtp_sasl_security_options = noanonymous
# where to find sasl_passwd
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
# Enable STARTTLS encryption
smtp_use_tls = yes
# where to find CA certificates
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
```

## Postfix neu starten

```
/usr/sbin/postfix reload
```

## Emailversand testen

```
echo "Hier ist der Body - Das ist eine Testmail" | mail -s "Hier steht der Betreff" email@adresse.to
```




