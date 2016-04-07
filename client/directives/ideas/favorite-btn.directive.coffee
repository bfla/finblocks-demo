favoriteBtn = ->
  return (
    restrict: 'AE'
    replace: 'true'
    templateUrl: 'client/directives/ideas/favorite-btn.html'
    link: (scope, elem, attrs) ->
      ideaId = attrs._idea
      userId = Meteor.userId()
      scope.isFavorite = Favorites.findOne(userId: userId, ideaId: ideaId)?

      $favoriteBtn = angular.element(elem.querySelector('.favorite-btn'))
      $favoriteBtn.bind('click', ->
        Meteor.call('createFavorite', ideaId)
      )

      $unfavoriteBtn = angular.element(elem.querySelector('.unfavorite-btn'))
      $unfavoriteBtn.bind('click', ->
        favorite = Favorites.findOne(userId: userId, ideaId: ideaId)
        throw Meteor.Error('unfavorite-requires-favorite') unless favorite?
        Favorites.remove(favorite._id)
      )
  )

angular
  .module('finblocks')
  .directive('favoriteBtn', favoriteBtn)
