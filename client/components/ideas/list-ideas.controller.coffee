favoriteCb = (err) ->
  return console.log(err) if err?

isFavorite = (ideaId) ->
  return true if Favorites.findOne(userId: Meteor.userId(), ideaId: ideaId)?
  return false

favorite = (ideaId) ->
  submission =
    userId: Meteor.userId()
    ideaId: ideaId
  Favorites.insert(submission, favoriteCb)

unfavorite = (ideaId) ->
  favorite = Favorites.findOne(userId: Meteor.userId(), ideaId: ideaId)
  return console.log('unfavorite() requires a _favorite') unless favorite?._id
  Favorites.remove(favorite._id)

ListIdeasCtrl = ($scope, $state, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  return $state.go('login') unless Meteor.userId()

  @subscribe('ideas')
  @subscribe('favorites')
  @subscribe('users')

  @isFavorite = isFavorite
  @favorite = favorite
  @unfavorite = unfavorite

  @helpers(
    ideas: ->
      query =
        userId: {$in: UserUtils.followsForUser(Meteor.userId())} # Only for analysts I follow
        horizonDate: {$gte: new Date()} # Only un-expired ideas
      Ideas.find(query).fetch()
  )

ListIdeasCtrl.$inject = ['$scope', '$state', '$reactive', '$meteor']

angular
  .module('finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);
