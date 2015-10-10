###
API wrapper for beerstyles endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Users extends ItemEndpoint
	endpoint: 'users'

	notifications:
		get: (query, callback, token) ->
			callback new Error 'Not implemented'
		post: () ->
			callback new Error 'Not implemented'
			
module.exports = Users