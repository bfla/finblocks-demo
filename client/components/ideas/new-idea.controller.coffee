save = (idea, $state) ->
  console.log 'creating idea...', idea

  submission = _.extend(idea, {})
  horizonDate = switch submission.horizonDate
    when '1 day' then moment().add(1, 'days').toDate()
    when '1 week' then moment().add(7, 'days').toDate()
    when '1 month' then moment().add(1, 'months').toDate()
    when '3 months' then moment().add(3, 'months').toDate()
    when '6 months' then moment().add(6, 'months').toDate()
    when '1 year' then moment().add(1, 'years').toDate()
  submission.horizonDate = horizonDate
  Ideas.insert submission, (err) ->
    return console.log(err) if err?
    $state.go('ideas')

NewIdeaCtrl = ($scope, $reactive, $meteor, $state, $ionicPopup) ->
  $reactive(@).attach($scope)

  @idea =
    userId: Meteor.userId()

  @save = save.bind(@, @idea, $state)

  @helpers()

NewIdeaCtrl.$inject = ['$scope', '$reactive', '$meteor', '$state', '$ionicPopup']

angular
  .module('finblocks')
  .controller('NewIdeaCtrl', NewIdeaCtrl)

