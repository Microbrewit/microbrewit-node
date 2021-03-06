// Generated by CoffeeScript 1.10.0

/*
API wrapper for hops endpoint

@author Torstein Thune
@copyright Microbrew.it 2015
 */

(function() {
  var Hops, ItemEndpoint,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  ItemEndpoint = require('./ItemEndpoint');

  Hops = (function(superClass) {
    extend(Hops, superClass);

    function Hops() {
      return Hops.__super__.constructor.apply(this, arguments);
    }

    Hops.prototype.endpoint = 'hops';

    Hops.prototype.forms = function(query, callback, token) {
      var base;
      query.partial = 'forms';
      if (query.headers == null) {
        query.headers = {};
      }
      if ((base = query.headers)['Content-type'] == null) {
        base['Content-type'] = 'application/json';
      }
      return this.get(query, callback, token);
    };

    return Hops;

  })(ItemEndpoint);

  module.exports = Hops;

}).call(this);
