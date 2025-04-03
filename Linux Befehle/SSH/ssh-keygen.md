# SSH Keygen

## Schlüssel erzeugen

    ssh-keygen -t ed25519 -C "glt default"

Ed25519 ist ein Public-Key-Signaturalgorithmus, der auf elliptischen Kurven basiert. Er wird häufig für die Authentifizierung von SSH-Verbindungen verwendet. 

## Schlüssel auf Server kopieren

Kopieren des Public Key auf den entfernten Server

    ssh-copy-id -i ~/.ssh/id_ed25519.pub [IP]
