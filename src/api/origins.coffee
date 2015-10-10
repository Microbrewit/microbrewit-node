###
API wrapper for origins endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Origins extends ItemEndpoint
	endpoint: 'origins'

module.exports = Origins