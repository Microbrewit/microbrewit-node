###
API wrapper for ingredients endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Ingredients extends ItemEndpoint
	endpoint: 'ingredients'

module.exports = Ingredients