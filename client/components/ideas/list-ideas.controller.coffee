remove = (chat) ->
  console.log 'TODO - add delete function for ideas'
  # Meteor.call('removeChat', chat._id);

ListIdeasCtrl = ($scope, $state, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  return $state.go('login') unless Meteor.userId()

  @remove = remove

  @helpers(
    ideas: -> return Ideas.find()
  )

angular
  .module('finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);
