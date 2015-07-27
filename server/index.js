var express = require('express');
var app = express();

app.set('port', (process.env.PORT || 3000));
app.use(express.static(__dirname + '/public'));

app.get('/', function(request, response) {
  response.send('Hello World!');
});

app.get('/config', function(request, response) {
  var config = {
    location: {
      source: "ip-api.com/json"
    }
  };
  console.log(config);
  response.send(config);
});

app.post('/client/ip/:ip', function (request, response) {
  if(!request.body.hasOwnProperty('signature')) {
       response.statusCode = 400;
    return response.send('Error 400: Request signature is required.');
  }
  console.log(request);

  // all is well so return true
  response.json(true);
});

//
app.listen(app.get('port'), function() {
  console.log("Node app is running at localhost:" + app.get('port'));
});
