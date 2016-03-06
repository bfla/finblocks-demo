config = ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state('login',
      url: '/login'
      templateUrl: 'client/components/users/login.html'
      controller: 'LoginCtrl as login'
    )
    .state('list-ideas',
      url: '/ideas'
      templateUrl: 'client/components/ideas/list-ideas.html'
      controller: 'ListIdeasCtrl as listIdeas'
    )
    .state('new-idea',
      url: '/ideas/new'
      templateUrl: 'client/components/ideas/new-idea.html'
      controller: 'NewIdeaCtrl as newIdea'
    )
    .state('view-idea',
      url: '/ideas/:ideaId'
      templateUrl: 'client/components/ideas/view-idea.html'
      controller: 'ViewIdeaCtrl as viewIdea'
    )
    .state('list-users',
      url: '/analysts'
      templateUrl: 'client/components/users/list-users.html'
      controller: 'ListUsersCtrl as listUsers'
    )
    .state('view-user',
      url: '/users/:userId'
      templateUrl: 'client/components/users/view-user.html'
      controller: 'ViewUserCtrl as viewUser'
    )

  $urlRouterProvider.otherwise('/ideas')
config.$inject = ['$stateProvider', '$urlRouterProvider']

angular
  .module('finblocks')
  .config(config)
