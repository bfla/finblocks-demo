stockPrice = ->
  return (
    restrict: 'E'
    templateUrl: 'client/directives/ideas/stock-price.html'
    link: (scope, elem, attrs) ->
      Tracker.autorun ->
        equity = Equities.findOne(symbol: attrs.ngSymbol)
        scope.price = if equity? then equity.bid else '?'
  )

angular
  .module('finblocks')
  .directive('stockPrice', stockPrice)
