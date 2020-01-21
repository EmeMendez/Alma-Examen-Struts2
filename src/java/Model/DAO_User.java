/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Employee;
import Entity.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Melón
 */
public class DAO_User {
    Connection cn;
    public static User user;
    Statement st;
    
    
    public DAO_User(){
    }

    public DAO_User(User user) {
        this.user= user;
    }

    public boolean Exist(){
        cn=Conexion.GetConexion();
        boolean exist=false;
        try{
            st=cn.createStatement();
            ResultSet miRs=st.executeQuery("select * from user where us_id='"+user.getUser()+"' and us_pass='"+user.getPass()+"'");
            if(miRs.next())
                exist=true;
        }  
        catch(SQLException e){
            System.out.println("No pude verificar los datos del usuario "+e);
        }
        finally{
            return exist;
        } 
    }  
    
    public User getUser(){
        cn=Conexion.GetConexion();
        try{
            st=cn.createStatement();
            ResultSet rs= st.executeQuery("select * from user,employee where user.us_id='"+user.getUser()+"' and user.us_pass='"+user.getPass()+"' and user.em_id=employee.em_id");
            rs.first();
            Employee employee = new Employee();
            user.setEmployee(employee);
            user.setUser(rs.getString("us_id"));
            user.setPass(rs.getString("us_pass"));
            user.getEmployee().setId(rs.getString("em_id"));
            user.getEmployee().setName(rs.getString("em_name")); 
            user.getEmployee().setLastname(rs.getString("em_lastname"));             

        }catch(SQLException e){
            System.out.println("No puede verificar los datos del usuario(en getUser)"+ e);
            return(null);            
        }
        finally{
            return user;
        }
    }    
    
}    

