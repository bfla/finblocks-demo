ViewUserCtrl = ($scope, $reactive, $meteor, $stateParams, $ionicPopup) ->
  $reactive(@).attach($scope)
  userId = $stateParams.userId
  @follow = -> dontWorkYet($ionicPopup)

  @helpers(
    ideas: -> Ideas.find(userId: userId)
    user: -> Meteor.users.findOne(userId)
  )

ViewUserCtrl.$inject = ['$scope', '$reactive', '$meteor', '$stateParams', '$ionicPopup']

angular
  .module('finblocks')
  .controller('ViewUserCtrl', ViewUserCtrl)
