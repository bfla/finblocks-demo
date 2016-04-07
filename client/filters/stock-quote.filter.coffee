stockQuote = ->
  (symbol) ->
    equity = Equities.findOne(symbol: symbol)
    return equity.bid if equity?
    return 'Price unavailable'

angular
  .module('finblocks')
  .filter('stockQuote', stockQuote)
