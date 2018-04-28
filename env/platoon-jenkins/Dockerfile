# Looked at:
# - https://stelligent.com/2017/04/13/containerizing-jenkins-with-docker-and-centos/
# - https://github.com/internavenue/docker-centos-jenkins
FROM platoon-openjdk
MAINTAINER Greg Fullard
USER root

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins

# Install Maven
# TODO

# Install Sphinx
# TODO

# Install Latex
# TODO

# Clean up YUM when done.
RUN yum clean all

# Set environment variables
ENV JENKINS_UC=https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental

# Not sure why we're using this
RUN chown -c platoon /var/lib/jenkins

USER platoon

# Copy the readme file into the image
COPY platoon-jenkins-readme.txt /home/platoon/platoon-jenkins-readme.txt

# Expose the ports we're interested in
EXPOSE 8080 22

# Kicking in
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
