angular
  .module('Finblocks')
  .controller('ListIdeasCtrl', ListIdeasCtrl);

function ListIdeasCtrl ($scope, $reactive, $meteor) {
  $reactive(this).attach($scope);

  // this.helpers({
  //   data() {
  //     return Ideas.find();
  //   }
  // });

}