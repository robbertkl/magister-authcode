var webpage = require('webpage');
var page = webpage.create();

page.onError = function() {};

page.onResourceRequested = function(request) {
  if (request.method == 'POST' && request.url == 'https://accounts.magister.net/challenges/current') {
    var json = JSON.parse(request.postData);
    console.log(JSON.stringify(json.authCode));
    phantom.exit(0);
  }
};

page.open('https://accounts.magister.net/', function() {
  setTimeout(function() {
    phantom.exit(1);
  }, 5000);
});
