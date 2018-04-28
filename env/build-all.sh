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

cd argilla-jenkins
docker build -t argilla-jenkins .
cd ..

cd argilla-gitlab
docker build -t argilla-gitlab .
cd ..

# Get started
echo '****************'
echo '**************** Done'
echo '****************'
