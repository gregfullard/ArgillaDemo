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

The image has a single system user with its home directory at /home/argilla

This user should be the user for everything running on the machine.

Additionally, a folder has been created at /opt/argilla which is owned by the argilla user.
Ideally all manually installed software should be placed at that location.

The image is based off the base image from DockerHub (https://hub.docker.com/_/centos/)
We are using centos:7

Note: If you have not pulled the image yet, you may want to run the following command first
docker pull centos:7
(Note: You will require a username for DockerHub, use "docker login" to login from terminal)

Build this image on your machine with the following command:
docker build -t argilla-centos .

Generally you would not directly create containers from this image (it is typically
used as a base to create other images), however, if you temporarily need to create a
container for testing installation commands, you can do so with:
docker run -i -P --name centos argilla-centos

Then you can connect to the container using:
docker exec -it centos bash
