# AdGuard auf der OPNsense

## Installation
login per ssh auf der FW und wechseln in das Terminal mit der Zahl ```8```.

```
fetch -o /usr/local/etc/pkg/repos/mimugmail.conf https://www.routerperformance.net/mimugmail.conf
```

anschliessend ein

```
pkg update
```

Nun ist das entsprechnende Paket im Bereich

```
System / Pakete / Erweiterungen / os-adguardhome-maxit
```

zu finden. Dieses Paket nun aktivieren!

## AdGuard setup

AdGuard nun aktivieren
```
Dienste / Adguardhome / Allgemein
```

### DNS Setup

Da DNS standardmäßig auf Port 53 lauscht, möchten wir, dass AdGuard Home auch auf diesem Port lauscht, um uns das Leben zu erleichtern. Standardmäßig führt OPNsense auf diesem Port bereits Unbound aus. Wir müssen dies ändern, damit es nicht zu Konflikten kommt.

Navigieren Sie zu

```
Dienste / Unbound DNS / Allgmeine
```


Ändern Sie den Listen-Port in ```5353```

Aktivieren Sie Register DHCP leasesund Register DHCP static mappings.
Dadurch werden Hostnamen in AdGuard Home für uns aufgelöst.
Speichern Sie die Einstellungen.
