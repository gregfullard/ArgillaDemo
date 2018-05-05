This is a Drone demonstration  application for NodeJS

It starts up a simple server running an HTTP service that launches the drone

Note: For basics safety purposes, the call to actually launch the drone is commented out as a default

# Prerequisites
* Node
* NPM

# To run and test locally
Open a terminal in the folder, the run:

```
npm install
sudo npm install -g supervisor nodemon
npm install node-bebop
```

Once the app is installed, you can start it up by calling


```
supervisor server.js
```

Note: By running as "supervisor server.js" and not simply as "node server.js" the application dynamically reloads changes to the Javascript source code

Once the app is running, you can curl it with

```
curl localhost:8080
```