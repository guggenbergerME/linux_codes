# Proxmox Server installieren

## Netzwerkonfiguration

Netzwerk Konfiguration anzeigen

        ip link show

LAN-Anschluss aktivieren

Wenn die Schnittstelle bereits konfiguriert ist:

        ifup enoX

Bearbeiten Sie die Datei /etc/network/interfaces

```
auto vmbr0
iface vmbr0 inet static
        address XX.XX.XX.XX/XX
        gateway XX.XX.XX.XX
        bridge-ports [LAN]
        bridge-stp off
        bridge-fd 0
        bridge-vlan-aware yes
        bridge-vids 2-4094
```
## Netzwerk neu starten

        systemctl restart network-online.target

## System neu starten

        shutdown -r now
