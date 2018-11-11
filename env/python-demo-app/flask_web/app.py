# flask_web/app.py
import os

from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello_world():
    local_ip = os.environ["LOCAL_IP"]
    msg =  "Hello, World! My Local IP is: " + local_ip
    return msg

#@app.route('/')
#def hello_world:
#    return 'Hey, we have Flask in a Docker container!'


#if __name == '__main__':
#    app.run(debug=True, host='0.0.0.0')
