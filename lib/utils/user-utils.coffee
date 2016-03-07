

followsForUser = (userId) ->
  followIds = Follows
    .find({followerId: userId})
    .fetch()
    .map (follow) -> follow.followingId

@UserUtils =
  followsForUser: followsForUser
