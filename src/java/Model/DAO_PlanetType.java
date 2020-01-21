/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.PlanetType;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class DAO_PlanetType {
    Connection cn;
    public PlanetType pt;
    Statement st;

    public DAO_PlanetType() {
    }

    public DAO_PlanetType(PlanetType pt) {
        this.pt = pt;
    }
    
        public boolean insertPT(){
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("INSERT into planet_type (pt_description,sta_id) value"
                    + "('"+pt.getDescription()+"',2)");
            insert=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar el tipo de planeta en (DAO_PlanetType) " + e);
        }
        finally{
            return(insert);
        }
    }  
    

    public ArrayList<PlanetType> getPlanetTypes(){
        cn=Conexion.GetConexion();
        ArrayList<PlanetType> array=new ArrayList<PlanetType>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM planet_type");
            while(rs.next()){
                PlanetType pt = new PlanetType();
                pt.setId(rs.getString("pt_id"));
                pt.setDescription(rs.getString("pt_description"));
                array.add(pt);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de tipos de planets planetTypeDAO " + e);
        }
        finally{
            return array;
        }
    }     
}    

