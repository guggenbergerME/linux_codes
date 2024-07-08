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

zu finden.
