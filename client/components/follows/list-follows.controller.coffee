ListFollowsCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  #do something

  @helpers(
    users: -> Meteor.users.find({_id: {$in: UserUtils.followsForUser(Meteor.userId())}})
  )

ListFollowsCtrl.$inject = ['$scope', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListFollowsCtrl', ListFollowsCtrl)
