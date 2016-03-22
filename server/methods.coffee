Meteor.methods
  getStock: (symbol) ->
    check(symbol, String)
    # check(cb, Function)
    @unblock()
    # url = 'http://dev.markitondemand.com/MODApis/Api/v2/Quote/json'
    url = 'https://www.enclout.com/api/v1/yahoo_finance/show.json'
    req =
      query: "text=#{symbol}"
      # query: "symbol=AAPL"
      auth_token: 'm1UdE7LJWxdM4kZUHcE6'
      # headers:
        # 'Access-Control-Allow-Origin': '*'
        # 'Content-Type': 'application/json'
      #   'Referer': 'http://dev.markitondemand.com/'
    try
      res = HTTP.get(url, req)
      throw new Meteor.Error('bad-stock-api-res', 'Request failed') unless res?
      equity = _.findWhere(res.data, symbol: symbol)
      console.log 'equity', equity
      return (if equity then equity else null)

      # result = HTTP.get url, req, (err, res) ->
        # console.log 'method res', res, err
        # throw new Meteor.Error('bad-stock-api-res', err.message) if err?.message?
        # throw new Meteor.Error('bad-stock-api-res', 'Bad response from stock data API') unless res.statusCode is 200
        # equity = _.findWhere(res.data, symbol: symbol)
        # console.log 'equity', equity
        # return (if equity then equity else null)
    catch err
      console.log('err',err) if err?
      throw new Meteor.Error('bad-stock-api-res', err.message) if err?.message?
