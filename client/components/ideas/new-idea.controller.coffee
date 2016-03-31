_convertHorizonDate = (horizonDateText) ->
  switch horizonDateText
    when '1 day' then moment().add(1, 'days').toDate()
    when '1 week' then moment().add(7, 'days').toDate()
    when '1 month' then moment().add(1, 'months').toDate()
    when '3 months' then moment().add(3, 'months').toDate()
    when '6 months' then moment().add(6, 'months').toDate()
    when '1 year' then moment().add(1, 'years').toDate()
    else moment().add(30, 'days').toDate()

NewIdeaCtrl = ($scope, $reactive, $meteor, $state, $ionicPopup, $filter) ->
  $reactive(@).attach($scope)
  @lastPrice = 'NA'
  ideaDefaults =
    userId: Meteor.userId()
    basis: 'technical'
    horizonDate: '1 month'
  @idea = _.extend(ideaDefaults, {})

  # @save = save.bind(@, @idea, $state)
  @save = ->
    console.log "@save()", @idea
    submission = _.extend(@idea, {})
    submission.horizonDate = _convertHorizonDate(@idea.horizonDate)
    Ideas.insert submission, (err) ->
      return console.log(err) if err?
      @idea = _.extend(ideaDefaults, {})
      $state.go('list-ideas')

  @updateStockQuote = => @lastPrice = $filter('stockQuote')(@idea.symbol)

  @helpers()

NewIdeaCtrl.$inject = ['$scope', '$reactive', '$meteor', '$state', '$ionicPopup', '$filter']

angular
  .module('finblocks')
  .controller('NewIdeaCtrl', NewIdeaCtrl)

