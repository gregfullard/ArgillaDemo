#!/bin/bash
# This script should be run first to build all the images on the hody machine

# Get started
echo '****************'
echo '**************** This script builds all docker images'
echo '****************'

# Centos Base Image
# =================
cd argilla-centos
docker build -t argilla-centos .
cd ..

# OpenJDK Base Image
# ==================
cd argilla-openjdk
docker build -t argilla-openjdk .
cd ..

# Artifactory Image
# =================
cd argilla-artifactory
docker build -t argilla-artifactory .
cd ..

# Jenkins Image
# =============
cd argilla-jenkins
docker build -t argilla-jenkins .
cd ..

# GitLab Image
# ============

cd argilla-gitlab
docker build -t argilla-gitlab .
cd ..

# NginX Image
# ===========

cd argilla-nginx
docker build -t argilla-nginx .
cd ..

# Node Demo Image
# ===============
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

# Node Drone Image
# ==================

# Clear the node-drone-app volume
# Copy all files from the app folder into the volume and into the Docker env folder
# This ensures that the container runs correctly with or without a mounted volume
cd ../volumes/node-drone-app
rm -rf node_modules
rm -f package.json
rm -f package-lock.json
rm -f server.js
cd ../../src/node/node-drone-app
cp package.json ../../../volumes/node-drone-app/package.json
cp package-lock.json ../../../volumes/node-drone-app/package-lock.json
cp server.js ../../../volumes/node-drone-app/server.js
cp -R node_modules ../../../volumes/node-drone-app/
cp package.json ../../../env/node-drone-app/package.json
cp package-lock.json ../../../env/node-drone-app/package-lock.json
cp server.js ../../../env/node-drone-app/server.js
cp -R node_modules ../../../env/node-drone-app/
cd ../../../env

cd node-drone-app
docker build -t node-drone-app .
cd ..

# Python Demo Image
# ===============
# Clear the python-demo-app volume
# Copy all files from the app folder into the volume and into the Docker env folder
# This ensures that the container runs correctly with or without a mounted volume
cd ../volumes/python-demo-app
rm -rf flask_web
rm -f bootstrap.sh
cd ../../src/python/python-demo-app
cp -R python-demo-app ../../../env/python-demo-app/
cp bootstrap.sh ../../../volumes/python-demo-app/bootstrap.sh
cd ../../../env

cd python-demo-app
docker build -t python-demo-app .
cd ..

# Python Drone Image
# ===============
# Clear the python-drone-app volume
# Copy all files from the app folder into the volume and into the Docker env folder
# This ensures that the container runs correctly with or without a mounted volume
cd ../volumes/python-drone-app
rm -rf tello_demo
rm -f bootstrap.sh
cd ../../src/python/python-drone-app
cp -R python-drone-app ../../../env/python-drone-app/
cp bootstrap.sh ../../../volumes/python-drone-app/bootstrap.sh
cd ../../../env

cd python-drone-app
docker build -t python-drone-app .
cd ..

# Done
echo '****************'
echo '**************** Done'
echo '****************'
