stockQuote = ->
  (symbol) ->
    #TODO - get real stock quotes
    return (Math.random() * 100).toFixed(2)

angular
  .module('finblocks')
  .filter('stockQuote', stockQuote)
