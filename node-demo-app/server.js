'use strict';

const express = require('express');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
	console.log('Saying hello');
	res.send('Hello from the NodeJS Demo App\n');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
