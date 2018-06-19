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
nodejs
npm

## First Run
First ensure that you have credentials for Docker Hub

```
cd env
./first_run.sh
docker-compose build
docker-compose up
```

Take note that a number of manual steps are still needed on the first run to get everything
up and running for a full demonstration (I'll hopefully automate these over time)

* Jenkins Basics
     * Open home page and enter the security key
     * Install suggested plugins
     * Configure the admin user (admin/admin)
     * Confirm Instance URL
     * Install Blue Ocean plugin
         * Manage Jenkins > Manage Plugins > Available
         * Type "Blue Ocean"
         * Select the plugin
         * Click "Install without Restart"
     * Install GitLab plugin
         * Manage Jenkins > Manage Plugins > Available
         * Type "GitLab"
         * Select the plugin
         * Click "Install without Restart"
* Artifactory Basics
     * Open Home page
     * Configure admin user
     * Set up repositories
* GitLab Basics
     * Open Home Page
     * Change root password (root/password)
* GitLab SSH connection with localhost
     * Ref: https://docs.bitnami.com/aws/how-to/create-ci-pipeline/
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
         * Project Name: ArgillaDemo
         * Visibility Level: Public
     * Push this project to GitLab server

```
git remote add gitlab ssh://git@localhost:1022/root/ArgillaDemo.git
git push -u gitlab --all
git push -u gitlab --tags
```
     * (If this is a second run and you get an SSH issue, simply remove the existing known host with the command provided by your OS

* Jenkins-Gitlab integration
     * Ref: https://docs.gitlab.com/ee/integration/jenkins.html
     * Ref: https://github.com/jenkinsci/gitlab-plugin#job-trigger-configuration
     * Get API Key from GitLab
         * Settings > Access Tokens
         * Personal Access Tokens
         * Name = Jenkins
         * Scope = api
         * Create and Copy
     * Jenkins
         * Manage Jenkins > Configure System > GitLab
         * Connection Name = GitLab
         * GitLab Host URL = http://argilla-gitlab:80
         * Credentials > Add > GitLab Api key (ID = GitLab)
         * Test Connection
         * Save
* Jenkins Pipeline
     * Open Jenkinc Blue Ocean interface
     * New Pipeline
         * Git
         * Repository URL: ssh://git@argilla-gitlab/root/ArgillaDemo.git
         * Copy the SSH key as provided by Jenkins
     * Open GitLab
         * Settings > SSH Keys
         * Paste Keys
         * Save
     * (Back in Jenkins) Create Pipeline

## Kill'em all
If you want to totally remove all containers from your machine. (In the env folder):

```
docker-compose down
./clean.sh
```

## Clean up and rebuild all images
If you want to clean up everything and do a rebuild. (In the env folder):

```
docker-compose down
./clean.sh
./build-all.sh
docker-compose build
docker-compose up
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
| *Tool*           | *Link*                                                | *Credentials*         |
| ---------------- | ----------------------------------------------------- | --------------------- |
| Jenkins          | http://localhost:18080/                               | admin/admin           |
| GitLab           | http://localhost:1080/                                | root/???              |
| SonarQube        | http://localhost:19000/                               | admin/admin           |
| Artifactory      | http://localhost:8081/artifactory                     |                       |

## URLs of deployed Apps
| *App*            | *Link*                                                 | *Credentials*         |
| ---------------- | ------------------------------------------------------ | --------------------- |
| Node Demo App    | http://localhost:49160                                 |                       |
| Fly Drone        | http://localhost:49161                                 |                       |
| NGINX            | http://localhost:8090/argilla                          |                       |
| Developer Manual | http://localhost:8090/dev-manual/html/index.html       |                       |
| Test Report      | http://localhost:8090/test-reports/serenity/index.html |                       |

## Notes

If the local host machine can't connect to the drone, it is likely due the the existence of a virtual bridge network
ith the same IP (192.168.42.1). You can double-check by running ifconfig

To kill this bridge, run:

```
sudo ifconfig virbr1 down
```

## TODO

Further improvements that still need to be made for a slick experience:
 * Improve the Jenkins docker image to have all the required plugins preinstalled
 * Improve the Jenkins docker image so that Jenkins doesn't require an admin password
 * Install all the SSH keys vie automated script (Probably using Ansible)




mvn clean verify -Dwebdriver.chrome.driver=/usr/local/bin/chromedriver -Dwebdriver.driver=chrome -Dchrome.switches=--no-sandbox -Dwebdriver.base.url="http://localhost:8090" -Dcontext=chrome
