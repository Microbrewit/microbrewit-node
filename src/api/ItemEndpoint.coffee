###
Convenience class containing standard handlers for items (ingredients, glassware, breweries, etc)

@author Torstein Thune
@copyright Microbrew.it 2015
###

http = require './http'

class ItemEndpoint extends http

	get: (query, callback, token) ->
		# Case: Get single
		if typeof query is 'number'
			super { partial: query }, callback, token
		# Case: ID given as object prop
		else if query.id?
			partial = query.id 
			delete query.id

			partial += "/#{query.partial}" if query.partial

			delete query.partial

			headers = query.headers
			delete query.headers
			
			super { partial: partial, headers: headers, params: query}, callback, token
		# Something else
		else
			partial = query.partial
			headers = query.headers
			delete query.headers
			delete query.partial
			super { partial: partial, headers: headers, params: query }, callback, token

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

	post: (item, callback, token) ->
		if item.partial
			partial = item.partial
			delete item.partial

		if item.headers
			headers = item.headers

		if item.payload
			item = item.payload
		if typeof item is 'object'
			item = JSON.stringify item
			
		super { body: item, partial, headers }, callback, token


module.exports = ItemEndpoint