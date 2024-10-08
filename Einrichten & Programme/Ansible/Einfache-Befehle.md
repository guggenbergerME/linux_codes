# Ansible - einfache Befehle

## Auslesen der Uptime.
```
ansible testserver -i hosts -m command -a uptime
```
->
```
testserver | SUCCESS | rc=0 >>
08:58:17 up 44 min, 1 user, load average: 0.00, 0.02, 0.0
```

Dabei wird das Module command aufgerufen und als Argument uptime übergeben.

## Update ausführen

```
ansible all -i hosts -m command -a "apt update -y"
```
