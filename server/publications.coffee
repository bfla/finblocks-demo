Meteor.publish 'ideas', -> Ideas.find()

# TODO - Add private ideas?
# Meteor.publish 'ideas', (userId) ->
#   if userId?
#     followings = UserUtils.followsForUser(userId)
#     followings.push(userId)
#     return Ideas.find({userId: { $in: followings }})
#   else
#     # Ideas.find(public: true)
#     Ideas.find()

Meteor.publish 'favorites', ->
  throw Meteor.Error('favorites-unauthorizewd-sub') unless @userId
  Favorites.find(userId: userId)

Meteor.publish 'follows', ->
  throw Meteor.Error('follows-unauthorizewd-sub') unless @userId
  Follows.find(userId: userId)
