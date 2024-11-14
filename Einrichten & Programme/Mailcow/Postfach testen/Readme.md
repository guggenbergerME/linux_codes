# Mailcow Postfach testen

## SSL Login

```
 openssl s_client -connect imap-mail.outlook.com:993
 openssl s_client -starttls imap -connect imap-mail.outlook.com:143
```

## POP testen

```
telnet meinPOPServer 110
```
Positive Antwort
```
+OK Dovecot ready.
```
Login mit USER
```
USER emailadresse
```

## IMAP testen
```
telnet meinPOPServer 143
```

## Verschlüsselt testen

Mit Open-SSL verbindest du dich so: 
```
openssl s_client -connect IP:993
```
