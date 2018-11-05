#!/bin/bash
# This script should be run once only after the clean script has been run (or after a fresh clone)

# Get started
echo '****************'
echo '**************** Setting everything up'
echo '****************'

# Ensure NPM is preinstalled
# ==========================
sudo apt-get install npm

# Ensure docker-compose is preinstalled
# =====================================
sudo apt-get install docker-compose

# First build of node-demo-app
# ============================
cd ../src/node/node-demo-app
npm install
sudo npm install -g supervisor nodemon
cd ../../../env

# First build of node-drone-app
# =============================
cd ../src/node/node-drone-app
npm install
sudo npm install -g supervisor nodemon
cd ../../../env

# Build all docker images
# =======================
docker login
./build-all.sh
docker-compose build

# Done
echo '****************'
echo '**************** Done. Now you can run docker-compose up'
echo '****************'
