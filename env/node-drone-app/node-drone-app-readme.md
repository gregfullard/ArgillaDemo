The image is based on node:carbon

Build this image on your machine with the following command:
docker build -t node-drone-app .

Create a container from this image with:
docker run -p 49160:8080 -d --name node node-drone-app
or with volumes
docker run -p 49160:8080 -i --name node -v /home/gregf/Repos/GregFullard/ArgillaDemo/volumes/node-drone-app:/usr/src/app  node-drone-app

Then you can connect to the container using:
docker exec -it drone bash
or (when running from docker-compose)
docker exec -it env_node-drone-app_1 bash

To see the logs from the app:
docker logs drone
or (when running from docker-compose)
docker logs env_node-drone-app_1

To test the web service, run:
curl -i localhost:49160
