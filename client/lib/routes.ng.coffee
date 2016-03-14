config = ($stateProvider, $urlRouterProvider) ->
  $stateProvider
    .state('login',
      url: '/login'
      templateUrl: 'client/components/users/login.html'
      controller: 'LoginCtrl as login'
    )
    # Tab controller =============================================
    .state('menu',
      url: '/menu'
      templateUrl: 'client/components/shared/main-layout.html'
      controller: 'MainLayoutCtrl as layout'
      abstract: true
    )
    # Tabs =======================================================
    .state('menu.list-ideas',
      url: '/ideas'
      views:
        menuContent:
          templateUrl: 'client/components/ideas/list-ideas.html'
          controller: 'ListIdeasCtrl as listIdeas'
    )
    .state('menu.new-idea',
      url: '/ideas/new'
      views:
        menuContent:
          templateUrl: 'client/components/ideas/new-idea.html'
          controller: 'NewIdeaCtrl as newIdea'
    )
    .state('menu.list-users',
      url: '/analysts'
      views:
        menuContent:
          templateUrl: 'client/components/users/list-users.html'
          controller: 'ListUsersCtrl as listUsers'
    )
    .state('menu.list-follows',
      url: '/following'
      views:
        menuContent:
          templateUrl: 'client/components/follows/list-follows.html'
          controller: 'ListFollowsCtrl as listFollows'
    )
    .state('menu.list-favorites',
      url: '/favorites'
      views:
        menuContent:
          templateUrl: 'client/components/favorites/list-favorites.html'
          controller: 'ListFavoritesCtrl as listFavorites'
    )
    # Views without tabs =======================================================
    .state('view-user',
      url: '/users/:userId'
      views:
        menuContent:
          templateUrl: 'client/components/users/view-user.html'
          controller: 'ViewUserCtrl as viewUser'
    )
    .state('view-idea',
      url: '/ideas/:ideaId'
      views:
        menuContent:
          templateUrl: 'client/components/ideas/view-idea.html'
          controller: 'ViewIdeaCtrl as viewIdea'
    )

  $urlRouterProvider.otherwise('menu/ideas')

config.$inject = ['$stateProvider', '$urlRouterProvider']

angular
  .module('finblocks')
  .config(config)
