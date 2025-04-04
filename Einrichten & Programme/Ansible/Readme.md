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

## Ansible Test-VM einbinden

Damit Ansible Tasks in der Test-VM ausführen kann muss diese Ansible über ein Inventory(-File)
bekannt gemacht werden. Nähere Details zu Inventories folgen später, für den ersten Schritt wird ein
statisches Inventory-File namens hosts in einem Verzeichnis playbooks (welches in weiterer Folge alle
Playbooks enthält) erzeugt.

```
mkdir playbooks
cd playbooks
nano hosts
```

Im Hosts-File wird sowohl ein Name (oder eine IP-Adresse sowie Verbindungsparameter angeben,
sofern diese vom Standard abweichen).
IP-Adresse, Benutzer sowie Private Key werden nun in das hosts-File eingetragen.

```
nano hosts
```
Erster Eintrag

```
testserver ansible_ssh_host=[Ziel IP] ansible_ssh_user=root
```

## Verbindung testen
Das Überprüfen der Verbindung geht am einfachsten mittels des ansible ping-Kommandos.
Ansible versendet dabei keinen ping, sondern macht eine SSH-Verbindung.

```
ansible testserver -i hosts -m ping
```

## Ansible mit Github verbinden

- [Verbinden von Ansible mit Github](Einrichten & Programme/Github/ssh/github_ssh.md)

