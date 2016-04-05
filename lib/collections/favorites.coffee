@Favorites = new Mongo.Collection('favorites')

_schema = new SimpleSchema
  userId:
    type: String
  ideaId:
    type: String
  createdAt:
    type: Date
    defaultValue: new Date()
  updatedAt:
    type: Date
    autoValue: -> new Date()
Favorites.attachSchema(_schema)

Favorites.allow
  insert: (userId, doc) -> return true if userId is doc.userId
  update: (userId, doc, fieldNames, mod) -> return false
  remove: (userId, doc) -> return true if userId is doc.userId

# Favorites.deny
  # insert: (userId, doc) -> return true
  # update: (userId, doc, fieldNames) -> return true
  # remove: (userId, doc) -> return true
