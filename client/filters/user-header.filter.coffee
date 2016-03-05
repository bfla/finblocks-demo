userHeader = ->
  (userId) ->
    user = Meteor.users.findOne(userId)
    if user?.profile and user?.profile?.firstName
      profile = user.profile
      title = profile.firstName
      title+= ' ' + profile.lastName if profile.lastName
      title+= ', ' + profile.jobTitle if profile.jobTitle
      title+= ' at ' + profile.employer if profile.employer
      return title
    else
      return 'Anonymous user'

angular
  .module('finblocks')
  .filter('userHeader', userHeader)
