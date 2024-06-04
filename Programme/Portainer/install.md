# Portainer installieren

 ## Docker Volumen anlegen

 ```
docker volume create portainer_data
 ```

## Download uns install
 ```
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker
 ```
