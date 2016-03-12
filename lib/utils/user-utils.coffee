

followsForUser = (userId) ->
  followIds = Follows
    .find({followerId: userId})
    .fetch()
    .map (follow) -> follow.followingId

favoritesForUser = (userId) ->
  favoriteIds = Favorites
    .find({userId: userId})
    .fetch()
    .map (favorite) -> favorite.ideaId

api =
  followsForUser: followsForUser
  favoritesForUser: favoritesForUser

@UserUtils = api

