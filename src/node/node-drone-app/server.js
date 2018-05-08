'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';



// App
const app = express();
app.get('/', (req, res) => {
	console.log('Drone called');

	var drone = require("./node_modules/node-bebop/examples/GoDrone");

	console.log(" >> " + drone.doDrone());

	res.send('Hello EOH Connect from the NodeJS Drone, by the #DevAnything crew.\n');
});

var server = app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
server.close();

function sayHowzit() {
	console.log("         _  _   _____                                _   _     _                ");
	console.log("	    _| || |_|  __ \             /\               | | | |   (_)               ");
	console.log("	   |_  __  _| |  | | _____   __/  \   _ __  _   _| |_| |__  _ _ __   __ _    ");
	console.log("	    _| || |_| |  | |/ _ \ \ / / /\ \ | '_ \| | | | __| '_ \| | '_ \ / _` |   ");
	console.log("	   |_  __  _| |__| |  __/\ V / ____ \| | | | |_| | |_| | | | | | | | (_| |   ");
	console.log("	     |_||_| |_____/ \___| \_/_/    \_\_| |_|\__, |\__|_| |_|_|_| |_|\__, |   ");
	console.log("	                                             __/ |                   __/ |   ");
	console.log("	                                            |___/                   |___/    ");
	return true;
}

// To check drone logs: docker logs env_node-drone-app_1