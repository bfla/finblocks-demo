@ensureMongoIndexes = ->
  Ideas._ensureIndex({userId: 1})
  Ideas._ensureIndex({symbol: 1})
  Follows._ensureIndex({followerId: 1, followingId: 1}, {unique: 1})
  Favorites._ensureIndex({userId: 1})
