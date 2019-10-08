# magister-authcode

Keeps your Magister auth code up to date.

[Magister.js](https://github.com/simplyGits/MagisterJS) requires an up-to-date auth code to work. This repo contains tools to allow this:

* See [docker/](docker/) for an automated auth code fetcher [Docker image](https://hub.docker.com/r/robbertkl/magister-authcode) that stores it in a Gist.
* See [npm/](npm/) for an [NPM package](https://www.npmjs.com/package/magister-authcode) to fetch the latest auth code from a Gist.

An instance of the fetcher is running at an interval of 15 minutes, storing it in this Gist:
https://gist.github.com/robbertkl/995a359d1c9641892e3de1ed9af18b15

The NPM package has 0 dependencies and is preconfigured to use the above Gist. If you don't want to use the npm package, use the following URL to fetch the auth code JSON from your code:
https://gist.githubusercontent.com/robbertkl/995a359d1c9641892e3de1ed9af18b15/raw/authcode.json

## License

Published under the [MIT License](http://www.opensource.org/licenses/mit-license.php).
