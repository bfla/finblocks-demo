ListFollowsCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)

  unfollowCb = (err) ->
    return console.log(err) if err

  @unfollow = (userId) ->
    follow = Follows.findOne(
      followerId: Meteor.userId()
      followingId: userId)
    Follows.remove(follow._id, unfollowCb)

  @helpers(
    users: -> Meteor.users.find({_id: {$in: UserUtils.followsForUser(Meteor.userId())}})
  )

ListFollowsCtrl.$inject = ['$scope', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListFollowsCtrl', ListFollowsCtrl)
