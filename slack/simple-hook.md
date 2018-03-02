### Simple Node HTTPS Hook

```
var http = require('https');

var post_data = JSON.stringify({
	'text': 'Sample Text'
});

var options = {
	host: 'hooks.slack.com',
	port: 443,
	path: '/services/AAA/BBB/CCC',
	method: 'POST',
	headers: {
		'Content-Type': 'application/x-www-form-urlencoded',
		'Content-Length': Buffer.byteLength(post_data)
	}
};

var req = http.request(options);

req.on('error', (e) => {
	console.log(`problem with request: ${e.message}`);
});

req.write(post_data);
req.end();
```
