ListUsersCtrl = ($scope, $reactive, $meteor, $ionicPopup) ->
  $reactive(@).attach($scope)

  @follow = (userId) -> dontWorkYet($ionicPopup)

  @helpers(
    users: -> return Meteor.users.find()
  )


angular
  .module('finblocks')
  .controller('ListUsersCtrl', ListUsersCtrl)
