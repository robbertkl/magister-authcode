const https = require('https');

module.exports = async (gist = 'robbertkl/995a359d1c9641892e3de1ed9af18b15') => {
  const url = `https://gist.githubusercontent.com/${gist}/raw/authcode.json`;
  return new Promise((resolve, reject) => {
    const request = https.get(url, response => {
      if (response.statusCode < 200 || response.statusCode >= 300) {
        reject(new Error(`Unable to fetch auth code (HTTP ${response.statusCode})`));
      }
      const body = [];
      response.on('data', chunk => body.push(chunk));
      response.on('end', () => {
        try {
          resolve(JSON.parse(body.join('')));
        } catch (err) {
          reject(err);
        }
      });
    });
    request.on('error', err => reject(err));
  });
}
