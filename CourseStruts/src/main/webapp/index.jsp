<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%String context = application.getContextPath();%>
<!DOCTYPE html>
<html ng-app="CourseStruts" lang="es">
<head>
    <jsp:include page="./views/layout/head.jsp" />
    <script src="<%=context%>/js/modules/role/role.js"></script>
    <title>Roles | 20203TN066</title>
</head>
<body ng-controller="role" style="font-family: Arial">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Gestión de usuarios</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<%=context%>/index">Roles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=context%>/user">Usuarios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Personas</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div>
</nav>

<div class="container mt-3">
    <div class="row d-flex align-items-center">
        <div class="col-6">
            <h1>Roles</h1>
        </div>
        <div class="col-6 text-right">
            <i role="button" data-target="#addRole" data-toggle="modal"
               class="h1 text-success fas fa-plus"></i>
        </div>
    </div>
    <hr class="mt-0">
    <!--CONTENIDO DE LA PÁGINA-->
    <table class="table" ng-init="findAllRoles()">
        <thead>
        <tr>
            <th scope="col">#</th>
            <th scope="col">Rol</th>
            <th scope="col">Estado</th>
            <th scope="col" class="text-center">Acciones</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="rol in arrayRoles | orderBy: 'status.name'">
            <th ng-bind="$index + 1"></th>
            <td ng-bind="rol.name"></td>
            <td ng-bind="rol.status.name"></td>
            <td class="text-center">
                <button class="btn btn-primary" ng-click="detailsRole(rol)"><i class="fas fa-info-circle"></i></button>
                <button class="btn btn-warning" ng-click="updateRole(rol)"><i class="fas fa-edit"></i></button>
                <button class="btn btn-danger"><i class="fas fa-trash"></i></button>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<jsp:include page="./views/component/role/roleModals.jsp"/>
<jsp:include page="./views/layout/footer.jsp"/>
</body>

</html>