# Docker Befehle

Alle Container auflisten

    docker ps -a

Container stoppem

    docker stop [ID]

Container löschen

    docker rm [ID]

Alle aktiven Container löschen

    docker rm -fv $(docker ps -aq)
