
ListIdeasCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)

  # @helpers(
  #   data: -> return Ideas.find()
  # )

angular
  .module('Finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);
