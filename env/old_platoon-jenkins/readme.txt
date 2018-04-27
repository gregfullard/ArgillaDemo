The image is based on platoon-openjdk

Build this image on your machine with the following command:
docker build -t platoon-jenkins .

Create a container from this image with:
docker run -i -P --name jenkins platoon-jenkins

Then you can connect to the container using:
docker exec -it jenkins bash


