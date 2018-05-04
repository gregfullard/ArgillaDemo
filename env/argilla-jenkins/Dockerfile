# Looked at:
# - https://stelligent.com/2017/04/13/containerizing-jenkins-with-docker-and-centos/
# - https://github.com/internavenue/docker-centos-jenkins
FROM argilla-openjdk
MAINTAINER Greg Fullard
USER root

# Install jenkins
RUN wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
RUN rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
RUN yum install -y jenkins

# Install SSH Clients for interaction with GitLab
RUN yum install -y openssh-clients

# Install Git
RUN yum install -y git

# Install Sphinx
RUN yum install -y epel-release
RUN yum install -y python-pip
RUN pip install --upgrade pip
RUN pip install -U Sphinx
RUN pip install sphinx_rtd_theme

# Install Make
RUN yum install -y make

# Install Maven
RUN yum install -y maven

# Install Chrome
ADD ./google-x86_64.repo /etc/yum.repos.d/external.repo
RUN yum install -y google-chrome-stable

# Install ChromeDriver
WORKDIR /home/argilla
ENV CHROME_DRIVER_VERSION=2.38
RUN wget http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip
RUN ls
RUN unzip chromedriver_linux64.zip
RUN ls
#RUN rm chromedriver_linux64.zip
RUN mkdir -p /opt/webdrivers
RUN mv -f chromedriver /opt/webdrivers/chromedriver
RUN chmod 755 /opt/webdrivers
RUN chown argilla:argilla /opt/webdrivers
RUN ln -s /opt/webdrivers/chromedriver /usr/local/bin/chromedriver

# Install Latex
# TODO

# Clean up YUM when done.
RUN yum clean all

# Set environment variables
ENV JENKINS_UC=https://updates.jenkins.io
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental

# Not sure why we're using this
RUN chown -c argilla /var/lib/jenkins

USER argilla

# Generate SSH Keypair in the Jenkins container
# NOTE: This is for demo purposes only. Normally you shouldn't store key files inside the container
#RUN ssh-keygen -q -t rsa -N '' -f /id_rsa
RUN ssh-keygen -q -t rsa -C "jenkins@argilla.com" -N '' -f /home/argilla/.ssh/id_rsa  -b 4096

# Copy the readme file into the image
COPY argilla-jenkins-readme.md /home/argilla/argilla-jenkins-readme.md

# Expose the ports we're interested in
EXPOSE 8080 22

# Kicking in
CMD ["java", "-jar", "/usr/lib/jenkins/jenkins.war"]
