# Struktur

```
IP Bereich 10.140
---> playbooks/140_hosts

IP Bereich 10.250
---> playbooks/250_hosts
```

## Update ausführen
```
ansible all -i 250_hosts -m command -a "apt update -y"
```
