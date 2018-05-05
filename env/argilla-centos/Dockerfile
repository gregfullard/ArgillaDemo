FROM centos:7
MAINTAINER Greg Fullard
USER root

# Update Timezone
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update the system
RUN yum update -y
RUN yum upgrade -y

# Install some basic commands
RUN yum install -y nano
RUN yum install -y wget
RUN yum install -y sudo
RUN yum install -y net-tools
RUN yum install -y ca-certificates
RUN yum install -y unzip
RUN yum install -y iputils
RUN yum install -y links
RUN yum install -y deltarpm
RUN yum install -y curl
RUN yum install -y tzdata

# Install EPEL repo.
#RUN yum -y install http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-2.noarch.rpm

# Other options - add to dockerfile if it turns out we need them
#bash-completion
#pwgen
#mc
#openssh-clients
#openssh-server
#syslog-ng
#syslog-ng-libdbi
#yum-plugin-fastestmirror
#screen
#tmux

# Clean up YUM when done.
RUN yum clean all

# Create a user and group that will be used to launch processes (in other images based off this one)
# The user ID 1000 is the default for the first "regular" user on Fedora/RHEL,
# so there is a high chance that this ID will be equal to the current user
# making it easier to use volumes (no permission issues)
RUN groupadd -r argilla -g 1000 && useradd -u 1000 -r -g argilla -m -s /bin/bash -c "Argilla user" argilla

# Create the /opt/argilla folder in which most software should be installed
RUN mkdir /opt/argilla
RUN chmod 755 /opt/argilla
RUN chown argilla:argilla /opt/argilla

# Set the working directory
WORKDIR /home/argilla

# Copy the readme file into the image
COPY argilla-centos-readme.md /home/argilla/argilla-centos-readme.md

# Write out the contents of the home folder and wrap up
RUN ls
RUN /bin/echo Image Created
