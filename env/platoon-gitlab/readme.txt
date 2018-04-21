The image is based on platoon-centos

Build this image on your machine with the following command:
docker build -t platoon-gitlab .

Create a container from this image with:
docker run -i -P --name gitlab platoon-gitlab

Then you can connect to the container using:
docker exec -it gitlab bash


