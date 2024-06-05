# Start OpenSSH Server

**Start**
```
sudo /etc/init.d/ssh start
```
oder 
```
sudo service ssh start
```

System **16.04/18.04/20.04 LTS**
```
sudo systemctl start ssh 
```

# Stop OpenSSH server

**Stop**
```
sudo /etc/init.d/ssh stop
```
oder
```
sudo service ssh stop
```
System **16.04/18.04/20.04 LTS**
```
sudo systemctl stop ssh
```

# Restart OpenSSH server

**Restart**
```
sudo /etc/init.d/ssh restart
```
oder
```
sudo service ssh restart
```
System **16.04/18.04/20.04 LTS**
```
sudo systemctl restart ssh
```

# Status anzeigen

**Status**
```
sudo /etc/init.d/ssh status
```
oder
```
sudo service ssh status
```
oder systemd - System
```
sudo systemctl status ssh 
```
