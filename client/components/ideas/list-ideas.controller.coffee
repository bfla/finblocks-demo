favoriteCb = (err) ->
  return console.log(err) if err?

isFavorite = (ideaId) ->
  console.log 'isFavorite()', ideaId
  return true if Favorites.findOne(userId: Meteor.userId(), ideaId: ideaId)?
  return false

favorite = (ideaId) ->
  console.log 'favorite()', ideaId
  submission =
    userId: Meteor.userId()
    ideaId: ideaId
  Favorites.insert(submission, favoriteCb)

unfavorite = (ideaId) ->
  console.log 'unfavorite()', ideaId
  favorite = Favorites.findOne(userId: Meteor.userId(), ideaId: ideaId)
  return console.log('unfavorite() requires a _favorite') unless favorite?._id
  Favorites.remove(favorite._id)

ListIdeasCtrl = ($scope, $state, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  return $state.go('login') unless Meteor.userId()
  @isFavorite = isFavorite
  @favorite = favorite
  @unfavorite = unfavorite

  @helpers(
    ideas: ->
      query = {userId: {$in: UserUtils.followsForUser(Meteor.userId())}}
      Ideas.find(query).fetch()
  )

ListIdeasCtrl.$inject = ['$scope', '$state', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);
