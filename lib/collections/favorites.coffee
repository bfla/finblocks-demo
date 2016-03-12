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
