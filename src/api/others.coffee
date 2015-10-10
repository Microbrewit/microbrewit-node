###
API wrapper for other ingredients (others endpoint)

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Others extends ItemEndpoint
	endpoint: 'others'

module.exports = Others