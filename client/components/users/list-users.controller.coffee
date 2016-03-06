ListUsersCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)

  @helpers(
    users: -> return Meteor.users.find()
  )

angular
  .module('finblocks')
  .controller('ListUsersCtrl', ListUsersCtrl)
