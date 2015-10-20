###
API wrapper for hops endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Hops extends ItemEndpoint
	endpoint: 'hops'

	# Get supported hop forms (e.g pellet, flower, etc)
	# @param [Object] query
	# @param [Function] callback (err, response, body)
	# @param [Object] token Authentication token (optional)
	forms: (query, callback, token) ->
		query.partial = 'forms'
		query.headers ?= {}
		query.headers['Content-type'] ?= 'application/json'

		@get query, callback, token

module.exports = Hops