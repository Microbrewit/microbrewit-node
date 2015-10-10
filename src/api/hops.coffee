###
API wrapper for hops endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Hops extends ItemEndpoint
	endpoint: 'hops'

module.exports = Hops