'use strict';

const express = require('express');

// Constants
const PORT = 49161;
const HOST = 'localhost';



// App
const app = express();
app.get('/', (req, res) => {
	console.log('Drone called');

	var drone = require("./node_modules/node-bebop/examples/GoDrone");

	drone.sayHowzit();
	//console.log(" >> " + drone.doDrone());

	res.send('Hello from the NodeJS Drone, by the #DevAnything crew.\n');
});

var server = app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
server.close();

// To check drone logs: docker logs env_node-drone-app_1