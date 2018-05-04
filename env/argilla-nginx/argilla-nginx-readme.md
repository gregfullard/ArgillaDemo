The image is based on the base nginx image

Build this image on your machine with the following command:
docker build -t argilla-nginx .

Run this image with
docker run -i -P --name nginx argilla-nginx
docker run -p 8090:80 -d --name nginx argilla-nginx

Then you can connect to the container using:
docker exec -it nginx bash
or (when running from docker-compose)
docker exec -it env_argilla-nginx_1 bash

To test the server, run:
curl -i localhost:8090/argilla/
