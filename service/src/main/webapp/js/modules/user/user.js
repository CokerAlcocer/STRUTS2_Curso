app.controller('user', ['$scope', '$http', '$window', function($scope, $http){
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayStatus = [];

    $scope.findAllStatus = () => {
        $http({
            method: 'POST',
            url: 'http://localhost:8080/CourseStruts_war_exploded/findAllStatus'
        }).then(function (response) {
            const {data: {listStatus}} = response;
            $scope.arrayStatus = listStatus;
        })
    }

    $scope.createRol = () => {
        $http({
            method: 'POST',
            url: 'http://localhost:8080/CourseStruts_war_exploded/createRol',
            data: `data=${angular.toJson($scope.rol)}`
        }).then((response) => {
            console.log(response)
        })
    }
}])