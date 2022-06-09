<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html ng-app="CourseStruts" lang="es">
<head>
    <jsp:include page="./views/layout/head.jsp" />
    <title>Roles | 20203TN066</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Gestión de usuarios</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Roles</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Usuarios</a>
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
               class="h1 mr-4 text-success fas fa-plus"></i>
            <i role="button" data-target="#updateRole" data-toggle="modal" class="h1 text-primary fas fa-edit"></i>
        </div>
    </div>
    <hr class="mt-0">
    <!--CONTENIDO DE LA PÁGINA-->
</div>

<jsp:include page="./views/component/role/roleModals.jsp"/>
</body>
<jsp:include page="./views/layout/footer.jsp"/>

</html>