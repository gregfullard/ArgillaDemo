The image is based on argilla-openjdk

Build this image on your machine with the following command:
docker build -t argilla-jenkins .

Create a container from this image with:
docker run -i -P --name jenkins argilla-jenkins

Then you can connect to the container using:
docker exec -it jenkins bash

Take note that there are a number of configurations and settings that are performed after the creation
of the container. These are currently done manually, but must be automated with an ansible script
 - Open home page and enter the security key
 - Configure the admin user
 - Install default plugins
 - Install Blue Ocean plugin
 - Install GitLab plugin
