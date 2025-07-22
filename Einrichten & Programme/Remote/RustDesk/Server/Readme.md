# Rustdesk Server Docker Installation

```
sudo docker image pull rustdesk/rustdesk-server
sudo docker run --name hbbs -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbs
sudo docker run --name hbbr -v ./data:/root -td --net=host --restart unless-stopped rustdesk/rustdesk-server hbbr
```
## Ports bei der Firewall freigeben

Folgende Ports werden verwendet

    21114 TCP for web console, only available in Pro version
    21115 TCP for NAT type test
    21116 TCP TCP hole punching
    21116 UDP heartbeat/ID server
    21117 TCP relay
    21118/21119 TCP for web socket if you want to run web client

## Public Key anzeigen
Docker installiert den Key unter **/root/data**

        cat id_XXXXXXX.pub 
