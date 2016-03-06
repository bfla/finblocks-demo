NewIdeaCtrl = ($scope, $reactive, $meteor, $state) ->
  $reactive(@).attach($scope)
  @idea =
    userId: Meteor.userId()
    startDate: new Date()
    endDate: moment().add(7, 'days').toDate()
    expiry: moment().add(7, 'days').toDate()

  _handleResponse = (err) ->
    return console.log(err) if err?
    #TODO - close on success.
    console.log 'success'
    state.go('ideas')

  @save = () =>
    console.log 'creating idea...', @idea
    Ideas.insert(@idea, _handleResponse)

angular
  .module('finblocks')
  .controller('NewIdeaCtrl', NewIdeaCtrl)

