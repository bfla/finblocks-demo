LoginCtrl = ($scope, $reactive, $state) ->
  $reactive(@).attach($scope)

  @loginWithLinkedIn = ->
    Meteor.loginWithLinkedIn -> $state.go('/ideas')

angular
  .module('finblocks')
  .controller('LoginCtrl', LoginCtrl)
