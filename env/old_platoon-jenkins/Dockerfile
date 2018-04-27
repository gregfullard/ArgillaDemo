# Looked at:
# - https://stelligent.com/2017/04/13/containerizing-jenkins-with-docker-and-centos/
# - https://github.com/internavenue/docker-centos-jenkins
FROM platoon-openjdk
MAINTAINER Greg Fullard
USER root

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#RUN yum install -y openssl-devel
#RUN yum install -y python-devel
#RUN yum install -y which
#RUN yum install -y epel-release
#RUN yum install -y kernel-headers
#RUN yum install -y kernel-devel
RUN yum install -y jenkins

# Clean up YUM when done.
RUN yum clean all

RUN chown -c platoon /var/lib/jenkins
#    chsh -s /bin/bash platoon

# Expose the ports we're interested in
EXPOSE 8080 22

# Kicking in
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
