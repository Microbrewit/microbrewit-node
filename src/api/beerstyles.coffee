###
API wrapper for beerstyles endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class BeerStyles extends ItemEndpoint
	endpoint: 'beerstyles'

module.exports = BeerStyles