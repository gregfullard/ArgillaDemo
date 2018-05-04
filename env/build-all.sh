#!/bin/bash
# This script should be run first to build all the images on the hody machine

# Get started
echo '****************'
echo '**************** This script builds all docker images'
echo '****************'

cd argilla-centos
docker build -t argilla-centos .
cd ..

cd argilla-openjdk
docker build -t argilla-openjdk .
cd ..

cd argilla-artifactory
docker build -t argilla-artifactory .
cd ..

cd argilla-jenkins
docker build -t argilla-jenkins .
cd ..

cd argilla-gitlab
docker build -t argilla-gitlab .
cd ..

cd argilla-nginx
docker build -t argilla-nginx .
cd ..

cd node-demo-app
docker build -t node-demo-app .
cd ..

cd node-drone-app
docker build -t node-drone-app .
cd ..

# Get started
echo '****************'
echo '**************** Done'
echo '****************'
