# FHEM Docker installation

```
docker pull fhem/fhem
```

## Fhem starten

```
    docker run -d --name fhem --restart unless-stopped -p 8083:8083 -v [PFAD-WORKSPACE]:/opt/fhem ghcr.io/fhem/fhem-docker:4-bullseye
```

## fhem - fhem.cfg
Um die **fhem.cfg** direkt im web zu bearbeiten ist folgendes Attribut notwendig

```
attr WEB editConfig 1
```

## Einspielen der fhem.cfg
Sicherungskopien
```
https://github.com/guggenbergerME/linux_codes/tree/main/fhem/fhem.cfg
```
