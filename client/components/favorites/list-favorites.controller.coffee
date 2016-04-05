unfavorite = (ideaId) ->
  console.log 'unfavorite()', ideaId
  favorite = Favorites.findOne(userId: Meteor.userId(), ideaId: ideaId)
  return console.log('unfavorite() requires a _favorite') unless favorite?._id
  Favorites.remove(favorite._id)

ListFavoritesCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  @unfavorite = unfavorite

  @subscribe('ideas')
  @subscribe('favorites')
  @subscribe('users')

  @helpers(
    ideas: -> Ideas.find(_id: {$in: UserUtils.favoritesForUser(Meteor.userId())})
  )

ListFavoritesCtrl.$inject = ['$scope', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListFavoritesCtrl', ListFavoritesCtrl)
