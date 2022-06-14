<%--
  Created by IntelliJ IDEA.
  User: CDS-UTEZ
  Date: 10/06/2022
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal de Registro de Rol-->
<div class="modal fade" id="addUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content border-0">
            <div class="card border-0" ng-init="findAllRoles()">
                <div class="card-header text-white bg-dark pb-2">
                    <h3><i class="fas fa-user"></i> Agregar usuario</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Nombre: </span>
                                    </div>
                                    <input class="form-control" placeholder="Angel Yazveck" ng-model="user.person.name" type="text" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">AP: </span>
                                    </div>
                                    <input class="form-control" placeholder="Alcocer" ng-model="user.person.surname" type="text" autocomplete="off" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">AM: </span>
                                    </div>
                                    <input class="form-control" placeholder="Durán" ng-model="user.person.lastname" type="text" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Teléfono: </span>
                                    </div>
                                    <input class="form-control" placeholder="777XXXOOOO" ng-model="user.person.phone" type="phone" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Fecha de nacimiento: </span>
                                    </div>
                                    <input class="form-control" ng-model="user.person.birthday" type="date" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Email: </span>
                                    </div>
                                    <input class="form-control" placeholder="exmaple@mail.com" ng-model="user.email" type="email" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Contraseña: </span>
                                    </div>
                                    <input class="form-control" placeholder="Contraseña" ng-model="user.password" type="password" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group" ng-init="findAllStatus()">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Estado: </span>
                                    </div>
                                    <select required class="form-control" name="status" ng-model="user.status" ng-options="status.name for status in arrayStatus track by status.id" id="status">
                                        <option value="">Seleccione una opción</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 mt-4 mt-lg-0">
                            <h5>Roles del usuario</h5>
                            <div class="row">
                                <div class="col-6">
                                    <div class="card shadow mb-3 p-3" ng-repeat="rol in arrayRoles | orderBy: 'name'">
                                        <div class="row">
                                            <div class="col-10">
                                                <strong ng-bind="rol.name"></strong>
                                            </div>
                                            <div class="col-2 d-flex align-items-center justify-content-end"   >
                                                <i role="button" class="fas fa-angle-right" ng-click="selectRol(rol)"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="card shadow mb-3 p-3" ng-repeat="rol in selectedRoles | orderBy: 'name'">
                                        <div class="row">
                                            <div class="col-2 d-flex align-items-center justify-content-start">
                                                <i role="button" class="fas fa-angle-left" ng-click="removeRol(rol)"></i>
                                            </div>
                                            <div class="col-10 d-flex justify-content-end">
                                                <strong ng-bind="rol.name"></strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" ng-click="sendUser()">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updateUser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content border-0">
            <div class="card border-0" ng-init="findAllRoles()">
                <div class="card-header text-white bg-dark pb-2">
                    <h3><i class="fas fa-user"></i> Agregar usuario</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 col-lg-6">
                            <div class="row">
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Nombre: </span>
                                    </div>
                                    <input class="form-control" placeholder="Angel Yazveck" ng-model="user.person.name" type="text" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">AP: </span>
                                    </div>
                                    <input class="form-control" placeholder="Alcocer" ng-model="user.person.surname" type="text" autocomplete="off" required>
                                    <div class="input-group-append">
                                        <span class="input-group-text">AM: </span>
                                    </div>
                                    <input class="form-control" placeholder="Durán" ng-model="user.person.lastname" type="text" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Teléfono: </span>
                                    </div>
                                    <input class="form-control" placeholder="777XXXOOOO" ng-model="user.person.phone" type="phone" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Fecha de nacimiento: </span>
                                    </div>
                                    <input class="form-control" ng-model="user.person.birthday" type="date" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Email: </span>
                                    </div>
                                    <input class="form-control" placeholder="exmaple@mail.com" ng-model="user.email" type="email" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Contraseña: </span>
                                    </div>
                                    <input class="form-control" placeholder="Contraseña" ng-model="user.password" type="password" autocomplete="off" required>
                                </div>
                                <div class="col-12 input-group" ng-init="findAllStatus()">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text">Estado: </span>
                                    </div>
                                    <select required class="form-control" name="status" ng-model="user.status" ng-options="status.name for status in arrayStatus track by status.id" id="status">
                                        <option value="">Seleccione una opción</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6 mt-4 mt-lg-0">
                            <h5>Roles del usuario</h5>
                            <div class="row">
                                <div class="col-6">
                                    <div class="card shadow mb-3 p-3" ng-repeat="rol in arrayRoles | orderBy: 'name'">
                                        <div class="row">
                                            <div class="col-10">
                                                <strong ng-bind="rol.name"></strong>
                                            </div>
                                            <div class="col-2 d-flex align-items-center justify-content-end"   >
                                                <i role="button" class="fas fa-angle-right" ng-click="selectRol(rol)"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="card shadow mb-3 p-3" ng-repeat="rol in selectedRoles | orderBy: 'name'">
                                        <div class="row">
                                            <div class="col-2 d-flex align-items-center justify-content-start">
                                                <i role="button" class="fas fa-angle-left" ng-click="removeRol(rol)"></i>
                                            </div>
                                            <div class="col-10 d-flex justify-content-end">
                                                <strong ng-bind="rol.name"></strong>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" ng-click="sendUser()">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>