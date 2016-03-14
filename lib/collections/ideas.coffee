@Ideas = new Mongo.Collection('ideas')

_schema = new SimpleSchema
  userId:
    type: String
  description:
    type: String
    max: 144
  symbol:
    type: String
    max: 30
  basis:
    type: String
    allowedValues: ['technical', 'fundamental']
  exitPrice:
    type: Number
    min: 0
  stopLossPrice:
    type: Number
    optional: true
    min: 0
  horizonDate:
    type: Date
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
