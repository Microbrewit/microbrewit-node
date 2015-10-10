###
API wrapper for glasses endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Glasses extends ItemEndpoint
	endpoint: 'glasses'

module.exports = Glasses