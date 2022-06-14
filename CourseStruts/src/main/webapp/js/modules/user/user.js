
let url = 'http://localhost:8080/CourseStruts_war_exploded/'

app.controller('user', ['$scope', '$http', '$window', function($scope, $http){
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayStatus = [];
    $scope.arrayRoles = [];
    $scope.selectedRoles = [];
    $scope.arrayUsers = [];

    $scope.findAllStatus = () => {
        $http({
            method: 'POST',
            url: url + 'findAllStatus'
        }).then(function (response) {
            const {data: {listStatus}} = response;
            $scope.arrayStatus = listStatus;
        })
    }

    $scope.findAllRoles = () => {
        $http({
            method: 'GET',
            url: url + 'findAllRoles'
        }).then(function (response) {
            console.log(response)
            const {data: {listRoles}} = response;
            $scope.arrayRoles = listRoles;
        })
    }

    $scope.selectRol = (rol) => {
        $scope.selectedRoles.push(rol);
        $scope.arrayRoles.splice($scope.arrayRoles.indexOf(rol), 1)
    }

    $scope.removeRol = (rol) => {
        $scope.arrayRoles.push(rol);
        $scope.selectedRoles.splice($scope.selectedRoles.indexOf(rol), 1)
    }

    $scope.sendUser = () => {
        $scope.user.roles = $scope.selectedRoles
        $scope.user.person.birthday = `${$scope.user.person.birthday.getFullYear()}-${$scope.user.person.birthday.getMonth()+1}-${$scope.user.person.birthday.getDate()}`
        $http({
            method: 'POST',
            url: url + 'sendUser',
            data: `data=${angular.toJson($scope.user)}`
        }).then((response) => {
            console.log(response)
        })
    }

    $scope.findAllUsers = () => {
        $http({
            method: 'GET',
            url: url + 'findAllUsers'
        }).then((response => {
            const {data: {listUser}} = response
             $scope.arrayUsers = listUser
        }));
    }
}])
