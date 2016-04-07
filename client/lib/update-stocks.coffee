@updateStocks = ->
  ideas = Ideas.find().fetch()
  equities = Equities.find().fetch()
  symbols = _.pluck(ideas, 'symbol')
  existingSymbols = _.pluck(equities, 'symbol')
  diff = _.difference(symbols, existingSymbols)
  console.log 'diff', diff, symbols, existingSymbols
  return if diff.length is 0
  Meteor.call 'updateStockData', diff, (err, res) ->
    equities = _.extend({}, res)
    _.each equities, (e) -> Equities.upsert(symbol: e.symbol, e)
