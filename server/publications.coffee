# Meteor.publish 'ideas', (userId) ->
#   if userId?
#     followings = UserUtils.followsForUser(userId)
#     followings.push(userId)
#     return Ideas.find({userId: { $in: followings }})
#   else
#     # Ideas.find(public: true)
#     Ideas.find()
