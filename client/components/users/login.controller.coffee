LoginCtrl = ($scope, $reactive) ->
  $reactive(@).attach($scope)

  @loginWithLinkedIn = -> Meteor.loginWithLinkedIn()

angular
  .module('finblocks')
  .controller('LoginCtrl', LoginCtrl)
