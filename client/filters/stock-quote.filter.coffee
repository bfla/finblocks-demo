findOrCreateEquity = (symbol) ->
  existing = Equities.findOne(symbol: symbol)
  return existing if existing?

  Meteor.call 'getStock', symbol, (err, res) ->
    throw new Meteor.Error('client-stock-api-res') if err?
    equity = _.extend({}, res)
    console.log('equity', equity)
    Equities.insert(equity) if equity?
    return Equities.findOne(symbol: symbol)

stockQuote = ->
  (symbol) ->
    findOrCreateEquity(symbol).bid

angular
  .module('finblocks')
  .filter('stockQuote', stockQuote)
