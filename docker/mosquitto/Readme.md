# Mosquitto

How to use this image

## Directories

Three directories have been created in the image to be used for configuration, persistent storage and logs.
```
/mosquitto/config
/mosquitto/data
/mosquitto/log
```
## Configuration

When running the image, the default configuration values are used. To use a custom configuration file, mount a local configuration file to ```/mosquitto/config/mosquitto.conf```
```
$ docker run -it -p 1883:1883 -p 9001:9001 -v mosquitto.conf:/mosquitto/config/mosquitto.conf eclipse-mosquitto
```
Configuration can be changed to:
```
    persist data to /mosquitto/data
    log to /mosquitto/log/mosquitto.log
```
i.e. add the following to ```mosquitto.conf```:
```
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
```
Note: If a volume is used, the data will persist between containers.
Run

Run a container using the new image:
```
$ docker run -it -p 1883:1883 -p 9001:9001 -v mosquitto.conf:/mosquitto/config/mosquitto.conf -v /mosquitto/data -v /mosquitto/log eclipse-mosquitto
```
Note: if the mosquitto configuration (mosquitto.conf) was modified to use non-default ports, the docker run command will need to be updated to expose the ports that have been configured.

### Links
+ [Repo](https://hub.docker.com/_/eclipse-mosquitto)
