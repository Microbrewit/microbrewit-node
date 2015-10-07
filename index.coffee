###
Microbrewit-node

Node.js library for communicating with the Microbrew.it API.

@author Torstein Thune
@copyright Microbrew.it 2015
###

http = require './http'

acceptedInitValues = [
	'apiUrl'
	'clientId'
]

defaults =
	apiUrl: 'http://api.microbrew.it'

modules = 
	hops: './hops'
	fermentables: './fermentables'
	http: './http'

exports.init = (config, callback) ->
	# Init with params values
	for key, val of config
		if key in acceptedInitValues
			http.prototype[key] = val

	# Add default values
	for key, val of defaults
		http.prototype[key] ?= val

	# Make API endpoints available
	for key,val of modules
		@[key] = new (require val)()

	



