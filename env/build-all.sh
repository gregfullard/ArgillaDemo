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

# Clear the node-demo-app volume
# Copy all files from the app folder into the volume and into the Docker env folder
# This ensures that the container runs correctly with or without a mounted volume
cd ../volumes/node-demo-app
rm -rf node_modules
rm -f package.json
rm -f package-lock.json
rm -f server.js
cd ../../src/node/node-demo-app
cp package.json ../../../volumes/node-demo-app/package.json
cp package-lock.json ../../../volumes/node-demo-app/package-lock.json
cp server.js ../../../volumes/node-demo-app/server.js
cp -R node_modules ../../../volumes/node-demo-app/
cp package.json ../../../env/node-demo-app/package.json
cp package-lock.json ../../../env/node-demo-app/package-lock.json
cp server.js ../../../env/node-demo-app/server.js
cp -R node_modules ../../../env/node-demo-app/
cd ../../../env

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
