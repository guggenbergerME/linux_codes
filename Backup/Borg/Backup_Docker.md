# backup server 


Es wird empfohlen, Borg auf dem Backup-Rechner zu installieren. Folgen Sie [diesem Guide](https://borgbackup.readthedocs.io/en/stable/installation.html#installation).

Für dieses Beispiel lassen Sie es einfach lokal installieren. Auf meinem Laptop, der auf Ubuntu bionic läuft, ist es so einfach wie:
```
sudo apt install borgbackup
borg --version
```  
Der Container, der Backups sendet, benötigt einen SSH-Zugriff auf den Backup-Server. Erstellen wir ein neues ssh Schlüsselpaar auf der Maschine, in dem Ihre Container laufen. Dieser muss ohne Passphrase sein, da er in einem Cron verwendet wird.
```  
ssh-keygen -f ~/.ssh/id_rsa_borg_backup -t rsa -N ''
```  
Jetzt - auf Ihrem Server - Autorisieren Sie diesen Schlüssel.
```  
touch ~/.ssh/authorized_keys
chmod g-w ~
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```  
Kopieren Sie den Inhalt des öffentlichen Schlüssels am Ende der Datei **.ssh/authorized-keys**.

Wenn das gesamte Setup in Lokal ist, macht es das einfach:
```  
cat ~/.ssh/id_rsa_borg_backup.pub >> ~/.ssh/authorized_keys
```  
Natürlich stellen Sie sicher, dass Sie einen ssh-Server auf Ihrem Server haben.
```  
sudo apt install openssh-server
```  
