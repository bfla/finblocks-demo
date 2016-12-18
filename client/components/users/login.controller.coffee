redirectFromLogin = ($state) ->
  return $state.go('list-ideas')

LoginCtrl = ($scope, $state, $reactive, $ionicSideMenuDelegate) ->
  $ionicSideMenuDelegate.toggleLeft()
  redirectFromLogin($state) if Meteor.userId()
  $reactive(@).attach($scope)

  Accounts.onLogin -> redirectFromLogin($state)

  @loginWithLinkedIn = ->
    Meteor.loginWithLinkedIn -> $state.go('list-ideas')

LoginCtrl.$inject = ['$scope', '$state', '$reactive', '$ionicSideMenuDelegate']

angular
  .module('finblocks')
  .controller('LoginCtrl', LoginCtrl)
