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
#RUN yum install -y centos-release-scl
#RUN yum install -y rh-python36
#RUN scl enable rh-python36 bash \
#python --version \
#pip3 --version \
#pip install --upgrade pip \
#pip install Flask
#RUN yum groupinstall -y 'Development Tools'
#RUN yum install -y httpd mod_wsgi
RUN yum clean all

# Copy the readme file into the image
COPY python-demo-app-readme.md /home/argilla/python-demo-app-readme.md

RUN mkdir /home/argilla/python-demo-app
WORKDIR /home/argilla/python-demo-app
COPY bootstrap.sh /home/argilla/python-demo-app/bootstrap.sh
RUN chmod +x bootstrap.sh

RUN mkdir /home/argilla/python-demo-app/flask_web
COPY ./flask_web /home/argilla/python-demo-app/flask_web
WORKDIR /home/argilla/python-demo-app/flask_web

RUN pip3 install -r requirements.txt

WORKDIR /home/argilla/python-demo-app

EXPOSE 5000

CMD /home/argilla/python-demo-app/bootstrap.sh
