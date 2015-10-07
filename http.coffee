###
HTTP class 

This class is extended by the other API classes. Contains basic implementations of get, post, put and delete plus some utility functions.

@author Torstein Thune
@copyright Microbrew.it 2015
###

request = require 'request'
querystring = require 'querystring'

class http
	endpoint: ''

	constructor: ->

	# Generate url by concatenating apiUrl, endpoint and partial
	# @param [String] partial (optional) url partial
	# @return [String] url
	# @private
	_generateUrl: (partial='') ->
		return "#{@apiUrl}/#{@endpoint}/#{partial}"

	# Create GET url from map
	# @param [Object] params key, val of GET parameters
	# @return [String]
	# @private
	_parseParams: (params) ->
		paramTuples = []

		for key, val of params
			paramTuples.push "#{key}=#{val}"

		return paramTuples.join('&')

	_handleResponse: (error, response, body, token) ->
		if error
			 callback error, null, null, token
		else
			try 
				body = JSON.parse body

				if body.error
					callback body.error, null, null, token
					return
			catch e
				# Response body not JSON
			callback error, response, body, token

	# Authenticate move to other class?
	# @param [String] username
	# @param [String] password
	# @param [Function] callback (err, response)
	authenticate: (username, password, callback) ->
		body = 
			username: username
			password: password
			grant_type: "password"
		body.client_id = @clientId if @clientId
		
		postObj = 
			headers:
				'Content-Type':'application/x-www-form-urlencoded'
			body: querystring.stringify body
			url: "#{@apiUrl}/token"

		@post postObj, callback


	# Get new token if old is expired
	# @param [Object] token
	# @param [Function] callback
	refreshToken: (token, callback) ->
		# We are not authenticated, ignore
		unless token
			callback null, null, null
		else
			# auth_token is expired, get new one using refresh_token
			if new Date().getTime() > new Date(token[".expires"]).getTime()-30000 # 30 sec safety margin in case of HTTP lag
				body =
					refresh_token: token.refresh_token
					grant_type: "refresh_token"
				body.client_id = @clientId if @clientId

				postObj = 
					headers:
						'Content-Type':'application/x-www-form-urlencoded'
					body: querystring.stringify body
					
					url: "#{@apiUrl}/token"

				@post postObj, callback
						
			else
				# auth_token is still valid, keep using it
				callback null, null, token

	# HTTP POST wrapper
	# @param [Object] query
	# @param [Function] callback (err, response, body)
	# @param [Object] token Authentication token (optional)
	post: (query, callback, token = false) ->
		@refreshToken token,
			(err, response, token) =>

				if token?.access_token
					query.headers ?= {}
					query.headers['Authorization'] = "Bearer #{token.access_token}"

				unless query.url
					query.partial ?= ''
					query.params ?= {}
					query.url ?= "#{@_generateUrl(query.partial)}?#{@_parseParams(query.params)}"

					delete query.partial
					delete query.params

				request.post query, (error, response, body) ->
					@_handleResponse(error, response, body, token)
					

	# HTTP GET wrapper
	# @param [Object] query
	# @param [Function] callback (err, response, body)
	# @param [Object] token Authentication token (optional)
	get: (query, callback, token = false) ->
		@refreshToken token,
			(err, response, token) =>

				if token?.access_token
					query.headers ?= {}
					query.headers['Authorization'] = "Bearer #{token.access_token}"

				unless query.url
					query.partial ?= ''
					query.params ?= {}
					query.url ?= "#{@_generateUrl(query.partial)}?#{@_parseParams(query.params)}"

					delete query.partial
					delete query.params

				request.get query, (error, response, body) ->
					@_handleResponse(error, response, body, token)

	# HTTP PUT wrapper
	# Used for updating records
	# @param [Object] query
	# @param [Function] callback (err, response, body)
	# @param [Object] token Authentication token (optional)
	put: (query, callback, token = false) ->
		return callback 'Authentication required for PUT' unless token
		
		@refreshToken token,
			(err, response, token) =>

				if token?.access_token
					query.headers ?= {}
					query.headers['Authorization'] = "Bearer #{token.access_token}"

				unless query.url
					query.partial ?= ''
					query.params ?= {}
					query.url ?= "#{@_generateUrl(query.partial)}?#{@_parseParams(query.params)}"

					delete query.partial
					delete query.params

				request.get query, (error, response, body) ->
					@_handleResponse(error, response, body, token)

	# HTTP DELETE wrapper
	# @param [Object] query
	# @param [Function] callback (err, response, body)
	# @param [Object] token Authentication token (optional)
	delete: (query, callback, token = false) ->
		return callback 'Authentication required for DELETE' unless token
		
		@refreshToken token,
			(err, response, token) =>

				if token?.access_token
					query.headers ?= {}
					query.headers['Authorization'] = "Bearer #{token.access_token}"
					
				unless query.url
					query.partial ?= ''
					query.params ?= {}
					query.url ?= "#{@_generateUrl(query.partial)}?#{@_parseParams(query.params)}"

					delete query.partial
					delete query.params

				request.get query, (error, response, body) ->
					@_handleResponse(error, response, body, token)

module.exports = http