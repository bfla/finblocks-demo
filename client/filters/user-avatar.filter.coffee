userAvatar = ->
  (userId) ->
    user = Meteor.users.findOne(userId)
    if user?.profile?.avatar
      return user.profile.avatar
    else
      return '/user-default.svg'

angular
  .module('finblocks')
  .filter('userAvatar', userAvatar)
