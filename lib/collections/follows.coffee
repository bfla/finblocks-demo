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
