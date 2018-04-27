# DevOpsDemo
A demonstration project to put together a DevOps pipeline that is useful for large audience presentations.

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

## Starting up the environment
First ensure that you have credentials for Docker Hub

```
cd env
docker login
docker-compose up
```

## Tools
| *Tool* | *Link* | *Credentials* |
| ------------- | ------------- | ------------- |
| Jenkins | http://${docker-machine ip default}:18080/ | no login required |
| SonarQube | http://${docker-machine ip default}:19000/ | admin/admin |
| Artifactory | http://${docker-machine ip default}:8081/artifactory |


## Preparing for a demo
