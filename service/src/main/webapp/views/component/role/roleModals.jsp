<%--
  Created by IntelliJ IDEA.
  User: CDS-UTEZ
  Date: 09/06/2022
  Time: 12:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Modal de Registro de Rol-->
<div class="modal fade" id="addRole" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0">
            <div class="card border-0">
                <div class="card-header text-white bg-dark pb-2">
                    <h3><i class="fas fa-plus"></i> Agregar rol</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre: </span>
                            </div>
                            <input class="form-control" placeholder="Ej. Administrador" ng-model="rol.name" type="text" id="name" name="name" autocomplete="off" required>
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
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button class="btn btn-primary" ng-click="createRol()">Guardar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Modificación de Datos del Rol-->
<div class="modal fade" id="updateRole" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0">
            <div class="card border-0">
                <div class="card-header text-white bg-dark pb-2">
                    <h3><i class="fas fa-edit"></i> Modificar datos del rol</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Nombre: </span>
                            </div>
                            <input class="form-control" ng-model="updatedRole.name" type="text" id="u_name" name="u_name" autocomplete="off" required>
                        </div>
                        <div class="col-12 input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Estado: </span>
                            </div>
                            <select required class="form-control" name="status" ng-model="updatedRole.status" ng-options="status.name for status in arrayStatus track by status.id">
                                <option value="">Seleccione una opción</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Descartar</button>
                    <button class="btn btn-primary" ng-click="sendRoleUpdate()">Modificar</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Información del Rol-->
<div class="modal fade" id="detailsRoleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0">
            <div class="card border-0">
                <div class="card-header text-white bg-dark pb-2">
                    <h3><i class="fas fa-edit"></i> Información del rol</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-12 input-group mb-3">
                            <h4><strong>Nombre:</strong> {{detailRole.name}}</h4>
                        </div>
                        <div class="col-12 input-group">
                            <h4><strong>Estado:</strong> {{detailRole.status.name}}</h4>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</div>
