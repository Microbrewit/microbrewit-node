###
API wrapper for search endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

http = require './http'
querystring = require 'querystring'
_ = require 'lodash'

class Search extends http
	endpoint: 'search'
	searchUrl: 'https://search.microbrew.it'

	# Generate url by concatenating apiUrl, endpoint and partial
	# @param [String] partial (optional) url partial
	# @return [String] url
	# @private
	_generateESUrl: (partial = '') ->
		url = "#{@searchUrl}"
		url += "/#{partial}" if partial and partial isnt ''
		return url

	_parseESHit: (esHit) ->
		hitsFlattened = []
		for hit in esHit.hits.hits
			source = hit._source
			delete hit._source
			hitsFlattened.push _.merge hit, source

		esHit.hits.hits = hitsFlattened

		return esHit

	# Search directly in elastic search endpoint
	# Only accepts q=search
	# @see https://www.elastic.co/guide/en/elasticsearch/reference/current/search-uri-request.html
	esSearch: (query, callback, token) ->
		query.url ?= "#{@_generateESUrl(query.partial)}?#{querystring.stringify(query.params)}"

		innerCallback = (err, res, body) =>
			body = @_parseESHit(body)
			callback err, res, body

		console.log query
		@get query, innerCallback, token

	# Search everything on Microbrew.it
	# @param [Object] query
	# @option query [String] query The text string you want to search for
	# @option query [Integer] from The result number to start from / offset.
	# @option query [Integer] size The number of results to return
	# @option query [String] partial (optional) If you want to search a specific endpoint (e.g fermentables, hops, yeasts, beers, beerstyles, ingredients, users, breweries, suppliers, origins, glasses, etc.)
	# @param [Function] callback Will be called with error, response (http response), body (JSON.parsed if applicable)
	get: (query, callback, token) ->
		query.params ?= query
		delete query.params.partial
		delete query.params.headers

		super query, callback, token

	# Search in ingredients in Microbrew.it
	# See @get for parameter definitions
	ingredients: (query, callback, token) ->
		query.partial = 'ingredients'

		@get query, callback, token

	# Search does not accept post
	post: (query, callback, token) ->
		callback new Error 'Search does not accept POST calls.'
	# Search does not accept put
	put: (query, callback, token) ->
		callback new Error 'Search does not accept PUT calls.'
	# Search does not accept delete
	delete: (query, callback, token) ->
		callback new Error 'Search does not accept DELETE calls.'



module.exports = Search