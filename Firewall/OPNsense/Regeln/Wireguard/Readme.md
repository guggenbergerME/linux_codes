# Wireguard Site to Site

## Gegeben

```
SITE A                  SITE B

172.16.0.0/24           192.168.0.0/24

Wireguard Transfer Net
10.2.2.0/24

öffentliche IP
203.0.113.1             203.0.113.2
```
## Verkehr zwischen Standort A LAN-Netz und Standort B LAN-Netz zulassen

Gehen Sie zu OPNsense Site A ```Firewall ‣ Regeln ‣ LAN A``` und fügen Sie eine neue Regel hinzu.

### Links
+ [Detalierte Erklärung](https://docs.opnsense.org/manual/how-tos/wireguard-s2s.html)
