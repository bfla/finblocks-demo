stockQuote = ->
  return (symbol) ->
    #TODO - get real stock quotes
    return 15.01

angular
  .module('finblocks')
  .filter('stockQuote', stockQuote)
