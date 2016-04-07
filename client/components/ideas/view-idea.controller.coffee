ViewIdeaCtrl = ($scope, $reactive, $meteor, $stateParams, $ionicPopup) ->
  $reactive(@).attach($scope)
  ideaId = $stateParams.ideaId

  @buy = -> dontWorkYet($ionicPopup)

  @subscribe('ideas')
  @subscribe('users')
  updateStocks()

  @helpers(
    idea: -> Ideas.findOne(ideaId)
  )

ViewIdeaCtrl.$inject = ['$scope', '$reactive', '$meteor', '$stateParams', '$ionicPopup']

angular
  .module('finblocks')
  .controller('ViewIdeaCtrl', ViewIdeaCtrl)
