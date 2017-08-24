PSAS
==============

Installation
--------------

1. Install [Docker](https://www.docker.com)

2. Download automated build from public Docker Hub Registry: `docker pull qapps/psas`
(alternatively, you can build an image from Dockerfile: `docker build -t="qapps/psas" github.com/qualiapps/psas`)

**Running**

`docker run -d -p 8080:80 --name psas-app qapps/psas`
