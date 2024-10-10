# Stirling-PDF

## Docker Compose
+ [Installation](https://github.com/guggenbergerME/linux_codes/blob/main/Einrichten%20&%20Programme/docker/docker%20install/Dockerv2_Ubuntu22.04LTS/Readme.md)

## Docker Compose Stirling-PDF
```
version: '3.3'
services:
  stirling-pdf:
    image: frooodle/s-pdf:latest
    ports:
      - '8080:8080'
    volumes:
      - ./trainingData:/usr/share/tessdata #Required for extra OCR languages
      - ./extraConfigs:/configs
#      - ./customFiles:/customFiles/
#      - ./logs:/logs/
    environment:
      - DOCKER_ENABLE_SECURITY=false
      - INSTALL_BOOK_AND_ADVANCED_HTML_OPS=false
      - LANGS=en_GB
```

## Anleitung
+ [Github](https://github.com/Stirling-Tools/Stirling-PDF)
