# Per Bash in einen Container

```
docker exec -it <mycontainer> sh
```

## EXEC Datei download

```
docker cp  [CONTAINER-ID]:/docker/container ~/download`
```

## EXEC Datei upload

```
docker cp ./localDir/dirToCopy b8ddea5d8fad:/mnt/newDir/
```
