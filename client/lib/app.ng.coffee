angular
  .module('Finblocks', [
    'angular-meteor'
    'ionic'
    'angularMoment'
  ])

onReady = -> angular.bootstrap(document, ['Finblocks'])

# Wait for the client platform to start before bootstrapping angular.
if Meteor.isCordova
  angular.element(document).on('deviceready', onReady)
else
  angular.element(document).ready(onReady)

