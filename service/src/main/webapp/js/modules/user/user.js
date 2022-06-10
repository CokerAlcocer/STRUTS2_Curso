app.controller('user', ['$scope', '$http', '$window', function($scope, $http){
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayStatus = [];
    $scope.arrayRoles = [];
    $scope.selectedRoles = [];

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
            $scope.findAllRoles()
            $('#addRole').modal('hide')
        })
    }

    $scope.findAllRoles = () => {
        console.log("jkldsjgfkljsgl")
        $http({
            method: 'GET',
            url: 'http://localhost:8080/CourseStruts_war_exploded/findAllRoles'
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
            url: 'http://localhost:8080/CourseStruts_war_exploded/updateRole',
            data: `data=${angular.toJson($scope.updatedRole)}`
        }).then(function (response) {
            console.log(response)
            $scope.findAllRoles()
            $('#updateRole').modal('hide')
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

}])