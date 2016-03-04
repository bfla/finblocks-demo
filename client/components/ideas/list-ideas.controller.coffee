remove = (chat) ->
  console.log 'TODO - add delete function for ideas'
  # Meteor.call('removeChat', chat._id);

ListIdeasCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)

  @remove = remove

  @helpers(
    ideas: -> return Ideas.find()
  )

angular
  .module('Finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);
