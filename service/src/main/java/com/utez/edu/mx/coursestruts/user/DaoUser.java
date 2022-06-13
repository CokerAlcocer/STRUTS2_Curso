package com.utez.edu.mx.coursestruts.user;

import com.utez.edu.mx.coursestruts.person.BeanPerson;
import com.utez.edu.mx.coursestruts.status.BeanStatus;
import com.utez.edu.mx.coursestruts.utils.ConnectionMysql;

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
           String query = "SELECT user.id, user.email, user.create_at, status.id as id_status, status.name as name_status FROM user INNER JOIN status on user.status_id = status.id";
           pstm = con.prepareStatement(query);
           rs = pstm.executeQuery();
           while(rs.next()){
               listUsers.add(new BeanUser(
                       rs.getInt("id"),
                       rs.getString("email"),
                       rs.getString("create_at"),
                       new BeanStatus(
                               rs.getInt("id_status"),
                               rs.getString("name_status")
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
