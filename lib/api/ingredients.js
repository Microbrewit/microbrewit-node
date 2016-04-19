// Generated by CoffeeScript 1.10.0

/*
API wrapper for ingredients endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
 */

(function() {
  var Ingredients, ItemEndpoint,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ItemEndpoint = require('./ItemEndpoint');

  Ingredients = (function(superClass) {
    extend(Ingredients, superClass);

    function Ingredients() {
      return Ingredients.__super__.constructor.apply(this, arguments);
    }

    Ingredients.prototype.endpoint = 'ingredients';

    return Ingredients;

  })(ItemEndpoint);

  module.exports = Ingredients;

}).call(this);