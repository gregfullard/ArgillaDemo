# Argilla Demo
A demonstration project to show the various components of the Argilla Framework working together.
The demonstrations is designed to be useful for large audience presentations.

For full details of the Argilla Framework please refer to https://github.com/gregfullard/ArgillaFramework

Components in the stack:
* GitLab SCM Server
* Jenkins Server
* Artifactory Server
* SonarQube Server
* Apache Web Server
* Apache Sling Web Application
* Apache Camel Integration Application
* Node Server

The demonstration uses Docker Compose to bootstrap a full development environment for easy demonstration

Other Ideas:
* Hygieia
* Prometheus
* Some method to visualise the environment in real time
* NGINX as a Reverse Proxy
* HAProxy with multiple Web Servers
* Monitoring Solution
* ElasticSearch
* MQ

The Pipeline will include:
* Generate build number
* Generate HTML Documentation
* Generate PDF Documentation
* Deploy Web Application to Sling
* Deploy REST services to Camel Servers
* Run Cucumber tests with Serenity
* Publish Test Results to the Apache web Server

## Prerequisites
Docker

Docker-Compose

## First Run
First ensure that you have credentials for Docker Hub

```
cd env
docker login
docker-compose up
```

Take note that a number of manual steps are still needed on the first run to get everything
up and running for a full demonstration (I'll hopefully automate these over time)

* Jenkins Basics
     * Open home page and enter the security key
     * Configure the admin user
     * Install default plugins
     * Install Blue Ocean plugin
     * Install GitLab plugin
* Artifactory Basics
     * Open Home page
     * Configure admin user
     * Set up repositories
* GitLab Basics
     * Open Home Page
     * Change root password
* GitLab SSH connection with localhost
     * On local Linux host
     * cat ~/.ssh/id_rsa.pub
     * Copy the file content
     * Open GitLab
         * Settings > SSH Keys
         * Paste Keys
         * Save
* GitLab SSH connection with Jenkins host
     * On local Linux host
     * docker exec -it env_argilla-jenkins_1 bash
     * Inside jenkins shell
     * cat /home/argilla/.ssh/id_rsa.pub
     * Copy the file content
     * Open GitLab
         * Settings > SSH Keys
         * Paste Keys
         * Save     
* GitLab Prepare Repo  
     * Create empty repository
     * Push this project to GitLab server

```
git remote add gitlab ssh://git@localhost:1022/root/ArgillaDemo.git
git push -u gitlab --all
git push -u gitlab --tags
```

* Jenkins-Gitlab integration
     * Ref: https://docs.gitlab.com/ee/integration/jenkins.html
     * Get API Key from GitLab
         * Settings > Access Tokens
         * Personal Access Tokens
         * Name = Jenkins
         * Type = api
         * Create and Copy
     * Jenkins
         * Manage Jenkins > Configure System > GitLab
         * Connection Name = GitLab
         * GitLab Host URL = http://argilla-gitlab:80
         * Credentials > Add > GitLab Api key (ID = GitLab)
         * Test Connection
         * Save


## Kill'em all
If you want to totally remove all containers from yur machine:

```
docker-compose down
```

## Using the environment (Preparing for a demo)
After the initial run (and manual steps performed), you can start and stop the environment using these commands

```
docker-compose start
```

```
docker-compose stop
```

## Tools
| *Tool*        | *Link*                             | *Credentials*         |
| ------------- | ---------------------------------- | --------------------- |
| Jenkins       | http://localhost:18080/            | admin/admin           |
| GitLab        | http://localhost:1080/             | root/???       |
| SonarQube     | http://localhost:19000/            | admin/admin           |
| Artifactory   | http://localhost:8081/artifactory  |                       |
