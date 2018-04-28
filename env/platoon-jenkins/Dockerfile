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

USER platoon

# Installing specific list of plugins. see: https://github.com/jenkinsci/docker#preinstalling-plugins
#COPY plugins.txt /usr/share/jenkins/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

# Adding default Jenkins Seed Job
#COPY jobs/job-dsl-seed-job.xml /usr/share/jenkins/ref/jobs/job-dsl-seed-job/config.xml

############################################
# Configure Jenkins
############################################
# Jenkins settings
#COPY config/config.xml /usr/share/jenkins/ref/config.xml

# Jenkins Settings, i.e. Maven, Groovy, ...
#COPY config/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
#COPY config/hudson.plugins.groovy.Groovy.xml /usr/share/jenkins/ref/hudson.plugins.groovy.Groovy.xml
#COPY config/maven-global-settings-files.xml /usr/share/jenkins/ref/org.jenkinsci.plugins.configfiles.GlobalConfigFiles.xml

# SSH Keys & Credentials
#COPY config/credentials.xml /usr/share/jenkins/ref/credentials.xml
#COPY config/ssh-keys/cd-demo /usr/share/jenkins/ref/.ssh/id_rsa
#COPY config/ssh-keys/cd-demo.pub /usr/share/jenkins/ref/.ssh/id_rsa.pub

# tell Jenkins that no banner prompt for pipeline plugins is needed
# see: https://github.com/jenkinsci/docker#preinstalling-plugins
#RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

# Copy the readme file into the image
COPY readme.txt /home/readme.txt

# Expose the ports we're interested in
EXPOSE 8080 22

# Kicking in
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
