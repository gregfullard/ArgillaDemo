The image is based on argilla-centos

Build this image on your machine with the following command:
docker build -t argilla-openjdk .

Generally you would not directly create containers from this image (it is typically
used as a base to create other images), however, if you temporarily need to create a
container for testing installation commands, you can do so with:
docker run -i -P --name openjdk argilla-openjdk

Then you can connect to the container using:
docker exec -it openjdk bash
