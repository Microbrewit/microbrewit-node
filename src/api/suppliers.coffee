###
API wrapper for suppliers endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint'

class Suppliers extends ItemEndpoint
	endpoint: 'suppliers'

module.exports = Suppliers