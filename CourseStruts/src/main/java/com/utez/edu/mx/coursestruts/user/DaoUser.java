package com.utez.edu.mx.coursestruts.user;

import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.rol.BeanRol;
import com.utez.edu.mx.coursestruts.rol.DaoRol;
import com.utez.edu.mx.coursestruts.status.BeanStatus;
import com.utez.edu.mx.coursestruts.utils.ConnectionMysql;
import org.apache.struts2.components.Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoUser {

    Connection con;
    ResultSet rs;
    PreparedStatement pstm;

    public boolean saveUser (BeanUser u) throws SQLException{
        boolean state = false;
        try {
            con = ConnectionMysql.getConnection();
            String query = "INSERT INTO person(name, lastname, surname, phone, birthday) VALUES (?, ?, ?, ?, ?)";
            pstm = con.prepareStatement(query);
            pstm.setString(1, u.getPerson().getName());
            pstm.setString(2, u.getPerson().getLastname());
            pstm.setString(3, u.getPerson().getSurname());
            pstm.setString(4, u.getPerson().getPhone());
            pstm.setString(5, u.getPerson().getBirthday());
            if(pstm.executeUpdate() == 1){
                query = "SELECT MAX(id) as id FROM person";
                pstm = con.prepareStatement(query);
                rs = pstm.executeQuery();
                if(rs.next()){
                    query = "INSERT INTO user(email, password, person_id, status_id) VALUES(?, ?, ?, ?)";
                    pstm = con.prepareStatement(query);
                    pstm.setString(1, u.getEmail());
                    pstm.setString(2, u.getPassword());
                    pstm.setInt(3, rs.getInt("id"));
                    pstm.setInt(4, u.getStatus().getId());
                    if(pstm.executeUpdate() == 1){
                        query = "SELECT MAX(id) as id FROM user";
                        pstm = con.prepareStatement(query);
                        rs = pstm.executeQuery();
                        if(rs.next()){
                            for (int i = 0; i < u.getRoles().size(); i++){
                                query = "INSERT INTO rol_has_user(user_id, rol_id) VALUES(?, ?)";
                                pstm = con.prepareStatement(query);
                                pstm.setInt(1, rs.getInt("id"));
                                pstm.setInt(2, u.getRoles().get(i).getId());
                                state = pstm.executeUpdate() == 1;
                            }
                        }
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return state;
    }

    public List<BeanUser> findAll() throws SQLException {
        List<BeanUser> listUsers = new ArrayList<>();
        try {
           con = ConnectionMysql.getConnection();
           String query = "SELECT u.id as user_id, u.email, u.create_at, " +
                       "p.id as person_id, p.name as person_name, p.surname, p.lastname, p.birthday, p.phone, " +
                       "s.id as status_id, s.name as status_name FROM user u INNER JOIN person p ON u.person_id = p.id " +
                       "INNER JOIN status s ON u.status_id = s.id";
           pstm = con.prepareStatement(query);
           rs = pstm.executeQuery();
           while(rs.next()){

               listUsers.add(new BeanUser(
                       rs.getInt("user_id"),
                       rs.getString("email"),
                       rs.getString("create_at"),
                       new BeanStatus(
                               rs.getInt("status_id"),
                               rs.getString("status_name")
                       ),
                       new DaoRol().findRoles(rs.getInt("user_id")),
                       new BeanPerson(
                               rs.getInt("person_id"),
                               rs.getString("person_name"),
                               rs.getString("surname"),
                               rs.getString("lastname") != null ? rs.getString("lastname") : null,
                               rs.getString("birthday"),
                               rs.getString("phone")
                       )
               ));
           }
        } catch (SQLException e){
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return listUsers;
    }

    public boolean updateUser(BeanUser u) throws SQLException {
        boolean state = false;
        try {
            con = ConnectionMysql.getConnection();
            String query = "UPDATE person SET name = ?, surname = ?, lastname = ?, phone = ?, birthday = ? WHERE id = ?";
            pstm = con.prepareStatement(query);
            pstm.setString(1, u.getPerson().getName());
            pstm.setString(2, u.getPerson().getSurname());
            pstm.setString(3, u.getPerson().getLastname());
            pstm.setString(4, u.getPerson().getPhone());
            pstm.setString(5, u.getPerson().getBirthday());
            pstm.setInt(6, u.getPerson().getId());
            if(pstm.executeUpdate() == 1){
                query = "UPDATE user SET email = ?, status_id = ? WHERE id = ?";
                pstm = con.prepareStatement(query);
                pstm.setString(1, u.getEmail());
                pstm.setInt(2, u.getStatus().getId());
                pstm.setInt(3, u.getId());
                state = pstm.executeUpdate() == 1;
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return state;
    }

    private void closeConnection() throws SQLException {
        if(rs != null){
            rs.close();
        }
        if(pstm != null){
            pstm.close();
        }
        if(con != null){
            con.close();
        }
    }
}
