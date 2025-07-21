# Passwort lokal erzeugen

## Erzeugen mit GPG

```
gpg --gen-random --armor 1 12
```

## pwgen
```
sudo apt-get install pwgen
```

### Beispiele

Erzeugt nur ein Passwort:

    pwgen -N 1 

Erzeugt äußerst sichere Passwörter, die aus Zahlen, Groß- und Kleinbuchstaben und Sonderzeichen bestehen und 12 Zeichen lang sind:

    pwgen -s -y 12 

Erzeugt Passwörter, die nur aus Kleinbuchstaben bestehen und 5 Zeichen lang sind:

    pwgen -0 -A 5 
