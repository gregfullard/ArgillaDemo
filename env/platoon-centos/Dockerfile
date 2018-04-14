FROM centos:7
MAINTAINER Greg Fullard
USER root

# Update the system
RUN yum update -y
RUN yum upgrade -y

# Install some basic commands
RUN yum install -y nano wget sudo net-tools ca-certificates unzip iputils links deltarpm

# Create a user and group that will be used to launch processes (in other images based off this one)
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
RUN groupadd -r platoon -g 1000 && useradd -u 1000 -r -g platoon -m -d /opt/platoon -s /bin/bash -c "Platoon user" platoon && \
    chmod 755 /opt/platoon

# Set the working directory
WORKDIR /home

# Copy a test file into the image
COPY readme.txt /home/readme.txt

# Write out the contents of the home folder and wrap up
RUN ls
RUN /bin/echo Image Created
