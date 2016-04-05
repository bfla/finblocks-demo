ListUsersCtrl = ($scope, $reactive, $meteor, $ionicPopup) ->
  $reactive(@).attach($scope)
  @subscribe('follows')
  @subscribe('users')

  followCb = (err) ->
    return unless err?
    $ionicPopup.alert(
      title: 'Error'
      template: 'Something went wrong.')

  @follow = (followingId) ->
    newFollow =
      followerId: Meteor.userId()
      followingId: followingId
    Follows.insert(newFollow, followCb)

  @helpers(
    users: ->
      follows = UserUtils.followsForUser(Meteor.userId())
      return Meteor.users.find(_id: {$nin: follows})
  )
ListUsersCtrl.$inject = ['$scope', '$reactive', '$meteor', '$ionicPopup']

angular
  .module('finblocks')
  .controller('ListUsersCtrl', ListUsersCtrl)
