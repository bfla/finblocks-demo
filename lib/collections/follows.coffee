@Follows = new Mongo.Collection('follows')

_schema = new SimpleSchema
  followerId:
    type: String
  followingId:
    type: String
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Follows.attachSchema(_schema)

Follows.allow
  insert: (userId, doc) -> return true if userId is doc.followerId
  update: (userId, doc, fieldNames, mod) -> return false
  remove: (userId, doc) -> return true if userId is doc.followerId

# Follows.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc, fieldNames) -> return true
  # remove: (userId, doc) -> return true
