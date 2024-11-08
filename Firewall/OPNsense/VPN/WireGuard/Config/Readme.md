# Config wg0.conf

Beispiel einer conf. Bitte Schnittstelle von WG und Interface ändern.

```
[Interface] 
PrivateKey = <site-2 private-key>
Address = 10.0.0.3/24
SaveConfig = true 
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

[Peer] 
PublicKey = <site-1 public-key>
Endpoint = <FQDN>:51820 
AllowedIPs = 10.0.0.0/24, 192.168.0.0/24
PersistentKeepalive = 25
```

