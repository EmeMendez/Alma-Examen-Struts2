/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.CelestialBodyType;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class DAO_CelestialBodyType {
    Connection cn;
    public CelestialBodyType cbt;
    Statement st; 

    public DAO_CelestialBodyType() {
    }

    public DAO_CelestialBodyType(CelestialBodyType cbt) {
        this.cbt = cbt;
    }
    
    public boolean insertCelestialBodyType(){
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("INSERT into celestial_body_type (cbt_description,sta_id) value"
                    + "('"+cbt.getDescription()+"',2)");
            insert=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar tipo de cuerpo celestial(DAO_CelestialBodyType) " + e);
        }
        finally{
            return(insert);
        }
    } 


    public ArrayList<CelestialBodyType> getCBT(){
        cn=Conexion.GetConexion();
        ArrayList<CelestialBodyType> array=new ArrayList<CelestialBodyType>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM celestial_body_type where sta_id = 2");
            while(rs.next()){
                CelestialBodyType cbt = new CelestialBodyType();
                cbt.setId(rs.getString("cbt_id"));
                cbt.setDescription(rs.getString("cbt_description"));
                array.add(cbt);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar los tipos de cuerpos celestiales " + e);
        }
        finally{
            return array;
        }
    }
    
    public String getQuery(int action){
        String query = ""; 
        if(action==1){
            query = "UPDATE celestial_body_type SET cbt_description='"+cbt.getDescription()+"' ";
        }else if(action==2) {
            query = "UPDATE celestial_body_type SET sta_id=1 ";
        }
        return query;
    }
    
    public boolean updateCBT(int action){    
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean ifUpdate=false;    
        try{
            Statement miSt=miConexion.createStatement();
            miSt.executeUpdate(getQuery(action) + "WHERE cbt_id='"+cbt.getId()+"'");       
            ifUpdate=true;
        }
        catch(SQLException e){
            System.out.println("no se pudo actualizar el tipo de cierpo celestial" + e);
        }
        finally{
            return(ifUpdate);
        }
    }    
    
}
