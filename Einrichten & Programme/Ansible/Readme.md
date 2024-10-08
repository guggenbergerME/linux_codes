# Einrichtung

Damit für die Verbindung von Master auf Client kein Passwort eingegen werden muss, wird ein SSH-
Key für den root-Benutzer erstellt.

```
ssh-keygen
```
Wenn der Schlüssele erstellt wurde kann dieser dem Zielsystem zugewiesen werden. Achten Sie darauf das auf dem Zielsystem ssh aktiviert ist. ([SSH auf Proxmox aktivieren](https://github.com/guggenbergerME/linux_codes/blob/main/OS_Linux/ServerLinux/Proxmox/ssh/Readme.md))

```
ssh-copy-id root@[IP]
```
