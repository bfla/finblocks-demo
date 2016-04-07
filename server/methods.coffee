_formatQueryString = (symbols) ->
  queryString = "text="
  len = symbols.length
  _.each symbols, (symbol, i) ->
    queryString += symbol
    queryString += '%2C' if len > 1
  return queryString

_fetchStockData = (symbols) ->
  url = 'https://www.enclout.com/api/v1/yahoo_finance/show.json'
  queryString = _formatQueryString(symbols)
  req =
    query: queryString
    # FIXIT - let's deprecate this key when we deploy to production
    auth_token: 'm1UdE7LJWxdM4kZUHcE6'

  try
    res = HTTP.get(url, req)
    throw new Meteor.Error('bad-stock-api-res', 'Request failed') unless res?
    equities = res.data
    return equities
  catch err
    throw new Meteor.Error('bad-stock-api-res', err.message)

Meteor.methods
  updateStockData: (symbols) ->
    check(symbols, Array)
    check(symbols[0], String)
    @unblock()
    _fetchStockData(symbols)
