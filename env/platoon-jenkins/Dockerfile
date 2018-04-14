FROM platoon-centos
MAINTAINER Greg Fullard
USER root

# Install Java
RUN yum install -y java

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins

# Expose the ports we're interested in
EXPOSE 8080

# Set the volume folder
VOLUME /var/lib/jenkins/
VOLUME /var/log/jenkins/
VOLUME /var/cache/jenkins/
