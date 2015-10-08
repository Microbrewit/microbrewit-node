###
Microbrewit-node

Node.js library for communicating with the Microbrew.it API.

@author Torstein Thune
@copyright Microbrew.it 2015
###

http = require './api/http'

acceptedInitValues = [
	'apiUrl'
	'clientId'
]

defaults =
	apiUrl: 'http://api.microbrew.it'

modules = 
	# beers: './api/beers'
	beerStyles: './api/beerstyles'
	# breweries: './api/breweries'
	fermentables: './api/fermentables'
	glasses: './api/glasses'
	hops: './api/hops'
	http: './api/http'
	origins: './api/origins'
	others: './api/others'
	search: './api/search'
	suppliers: './api/suppliers'
	# users: './api/users'
	yeasts: './api/yeasts'


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

	return @
