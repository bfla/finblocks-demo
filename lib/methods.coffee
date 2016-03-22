# Meteor.methods
#   getStock: (symbol) ->
#     check(symbol, String)
#     # check(cb, Function)
#     @unblock()
#     # url = 'http://dev.markitondemand.com/MODApis/Api/v2/Quote/json'
#     url = 'https://www.enclout.com/api/v1/yahoo_finance/show.json'
#     req =
#       query: {text: 'AAPL%2CMSFT%2CGOOG'}
#       auth_token: 'm1UdE7LJWxdM4kZUHcE6'
#       # headers:
#         # 'Access-Control-Allow-Origin': '*'
#         # 'Content-Type': 'application/json'
#       #   'Referer': 'http://dev.markitondemand.com/'
#     try
#       result = HTTP.get url, req, (err, res) ->
#         throw new Meteor.Error(err.message) if err?.message?
#         return res
#     catch err
#       throw new Meteor.Error(err.message) if err?.message?
