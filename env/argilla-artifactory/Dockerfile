FROM docker.bintray.io/jfrog/artifactory-oss:latest
MAINTAINER Greg Fullard
USER root

# Update Timezone
ENV TZ=Africa/Johannesburg
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Copy the readme file into the image
#COPY argilla-openjdk-readme.txt /home/argilla/argilla-openjdk-readme.txt
