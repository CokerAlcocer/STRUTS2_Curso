
let url = 'http://localhost:8080/CourseStruts_war_exploded/'

app.controller('role', ['$scope', '$http', '$window', function($scope, $http){
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded"

    $scope.arrayStatus = [];
    $scope.arrayRoles = [];

    $scope.findAllStatus = () => {
        $http({
            method: 'POST',
            url: url + 'findAllStatus'
        }).then(function (response) {
            const {data: {listStatus}} = response;
            $scope.arrayStatus = listStatus;
        })
    }

    $scope.createRol = () => {
        $http({
            method: 'POST',
            url: url + 'createRol',
            data: `data=${angular.toJson($scope.rol)}`
        }).then((response) => {
            $scope.findAllRoles()
            $('#addRole').modal('hide')
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

    $scope.detailsRole = (rol) => {
        $scope.detailRole = angular.copy(rol)
        $('#detailsRoleModal').modal('toggle')
    }

    $scope.updateRole = (rol) => {
        $scope.updatedRole = angular.copy(rol)
        $('#updateRole').modal('toggle')
    }

    $scope.sendRoleUpdate = () => {
        $http({
            method: 'POST',
            url: url + 'updateRole',
            data: `data=${angular.toJson($scope.updatedRole)}`
        }).then(function (response) {
            $scope.findAllRoles()
            $('#updateRole').modal('hide')
        })
    }
}])