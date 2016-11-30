var app = angular.module('sms_app', ['ngRoute','angularUtils.directives.dirPagination']);//angularUtils.directives.dirPagination FOR LATER

app.config(['$routeProvider', function ($routeProvider) { 
   $routeProvider 
   .when("/", {
      templateUrl: "views/all-users.html",
      controller: "mainController"
   })
   .when('/users/:id', {
      templateUrl : 'views/single-user.html',
      controller : 'singleController'
   }) 
    //page not found 404
    .otherwise({templateUrl: "views/404.html"});
    // .otherwise("/404", {templateUrl: "views/404.html", controller: "404Ctrl"});
   // .otherwise('/');
 
}]);


app.controller('mainController', ['$scope', '$http','$route','$routeParams', function($scope,$http,$route,$routeParams){

   $http.get('/users').success(function(data){

      $scope.usersData = data;
   }).error(function(error){
      console.log(error)
   });

   $scope.insertUser = function(info) {

      $http.post('/users/add', {

      "userFirstName":info.userFirstName,
      "userLastName": info.userLastName,
      "userAddress": info.userAddress,
      "userEmail" : info.userEmail,
      "userMobile" : info.userMobile,
      "userRole" : info.userRole,
      "userClass": info.userClass
      }).success(function(data){

          console.log(info)
         $(".modal-backdrop").fadeOut();
         $route.reload();
         console.log('sucsess')
      }).error(function(error){
         console.log(error);
      })
   };
      // $scope.selectUser = function(user){
      //    console.log(user)
      //    $http.get('/users/edit/' + user).success(function(data){
      //       console.log(data)
      //    }).error(function(error){console.log(error)});
      // }
   //    $scope.UpdateInfo = function(info){
   //    console.log(info)
   //    // info.userId
   //    // +$routeParams.id
   //    $http.post('/users/edit/'+ info.userId,{
         
   //    "userFirstName":info.userFirstName,
   //    "userLastName": info.userLastName,
   //    "userAddress": info.userAddress,
   //    "userEmail" : info.userEmail,
   //    "userMobile" : info.userMobile,
   //    "userRole" : info.userRole,
   //    "userClass": info.userClass

   //    }).success(function(data){
         
   //       $(".modal-backdrop").fadeOut();
   //       // $('.modal-open').css({"overflow":"scroll"});

   //       $route.reload();
   //       console.log('sucsess')

   //    }).error(function(error){console.log(error)});
   // };
   
   $scope.delUser = function(user){
      console.log(user)
      if (confirm('This user will be deleted')){

         $http.delete('/users/delete/'+ user).success(function(data){

            console.log('success');
            $(".modal-backdrop").fadeOut();
            $route.reload();
         }).error(function(error){console.log(error)})
      }

   };
    $scope.sort = function(keyname){
        $scope.sortKey = keyname;
        $scope.reverse = !$scope.reverse;
    };
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
