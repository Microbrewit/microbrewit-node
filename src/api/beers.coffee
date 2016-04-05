# GET beers?from={from}&size={size}	
# No documentation available.
# GET beers/user/{username}	
# No documentation available.
# GET beers/{id}	
# No documentation available.
# PUT beers/{id}	
# No documentation available.
# POST beers	
# No documentation available.
# DELETE beers/{id}	
# No documentation available.
# GET beers?query={query}&from={from}&size={size}	
# No documentation available.
# GET beers/last?from={from}&size={size}	
# No documentation available.
# POST beers/beerxml

###
API wrapper for beerstyles endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Beers extends ItemEndpoint
	endpoint: 'beers'

	# Get a user's beers
	# @todo Implement
	user: (query, callback, token) ->
		callback new Error 'Not implemented'

	# POST BeerXML and get a beer object in return
	# @todo Implement
	beerxml: (xml, callback, token) ->
		query = 
			partial: 'beerxml'
			payload: xml
			headers:
				'Content-Type': 'application/xml'
		@post(query, callback, token)

module.exports = Beers