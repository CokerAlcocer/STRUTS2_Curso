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
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content border-0">
            <div class="card border-0">
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
                                    <input class="form-control" ng-model="user.person.birthdate" type="date" autocomplete="off" required>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-lg-6">
                            <div class="col-12 input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Email: </span>
                                </div>
                                <input class="form-control" placeholder="exmaple@mail.com" ng-model="user.person.name" type="email" autocomplete="off" required>
                            </div>
                            <div class="col-12 input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Contraseña: </span>
                                </div>
                                <input class="form-control" placeholder="Contraseña" ng-model="user.person.name" type="password" autocomplete="off" required>
                            </div>
                            <div class="col-12 input-group" ng-init="findAllStatus()">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">Estado: </span>
                                </div>
                                <select required class="form-control" name="status" ng-model="rol.status" ng-options="status.name for status in arrayStatus track by status.id" id="status">
                                    <option value="">Seleccione una opción</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" ng-click="createRol()">Guardar</button>
                </div>
            </div>
            <div class="card border-0 mt-3" ng-init="findAllRoles()">
                <div class="card-header text-white bg-dark pb-2">
                    <h3><i class="fas fa-brand"></i> Asignar roles</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <div class="card shadow mb-3" ng-repeat="rol in arrayRoles | orderBy: 'name'">
                                <strong ng-bind="rol.name"></strong>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="card shadow" ng-repeat="rol in selectedRoles | orderBy: 'name'">
                                <h5 ng-bind="rol.name"></h5>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" ng-click="createRol()">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>