ListIdeasCtrl = ($scope, $state, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  return $state.go('login') unless Meteor.userId()

  @helpers(
    ideas: -> return Ideas.find().fetch()
  )

ListIdeasCtrl.$inject = ['$scope', '$state', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);
