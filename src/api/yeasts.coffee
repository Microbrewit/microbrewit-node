###
API wrapper for yeasts endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint.coffee'

class Yeasts extends ItemEndpoint
	endpoint: 'yeasts'

module.exports = Yeasts