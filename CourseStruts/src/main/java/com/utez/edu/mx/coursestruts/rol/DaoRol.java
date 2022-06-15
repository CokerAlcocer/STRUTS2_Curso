package com.utez.edu.mx.coursestruts.rol;

import com.utez.edu.mx.coursestruts.status.BeanStatus;
import com.utez.edu.mx.coursestruts.utils.ConnectionMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoRol {
    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public boolean createRol(BeanRol r) throws SQLException{
        boolean status = false;
        try {
            con = ConnectionMysql.getConnection();
            String query = "INSERT INTO rol(name, status_id) VALUES (?, ?)";
            pstm = con.prepareStatement(query);
            pstm.setString(1, r.getName());
            pstm.setInt(2, r.getStatus().getId());
            status = pstm.executeUpdate() == 1;
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return status;
    }

    public List<BeanRol> findAll() throws SQLException{
        List<BeanRol> roles = new ArrayList<>();
        try {
            con = ConnectionMysql.getConnection();
            String query = "SELECT rol.id, rol.name, status.id as id_status, status.name as name_status " +
                    "FROM rol INNER JOIN status ON status.id = rol.status_id";
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while(rs.next()){
                roles.add(
                    new BeanRol(
                        rs.getInt("id"),
                        rs.getString("name"),
                        new BeanStatus(
                            rs.getInt("id_status"),
                            rs.getString("name_status")
                        )
                    )
                );
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return roles;
    }

    public List<BeanRol> findRoles (int id) throws SQLException {
        List<BeanRol> roles = new ArrayList<>();
        try {
            con = ConnectionMysql.getConnection();
            String query = "SELECT r.id, r.name, r.status_id FROM rol_has_user u INNER JOIN rol r ON u.rol_id = r.id WHERE u.user_id = ?";
            pstm = con.prepareStatement(query);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while(rs.next()){
                roles.add(new BeanRol(
                        rs.getInt("id"),
                        rs.getString("name"),
                        new BeanStatus(
                                rs.getInt("status_id"),
                                null
                        )
                ));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return roles;
    }

    public boolean updateRol(BeanRol r) throws SQLException{
        boolean status = false;
        try {
            con = ConnectionMysql.getConnection();
            String query = "UPDATE rol SET name = ?, status_id = ? WHERE id = ?";
            pstm = con.prepareStatement(query);
            pstm.setString(1, r.getName());
            pstm.setInt(2, r.getStatus().getId());
            pstm.setInt(3, r.getId());
            status = pstm.executeUpdate() == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return status;
    }

    public static void main(String[] args) throws SQLException{
        DaoRol dr = new DaoRol();

        BeanRol b = new BeanRol(3, "SuperAdmin", new BeanStatus(2, "Inactivo"));

        if(dr.updateRol(b)){
            System.out.println("Exito");
        }else{
            System.out.println("FAIL");
        }
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
