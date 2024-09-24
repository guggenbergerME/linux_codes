# Fehler -> Die Polling-Url beginnt nicht mit HTTPS

Docker Container
```
docker exec -it <mycontainer> sh
```

Änderung in der config.php
```
  'overwrite.cli.url' => 'http://[lokale IP]',
  'overwriteprotocol' => 'https',
```
