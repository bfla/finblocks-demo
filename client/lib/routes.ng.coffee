
config = ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    # .state('login', {
    #   url: '/login',
    #   templateUrl: 'client/components/users/login.html',
    #   controller: 'LoginCtrl as login'
    # })
    .state('list-ideas',
      url: '/ideas'
      templateUrl: 'client/components/ideas/list-ideas.html'
      controller: 'ListIdeasCtrl as listIdeas'
    )

  $urlRouterProvider.otherwise('/ideas')

angular
  .module('Finblocks')
  .config(config)
