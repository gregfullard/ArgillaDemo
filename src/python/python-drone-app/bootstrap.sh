#!/bin/sh
export FLASK_APP=./tello_demo/index.py
#source $(pipenv --venv)/bin/activate
export LC_ALL=en_ZA.utf8
export LANG=en_ZA.utf8
flask run -h 0.0.0.0
