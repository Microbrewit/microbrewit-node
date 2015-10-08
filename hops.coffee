###
API wrapper for hops endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

http = require './http'

class hops extends http
	endpoint: 'hops'

	get: (query, callback) ->
		# Case: Get single
		if typeof query is 'number'
			super { partial: query }, callback
		# Case: ID given as object prop
		else if query.id?
			id = query.id 
			delete query.id
			super { partial: id, params: query}, callback
		# Something else
		else
			super { params: query }, callback

	delete: (query, callback, token) ->
		# Case: Get single
		if typeof query is 'number'
			super { partial: query }, callback, token
		# Case: ID given as object prop
		else if query.id?
			id = query.id 
			delete query.id
			super { partial: id, params: query}, callback, token
		# Something else
		else
			super { params: query }, callback, token

	post: (hop, callback, token) ->
		if typeof hop is 'object'
			hop = JSON.stringify hop
			
		super { body: hop }, callback, token


module.exports = hops