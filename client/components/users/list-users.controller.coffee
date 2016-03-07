ListUsersCtrl = ($scope, $reactive, $meteor, $ionicPopup) ->
  $reactive(@).attach($scope)

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
    users: -> return Meteor.users.find()
  )
ListUsersCtrl.$inject = ['$scope', '$reactive', '$meteor', '$ionicPopup']

angular
  .module('finblocks')
  .controller('ListUsersCtrl', ListUsersCtrl)
