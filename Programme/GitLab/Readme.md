# GitLab

## Installation per Docker

Herunterladen der Docker GitLab Image

    docker pull gitlab/gitlab-ce

Sobald der Befehl Doncker pull erfolgreich läuft, sollten Sie das GitLab-Dachbild auf Ihrem lokalen Rechner haben, indem Sie mit diesem Befehl prüfen.

    docker image ls | grep gitlab-ce

## GitLab starten

Jetzt lassen Sie den GitLab-Server ausführen, indem Sie einen Container aus dem heruntergeladenen Docker-Image erstellen, d.h. gitlab/gitlab-ce

    docker run -p 8000:80 gitlab/gitlab-ce

Der GitLab-Server im Dockercontainer ist standardmäßig auf dem Port 80 ausgelegt. Wenn Sie auf den GitLab-Server auf Ihrem Host-Rechner aus dem laufenden Container zugreifen müssen, müssen Sie die Port-Mapping von der Host-Maschine zum Container durchführen, indem Sie -p 8000:80.

    Auf der Host-Seite setzen wir den Port auf 8000. Auf der Containerseite, der Port 80

Sobald Sie das oben genannte docker runbefehl, dies könnte etwa 5 Minuten dauern, um den GitLab-Server im Hafencontainer einzurichten.

Wir werden fünf Minuten warten und dann werden wir sehen, wie es geht.

Wenn Sie versuchen, http://localhost:8000 nach ca. 5 Minuten zu besuchen, können Sie eine 502 response. Das bedeutet, dass der Behälter läuft. Alles ist in Ordnung mit dem Container, aber der GitLab-Server in diesem Container ist noch nicht bereit, Anfragen anzunehmen.

### Links
+ [Projekt](https://about.gitlab.com/install/#ubuntu)
+ [Docker Installationsanleitung](https://medium.com/@BuildWithLal/dockerized-gitlab-how-to-easily-set-up-your-own-gitlab-server-9a925be09c59)
