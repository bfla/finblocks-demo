ListFavoritesCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)


  @helpers(
    ideas: -> Ideas.find(_id: {$in: UserUtils.favoritesForUser(Meteor.userId())})
  )

ListFavoritesCtrl.$inject = ['$scope', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListFavoritesCtrl', ListFavoritesCtrl)
