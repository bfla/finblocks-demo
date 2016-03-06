angular
  .module('finblocks', [
    'angular-meteor'
    'ionic'
    'angularMoment'
    'accounts.ui'
  ])

onReady = -> angular.bootstrap(document, ['finblocks'])

# Wait for the client platform to start before bootstrapping angular.
if Meteor.isCordova
  angular.element(document).on('deviceready', onReady)
else
  angular.element(document).ready(onReady)

