# microbrewit-node
Official Node library for interacting with the Microbrew.it API.

All microbrewit-node methods are async, and follow the standard Node.js convention of callback(err, result).

## Usage

**Require mbit:**
```mbit = (require 'microbrewit-node').init({ clientId: 'your Microbrew.it API token'})```

Get Hop with ID 16: `mbit.hops.get(16, callback)`

**Login**
```mbit.account.login({ username: '', password: ''}, callback)```

See the [API Documentation](http://api.microbrew.it) to see available endpoints..
