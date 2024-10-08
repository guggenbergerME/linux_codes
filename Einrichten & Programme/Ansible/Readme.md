# Einrichtung

Damit für die Verbindung von Master auf Client kein Passwort eingegen werden muss, wird ein SSH-
Key für den root-Benutzer erstellt.

```
ssh-keygen -t rsa
```
Dieser Key wird nun dem root-Benutzer zugewiesen
```
ssh-copy-id root@localhost
```
