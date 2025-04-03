# SSH Keygen

## Schlüssel erzeugen

    ssh-keygen -t ed25519 -C "glt default"

Ed25519 ist ein Public-Key-Signaturalgorithmus, der auf elliptischen Kurven basiert. Er wird häufig für die Authentifizierung von SSH-Verbindungen verwendet. 

## Schlüssel auf Server kopieren

Kopieren des Public Key auf den entfernten Server

    ssh-copy-id -i ~/.ssh/id_ed25519.pub [IP]

Nach Eingabe des Zugangsdaten erscheint nun folgende Meldung

```
Number of key(s) added: 1

Now try logging into the machine, with:   "ssh '[IP]'"
and check to make sure that only the key(s) you wanted were added.
```

## Serververbindung mit bestimmten Key

    ssh -i ~/.ssh/ansible [ID]

### Tutorials und Video
+ [YT SSH Setup](https://youtu.be/-Q4T9wLsvOQ?list=PLT98CRl2KxKEUHie1m24-wkyHpEsa4Y70)
