This is the project base CentOS Docker image.

The image has some basic tools installed like:
 - nano
 - sudo
 - net-tools
 - ca-certificates
 - unzip
 - wget
 - iputils
 - links (Command line browser)
 - deltarpm
 - curl
 
Additionally the image has a new single system user with its home directory at /opt/platoon,
this allows all platoon software intallations to be placed within /opt/platoon

The image is based off the base image from DockerHub (https://hub.docker.com/_/centos/)
We are using centos:7

Note: If you have not pulled the image yet, you may want to run the following command first
docker pull centos:7
(Note: You will require a username for DockerHub)

Build this image on your machine with the following command:
docker build -t platoon-centos .

Generally you would not directly create containers from this image (it is typically
used as a base to create other images), however, if you temporarily need to create a
container for testing installation commands, you can do so with:
docker run -i -P --name temp platoon-centos

Then you can connect to the container using:
docker exec -it temp bash
