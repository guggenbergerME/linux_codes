# Daten in einen Dockercontainer kopieren

## Daten IN einen Docker Container kopieren
```
docker cp /var/tmp/myfile.dmp NAMEDOCKERCONTAINER:/var/tmp/myfile.dmp
```

## Daten AUS einen Docker Container kopieren
```
docker cp NAMEDOCKERCONTAINER:/var/tmp/myfile.dmp /var/tmp/myfile.dmp
```
