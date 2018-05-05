This is a demonstration application for NodeJS

It starts up a simple server running a Hello world HTTP service

# Prerequisites
* Node
* NPM

# To run and test locally
Open a terminal in the folder, the run:

```
npm install
sudo npm install -g supervisor nodemon
```

Once the app is installed, you can start it up by calling


```
supervisor server.js
```

Note: By running as "supervisor server.js" and not simply as "node server.js" the application dynamically reloads changes to the Javascript source code