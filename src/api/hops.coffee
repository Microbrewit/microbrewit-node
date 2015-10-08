###
API wrapper for hops endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint.coffee'

class Hops extends ItemEndpoint
	endpoint: 'hops'

module.exports = Hops