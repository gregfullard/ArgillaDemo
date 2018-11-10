#!/bin/bash
# This script can be run at any time if you want to clean the whole demo, including all volumes etc
# NB: If you do this, it'll be lie a brand-new clone

# Get started
echo '****************'
echo '**************** Cleaning everything'
echo '****************'

# Bring Docker Compose Down
# =========================
docker-compose down

# Clean Jenkins Volume
# ====================
cd ../volumes
sudo rm -rf jenkins

# Clean GitLab Volume
# ===================
sudo rm -rf gitlab

# Clean Node Demo App Volume
# ==========================
cd node-demo-app
rm -rf node_modules
rm -f package.json
rm -f package-lock.json
rm -f server.js
cd ..

# Clean Node Drone App Volume
# ===========================
cd node-drone-app
rm -rf node_modules
rm -f package.json
rm -f package-lock.json
rm -f server.js
cd ..

# Clean Python Demo App Volume
# ============================
cd python-demo-app
rm -rf flask_web
rm -f bootstrap.sh
cd ..

# Clean Python Drone App Volume
# =============================
cd python-drone-app
rm -rf flask_web
rm -f bootstrap.sh
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
