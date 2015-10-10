###
API wrapper for search endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

http = require './http'

class Search extends http
	endpoint: 'search'

	# Search everything on Microbrew.it
	# @param [Object] query
	# @option query [String] query The text string you want to search for
	# @option query [Integer] from The result number to start from / offset.
	# @option query [Integer] size The number of results to return
	# @option query [String] partial (optional) If you want to search a specific endpoint (e.g fermentables, hops, yeasts, beers, beerstyles, ingredients, users, breweries, suppliers, origins, glasses, etc.)
	# @param [Function] callback Will be called with error, response (http response), body (JSON.parsed if applicable)
	get: (query, callback, token) ->
		super query, callback, token

	# Search in ingredients in Microbrew.it
	# See @get for parameter definitions
	ingredients: (query, callback, token) ->
		query.partial = 'ingredients'

		@get query, callback, token

	# Search does not accept post
	post: ->
		callback new Error 'Search does not accept POST calls.'
	# Search does not accept put
	put: ->
		callback new Error 'Search does not accept PUT calls.'
	# Search does not accept delete
	delete: ->
		callback new Error 'Search does not accept DELETE calls.'



module.exports = Search