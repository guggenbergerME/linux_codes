# Proxmox Prozesse neustart

Login pder SSH

## Alle Service neu starten

```
killall -9 corosync
systemctl restart pve-cluster
systemctl restart pvedaemon
systemctl restart pveproxy
```
