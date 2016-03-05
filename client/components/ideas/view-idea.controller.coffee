ViewIdeaCtrl = ($scope, $reactive, $meteor, $stateParams, $ionicPopup) ->
  $reactive(@).attach($scope)
  ideaId = $stateParams.ideaId

  @buy = ->
    alertPopup = $ionicPopup.alert(
      title: 'Buy buy buy!'
      template: 'Transactions do not work in this demo.')

  @helpers(
    idea: -> Ideas.findOne(ideaId)
  )

angular
  .module('finblocks')
  .controller('ViewIdeaCtrl', ViewIdeaCtrl)
