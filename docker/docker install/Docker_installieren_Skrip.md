# Docker per Script installieren

```
curl -sSL https://get.docker.com | sh
```

```
sudo usermod -aG docker $(whoami)
```

## Änderungen aktivieren
Aus- / Einloggen

## Docker installieren proxmox

Docker im Container installieren

Zuerst aktualisieren wir die Paketquellen mit
```
apt-get update
```
Anschließend werden notwendige Pakete installiert, um das Docker-Repository über HTTPS zu nutzen
```
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```
Den offiziellen GPG-Key von Docker dem System hinzufügen
```
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
```
Die erfolgreiche Prüfung des GPG-Keys sollte wie folgt aussehen:
```
root@DockerTest:~# apt-key fingerprint 0EBFCD88
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```
Anschließend wird das stable-Docker-Repository hinzugefügt:
```
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
```
Jetzt nochmal die Paketquellen aktualisieren:
```
apt-get update
```
Und dann Docker installieren, wobei die neue Container-Runtime containerd verwendet wird:
```
apt-get install docker-ce docker-ce-cli containerd.io
```
Wenn alles erfolgreich installiert wurde, sollte es ungefähr so aussehen:
```
root@DockerTest:~# service docker status
* docker.service - Docker Application Container Engine
   Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2021-02-11 21:47:31 UTC; 27s ago
     Docs: https://docs.docker.com
 Main PID: 8347 (dockerd)
    Tasks: 9
   Memory: 101.8M
   CGroup: /system.slice/docker.service
           `-8347 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock
 
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.676485035Z" level=warning msg="Your kernel does not support cgroup blkio weight_device"
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.677331494Z" level=info msg="Loading containers: start."
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.850581966Z" level=info msg="Default bridge (docker0) is assigned with an IP address 172.17.0.0/16. D
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.851135398Z" level=warning msg="unable to disable IPv6 router advertisement" error="open /proc/sys/ne
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.851159374Z" level=warning msg="unable to disable IPv6 router advertisement" error="open /proc/sys/ne
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.945945308Z" level=info msg="Loading containers: done."
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.990029740Z" level=info msg="Docker daemon" commit=46229ca graphdriver(s)=vfs version=20.10.3
Feb 11 21:47:30 DockerTest dockerd[8347]: time="2021-02-11T21:47:30.990156263Z" level=info msg="Daemon has completed initialization"
Feb 11 21:47:31 DockerTest systemd[1]: Started Docker Application Container Engine.
Feb 11 21:47:31 DockerTest dockerd[8347]: time="2021-02-11T21:47:31.078816699Z" level=info msg="API listen on /var/run/docker.sock"
```
Mit der Installation von Docker unter Proxmox sind jetzt die Voraussetzungen für einen sehr flexiblen Docker-Host geschaffen worden. Diesen werden wir in weiterführenden Beiträgen um Standarddienste erweitern, um die Verwaltung und Konfiguration weiterer Dienste und Anwendungen so einfach wie möglich durchführen zu können.

Dazu gehören unter anderem Portainer und ein Reverse Proxy (nginx).
