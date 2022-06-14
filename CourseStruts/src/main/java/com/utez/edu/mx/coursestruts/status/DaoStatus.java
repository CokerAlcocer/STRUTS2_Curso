package com.utez.edu.mx.coursestruts.status;

import com.utez.edu.mx.coursestruts.utils.ConnectionMysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoStatus {

    Connection con;
    ResultSet rs;
    PreparedStatement pstm;

    public List<BeanStatus> findAll() throws SQLException {
        List<BeanStatus> status = new ArrayList<>();
        try {
            con = ConnectionMysql.getConnection();
            String query = "SELECT status.id, status.name FROM status";
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while(rs.next()){
                status.add(
                    new BeanStatus(
                        rs.getInt("id"),
                        rs.getString("name")
                    )
                );
            }
        } catch(SQLException e)  {
            e.printStackTrace();
        } finally {
            closeConnection();
        }

        return status;
    }

    public static void main(String[] args) throws SQLException{
        DaoStatus dao = new DaoStatus();
        for(BeanStatus status : dao.findAll()){
            System.out.println("Nombre del estado: "+status.getName());
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
