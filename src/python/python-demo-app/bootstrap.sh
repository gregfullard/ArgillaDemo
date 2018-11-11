#!/bin/sh
export LOCAL_IP=`ifconfig eth0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
export FLASK_APP=./flask_web/app.py
#source $(pipenv --venv)/bin/activate
export LC_ALL=en_ZA.utf8
export LANG=en_ZA.utf8
flask run -h 0.0.0.0
