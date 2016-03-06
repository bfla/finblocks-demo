save = (idea, $state) ->
  console.log 'creating idea...', idea
  Ideas.insert @idea, (err) ->
    return console.log(err) if err?
    $state.go('ideas')

NewIdeaCtrl = ($scope, $reactive, $meteor, $state, $ionicPopup) ->
  $reactive(@).attach($scope)

  @idea =
    userId: Meteor.userId()
    startDate: new Date()
    endDate: moment().add(7, 'days').toDate()
    expiry: moment().add(7, 'days').toDate()

  @save = save.bind(@, @idea, $state)

  @helpers()

NewIdeaCtrl.$inject = ['$scope', '$reactive', '$meteor', '$state', '$ionicPopup']

angular
  .module('finblocks')
  .controller('NewIdeaCtrl', NewIdeaCtrl)

