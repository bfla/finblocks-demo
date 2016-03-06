ListUsersCtrl = ($scope, $reactive, $meteor, $ionicPopup) ->
  $reactive(@).attach($scope)

  @follow = (userId) -> dontWorkYet($ionicPopup)

  @helpers(
    users: -> return Meteor.users.find()
  )
ListUsersCtrl.$inject = ['$scope', '$reactive', '$meteor', '$ionicPopup']

angular
  .module('finblocks')
  .controller('ListUsersCtrl', ListUsersCtrl)
