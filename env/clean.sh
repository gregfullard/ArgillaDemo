#!/bin/bash
# This script can be run at any time if you want to clean the whole demo, including all volumes etc
# NB: If you do this, it'll be lie a brand-new clone

# Get started
echo '****************'
echo '**************** Cleaning everything'
echo '****************'

# Clean Jenkins Volume
# ====================
cd ../volumes
sudo rm -rf jenkins

# Clean GitLab Volume
# ===================
sudo rm -rf gitlab 

# Clean Demo App Volume
# =====================
cd node-demo-app
rm -rf node_modules
rm -f package.json
rm -f package-lock.json
rm -f server.js
cd ..

# Clean Drone App Volume
# =====================
cd node-drone-app
rm -rf node_modules
rm -f package.json
rm -f package-lock.json
rm -f server.js
cd ..

# Clean NginX volume
# ==================
cd nginx
rm -rf dev-manual
rm -rf user-manual

# Remove Git Remote
# =================
cd ../..
git remote remove gitlab

# Get Done
echo '****************'
echo '**************** Done'
echo '****************'
