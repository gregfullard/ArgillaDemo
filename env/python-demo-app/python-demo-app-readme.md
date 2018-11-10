The image is based on  argilla-centos

Build this image on your machine with the following command:
docker build -t python-demo-app .

Create a container from this image with:
docker run -p 49160:5000 -i --name demo python-demo-app
or with volumes
docker run -p 49160:5000 -i --name demo -v /home/gregf/Repos/GregFullard/ArgillaDemo/volumes/python-demo-app:/home/argilla/python-demo-app/  python-demo-app

Then you can connect to the container using:
docker exec -it demo bash
or (when running from docker-compose)
docker exec -it env_python-demo-app_1 bash

To see the logs from the app:
docker logs python-demo-app
or (when running from docker-compose)
docker logs env_python-demo-app_1

To test the web service, run:
curl -i localhost:49161
