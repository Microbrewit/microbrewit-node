###
API wrapper for fermentables endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
###

ItemEndpoint = require './ItemEndpoint.coffee'

class Fermentables extends ItemEndpoint
	endpoint: 'fermentables'

module.exports = Fermentables