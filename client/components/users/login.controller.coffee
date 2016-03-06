redirectFromLogin = ($state) ->
  return $state.go('list-ideas')

LoginCtrl = ($scope, $state, $reactive) ->
  redirectFromLogin($state) if Meteor.userId()
  $reactive(@).attach($scope)

  Accounts.onLogin -> redirectFromLogin($state)

  @loginWithLinkedIn = ->
    Meteor.loginWithLinkedIn -> $state.go('list-ideas')

angular
  .module('finblocks')
  .controller('LoginCtrl', LoginCtrl)
