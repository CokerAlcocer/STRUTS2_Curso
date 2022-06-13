package com.utez.edu.mx.coursestruts.user;

import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.status.BeanStatus;

import java.util.List;

public class BeanUser {
    private int id;
    private String email, password, createAt;
    private BeanStatus status;
    private List<BeanRol> roles;
    private BeanPerson person;

    public BeanUser() {
    }

    public BeanUser(String email, String password, String createAt, BeanStatus status, List<BeanRol> roles, BeanPerson person) {
        this.email = email;
        this.password = password;
        this.createAt = createAt;
        this.status = status;
        this.roles = roles;
        this.person = person;
    }

    public BeanUser(int id, String email, String createAt, BeanStatus status) {
        this.id = id;
        this.email = email;
        this.createAt = createAt;
        this.status = status;
    }

    public BeanUser(int id, String name, String password, String createAt, BeanStatus status, List<BeanRol> roles, BeanPerson person) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.createAt = createAt;
        this.status = status;
        this.roles = roles;
        this.person = person;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public BeanStatus getStatus() {
        return status;
    }

    public void setStatus(BeanStatus status) {
        this.status = status;
    }

    public List<BeanRol> getRoles() {
        return roles;
    }

    public void setRoles(List<BeanRol> roles) {
        this.roles = roles;
    }

    public BeanPerson getPerson() {
        return person;
    }

    public void setPerson(BeanPerson person) {
        this.person = person;
    }
}
