The image is based on  argilla-centos

Build this image on your machine with the following command:
docker build -t python-drone-app .

Create a container from this image with:
docker run -p 49161:5000 -p 18889:8889 -i --name drone python-drone-app
or with volumes
docker run -p 49161:5000 -p 18889:8889 -i --name drone -v /home/gregf/Repos/GregFullard/ArgillaDemo/volumes/python-drone-app:/home/argilla/python-drone-app/  python-drone-app

Then you can connect to the container using:
docker exec -it drone bash
or (when running from docker-compose)
docker exec -it env_python-drone-app_1 bash

To see the logs from the app:
docker logs python-drone-app
or (when running from docker-compose)
docker logs env_python-drone-app_1

To test the web service, run:
curl -i localhost:49161
