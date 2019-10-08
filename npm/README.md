# magister-authcode

[![npm version](https://badge.fury.io/js/magister-authcode.svg)](https://www.npmjs.com/package/magister-authcode)

Fetches an up-to-date auth code for Magister.

Can be used as a drop-in replacement for (@magisterjs/dynamic-authcode)[https://github.com/simplyGits/magisterjs-dynamic-authcode]. It fetches the auth code from [this Gist](https://gist.github.com/robbertkl/995a359d1c9641892e3de1ed9af18b15), but you can optionally pass an alternative Gist.

## Installation

```sh
npm install --save magister-authcode
```

## Usage

```js
const getAuthCode = require('magister-authcode');

// ...

const authCode = await getAuthCode();
```
