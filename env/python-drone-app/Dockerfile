FROM argilla-centos
MAINTAINER Greg Fullard
USER root

# Update the system
RUN yum update -y
RUN yum upgrade -y

# Install Python
RUN yum -y install yum-utils
RUN yum -y groupinstall development
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install python36u
RUN python3.6 -V
RUN yum -y install python36u-pip
RUN pip3.6 install --upgrade pip
RUN pip3.6 install Flask
RUN yum clean all

# Copy the readme file into the image
COPY python-drone-app-readme.md /home/argilla/python-drone-app-readme.md

RUN mkdir /home/argilla/python-drone-app
WORKDIR /home/argilla/python-drone-app
COPY bootstrap.sh /home/argilla/python-drone-app/bootstrap.sh
RUN chmod +x bootstrap.sh

RUN mkdir /home/argilla/python-drone-app/tello_demo
COPY ./tello_demo /home/argilla/python-drone-app/tello_demo
WORKDIR /home/argilla/python-drone-app/tello_demo

RUN pip3 install -r requirements.txt

WORKDIR /home/argilla/python-drone-app

EXPOSE 5000 8889

#ENTRYPOINT [ "python36" ]
CMD /home/argilla/python-drone-app/bootstrap.sh
