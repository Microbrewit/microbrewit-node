
# DELETE breweries/{id}/members/{username}	
# No documentation available.
# GET breweries/{id}/members/{username}	
# No documentation available.
# GET breweries/{id}/members	
# No documentation available.
# PUT breweries/{id}/members/{username}	
# No documentation available.
# POST breweries/{id}/members	
# No documentation available.
# GET breweries/es	
# No documentation available.
# GET breweries?query={query}&from={from}&size={size}	
# No documentation available.
# POST breweries/{id}/upload?breweryId={breweryId}

###
API wrapper for breweries endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class BreweryMembers extends ItemEndpoint
	endpoint: 'breweries'

	# Get members or a single member
	# @param [Object] query
	# @option query [integer] id ID of brewery
	# @option query [string] userId If getting single member: ID/Username of member you want
	# @param [Function] callback Will be called with (err, response, body)
	# @param [Object] token
	get: (query, callback, token) ->
		unless query.id
			callback new Error 'Please supply a brewery ID for your query'
		else
			query.partial = 'members'
			query.username ?= query.userId
			if query.username
				query.partial += "/#{query.username}"
			delete query.username
			delete query.userId

			query.headers ?= {}
			query.headers['Content-type'] ?= 'application/json'

			super query, callback, token

	# @todo Implement and test
	post: (query, callback, token) ->
		callback new Error 'Not implemented'

	# @todo Implement and test
	put: (query, callback, token) ->
		callback new Error 'Not implemented'

	# @todo Implement and test
	delete: (query, callback, token) ->
		callback new Error 'Not implemented'


class Breweries extends ItemEndpoint
	endpoint: 'breweries'

	members: (new BreweryMembers())

	upload: ->
		callback new Error 'Not implemented'

module.exports = Breweries