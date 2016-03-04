angular
  .module('Finblocks')
  .config(config);
 
function config($stateProvider, $urlRouterProvider) {
  $stateProvider
    // .state('login', {
    //   url: '/login',
    //   templateUrl: 'client/components/users/login.html',
    //   controller: 'LoginCtrl as login'
    // })
    .state('list-ideas', {
      url: '/ideas',
      templateUrl: 'client/components/ideas/list-ideas.html',
      controller: 'ListIdeasCtrl as listIdeas'
    });

  $urlRouterProvider.otherwise('/ideas');

}

// function config($stateProvider, $urlRouterProvider) {
//   $stateProvider
//     .state('tab', {
//       url: '/tab',
//       abstract: true,
//       templateUrl: 'client/components/shared/tabs.html',
//       resolve: {
//         user: isAuthorized,
//         chats() {
//           return Meteor.subscribe('chats');
//         }
//       }
//     })
//     .state('tab.chats', {
//       url: '/chats',
//       views: {
//         'tab-chats': {
//           templateUrl: 'client/components/chats/list-chats.html',
//           controller: 'ListChatsCtrl as chats'
//         }
//       }
//     })
//     .state('tab.chat', {
//       url: '/chats/:chatId',
//       views: {
//         'tab-chats': {
//           templateUrl: 'client/components/chats/view-chat.html',
//           controller: 'ViewChatCtrl as viewChat'
//         }
//       }
//     })
//     .state('login', {
//       url: '/login',
//       templateUrl: 'client/components/users/login-user.html',
//       controller: 'LoginUserCtrl as loginUser'
//     })
//     .state('confirmation', {
//       url: '/confirmation/:phone',
//       templateUrl: 'client/components/users/confirm-details.html',
//       controller: 'ConfirmDetailsCtrl as confirmDetails'
//     })
//     .state('profile', {
//       url: '/profile',
//       templateUrl: 'client/components/users/view-user.html',
//       controller: 'ViewUserCtrl as viewUser',
//       resolve: {
//         user: isAuthorized
//       }
//     })
//     .state('tab.settings', {
//       url: '/settings',
//       views: {
//         'tab-settings': {
//           templateUrl: 'client/components/users/settings.html',
//           controller: 'SettingsCtrl as settings',
//         }
//       }
//     });
 
//   $urlRouterProvider.otherwise('tab/chats');

//   function isAuthorized($q) {
//     let deferred = $q.defer();
 
//     if (_.isEmpty(Meteor.user()))
//       deferred.reject('AUTH_REQUIRED');
//     else
//       deferred.resolve();
 
//     return deferred.promise;
//   }

// }