
let url = 'http://localhost:8080/CourseStruts_war_exploded/'

app.controller('user', ['$scope', '$http', '$window', function($scope, $http){
    $http.defaults.headers.post["Content-Type"] = "application/x-www-form-urlencoded";

    $scope.arrayStatus = [];
    $scope.arrayRoles = [];
    $scope.selectedRoles = [];
    $scope.arrayUsers = [];

    // RECUPERACIÓN DE INFORMACIÓN
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
            const {data: {listRoles}} = response;
            $scope.arrayRoles = listRoles;
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

    // ENVÍO DE INFORMACIÓN

    $scope.sendUser = () => {
        $scope.user.roles = $scope.selectedRoles
        $scope.user.person.birthday = `${$scope.user.person.birthday.getFullYear()}-${$scope.user.person.birthday.getMonth()+1}-${$scope.user.person.birthday.getDate()}`
        $http({
            method: 'POST',
            url: url + 'sendUser',
            data: `data=${angular.toJson($scope.user)}`
        }).then((response) => {
            $scope.findAllUsers()
            $('#addUser').modal('hide')
        })
    }

    $scope.sendUpdateUser = () => {
        $scope.updatedUser.person.birthday = `${$scope.updatedUser.person.birthday.getFullYear()}-${$scope.updatedUser.person.birthday.getMonth()+1}-${$scope.updatedUser.person.birthday.getDate()}`
        $http({
            method: 'POST',
            url: url + 'updateUser',
            data: `data=${angular.toJson($scope.updatedUser)}`
        }).then((response) => {
            $scope.findAllUsers()
            $('#updateUser').modal('hide')
        })
    }

    // FUNCIONES ADICIONALES

    $scope.getUserRoles = (user) => {
        $http({
            method: 'GET',
            url: url + 'findUserRoles'
        }).then(response => {
            console.log(response)
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

    $scope.detailsUser = (user) => {
        $scope.detailUser = angular.copy(user)
        $('#infoUser').modal('toggle')
    }

    $scope.updateUser = (user) => {
        $scope.updatedUser = angular.copy(user)
        $scope.updatedUser.person.birthday = new Date($scope.updatedUser.person.birthday)
        $('#updateUser').modal('toggle')
    }

    $scope.updateRolesUser = (user) => {
        $scope.arrayRoles = $scope.findAllRoles()
        for(let i = 0; i < user.roles.length; i++){
            $scope.selectedRoles(user.roles[i])
        }
        $('#userRoles').modal('toggle')
    }
}])
