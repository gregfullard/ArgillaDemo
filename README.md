# DevOpsDemo
A demonstration project to put together a DevOps pipeline that is useful for large audience presentations.

Components in the stack:
* GitLab SCM Server
* Apache Web Server
* Apache Sling Web Application
* Apache Camel Integration Application
* Jenkins Build Server

The demonstration uses Docker Compose to bootstrap a full development environment for easy demonstration

Other Ideas:
* Hygieia
* Artifactory
* Prometheus
* Some method to visualise the environment in real time
* NGINX as a Reverse Proxy
* HAProxy with multiple Web Servers
* SonarQube
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
