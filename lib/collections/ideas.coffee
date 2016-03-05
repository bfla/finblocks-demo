@Ideas = new Mongo.Collection('ideas')

_schema = new SimpleSchema
  userId:
    type: String
  description:
    type: String
  symbol:
    type: String
  startDate:
    type: Date
    optional: true
  endDate:
    type: Date
    optional: true
  expiry:
    type: Date
    optional: true
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Ideas.attachSchema(_schema)

Ideas.allow
  insert: (userId, doc) -> userId is doc.userId
  update: (userId, doc, fieldNames, mod) -> userId is doc.userId
  remove: (userId, doc) -> userId is doc.userId

# _whitelistUpdates = (doc) ->
#   n = _.without(doc, 'description', 'symbol').length
#   return true unless n < 1

# Ideas.deny
#   # insert: (userId, doc) -> return true
#   update: (userId, doc) -> _whitelistUpdates(doc)
  # remove: (userId, doc) -> return true
