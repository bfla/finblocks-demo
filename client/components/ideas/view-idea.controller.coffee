ViewIdeaCtrl = ($scope, $reactive, $meteor, $stateParams) ->
  $reactive(@).attach($scope)
  ideaId = $stateParams.ideaId

  @helpers(
    idea: -> Ideas.findOne(ideaId)
  )

angular
  .module('finblocks')
  .controller('ViewIdeaCtrl', ViewIdeaCtrl)
