The image is based on argilla-centos

Build this image on your machine with the following command:
docker build -t argilla-gitlab .

Create a container from this image with:
docker run -i -P --name gitlab argilla-gitlab

Then you can connect to the container using:
docker exec -it argilla bash
