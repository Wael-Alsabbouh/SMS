var app = angular.module('sms_app', ['ngRoute']);
//app.controller('editUser',editUser);
//app.directive('oneUser',oneUser);
//app.directive('allUsers',allUsers);
app.config(['$routeProvider', function ($routeProvider) {
   $routeProvider
   .when("/", {
      templateUrl: "view/users.html",
      controller: "mainController"
   })
   .when('/users/:id', {
      templateUrl : 'view/user.html',
      controller : 'singleController'
   }) 
//   .when('/admin', {
//      templateUrl : 'view/user.html',
//      controller : 'adminController'
//   })
   .otherwise("/");
 
}]);


app.controller('mainController', ['$scope', '$http','$routeParams', function($scope,$http,$routeParams){

   $http.get('/users').success(function(data){
      
      $scope.usersData = data;
   }).error(function(error){
      console.log(error)
   });
   
}]);

app.controller('singleController', ['$scope', '$http','$location','$route','$routeParams', function($scope,$http,$location,$route,$routeParams){
   
   $http.get('/users/' + $routeParams.id).success(function(response) {
      
      $scope.names = response.data;
      console.log(response.data) 
      console.log(response.data[0].userFirstName)
      }).error(function(error){
      console.log(error)
      });  

   $scope.editInfo = function(info){
      
   $scope.user = info;
   }
 
   $scope.UpdateInfo = function(info){
      
      $http.post('/users/edit/'+$routeParams.id,{
         
      "userFirstName":info.userFirstName,
      "userLastName": info.userLastName,
      "userAddress": info.userAddress,
      "userEmail" : info.userEmail,
      "userMobile" : info.userMobile,
      "userRole" : info.userRole,
      "userClass": info.userClass

      }).success(function(data){
         
         $(".modal-backdrop").fadeOut();
         $route.reload();
         console.log('sucsess')

      }).error(function(error){console.log(error)});
   }
   
}]);
