MainLayoutCtrl = ($scope, $reactive, $meteor, $ionicSideMenuDelegate) ->
  $reactive(@).attach($scope)

  @closeMenu = -> $ionicSideMenuDelegate.toggleLeft(true)
  @openMenu = -> $ionicSideMenuDelegate.toggleLeft(false)
  @toggleMenu = -> $ionicSideMenuDelegate.toggleLeft()

  #  @helpers(
    #  myColl: -> return
  #  )

angular
  .module('finblocks')
  .controller('MainLayoutCtrl', MainLayoutCtrl)
