The image is based on

Build this image on your machine with the following command:
docker build -t argilla-artifactory .

Create container from this image
docker run -i -P --name artifactory argilla-artifactory

Then you can connect to the container using:
docker exec -it artifactory bash
