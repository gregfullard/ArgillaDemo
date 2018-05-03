'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
	console.log('Saying hello EEE');

	var xyz = require("./node_modules/node-bebop/examples/GoDrone");

	console.log(" >> " + xyz.doDrone());

	res.send('Hello world EEE\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
process.exit(45);
console.log(`Killed');
