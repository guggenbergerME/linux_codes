# Wireguard Tunnel

### Wireguard insallieren
```
sudo add-apt-repository PPA:wireguard/wireguard
```
```
sudo apt-get update
```
```
sudo apt-get install wireguard
```

Die Installation von wireguard-tools legt das Konfigurationsverzeichnis /etc/wireguard/ mit den zweckmäßigen Berechtigungen an. Kontrolle:
```
ls -ld /etc/wireguard/
```
mit der Ausgabe
```
drwx------ 2 root root 4096 Jun  4 07:56 /etc/wireguard/
```
