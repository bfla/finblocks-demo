NewIdeaCtrl = ($scope, $reactive, $meteor) ->
  $reactive(@).attach($scope)
  @idea = {userId: 'foo'}

  _handleResponse = (err) ->
    return console.log(err) if err?
    #TODO - close on success.
    console.log 'success'

  @save = () =>
    console.log 'creating idea...', @idea
    # TODO - use real userId and handle errors
    Ideas.insert(@idea, _handleResponse)

angular
  .module('finblocks')
  .controller('NewIdeaCtrl', NewIdeaCtrl)

