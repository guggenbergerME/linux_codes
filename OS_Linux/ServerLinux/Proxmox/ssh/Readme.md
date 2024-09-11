# SSH aktivieren LXC

```
sudo nano /etc/ssh/sshd_config
```

Anpassen der sshd_config

```
# Anpassung des Wertes auf folgenden Wert
PermitRootLogin yes
```

ssh restart

```
sudo service ssh restart
```
