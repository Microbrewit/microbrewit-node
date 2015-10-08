# microbrewit-node
Official Node library for interacting with the Microbrew.it API.

This library tries to wrap the enpoints detailed in the [API Documentation](http://api.microbrew.it).

All microbrewit-node methods are async, and follow the standard Node.js convention of callback(err, httpResponse, body).

## Usage

**Require mbit:**
```mbit = (require 'microbrewit-node').init({ clientId: 'your Microbrew.it API token'})```
*Not all endpoints require a clientID.*

Get Hop with ID 16: `mbit.hops.get(16, callback)`.

**Login**
```mbit.http.authenticate({ username: '', password: ''}, callback)```

See the [API Documentation](http://api.microbrew.it) to see available endpoints.
