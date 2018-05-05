The image is based on node:carbon

Build this image on your machine with the following command:
docker build -t node-demo-app .

Create a container from this image with:
docker run -p 49160:8080 -d --name node node-demo-app

Then you can connect to the container using:
docker exec -it node bash
or (when running from docker-compose)
docker exec -it env_node-demo-app_1 bash

To see the logs from the app:
docker logs node
or (when running from docker-compose)
docker logs env_node-demo-app_1

To test the web service, run:
curl -i localhost:49160
