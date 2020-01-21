/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.PlanetarySystem;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class DAO_PlanetarySystem {
    Connection cn;
    public PlanetarySystem plas;
    Statement st;

    public DAO_PlanetarySystem() {
    }
    
    public DAO_PlanetarySystem(PlanetarySystem plas) {
        this.plas = plas;
    }
    
    public boolean insertPS(){
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("insert into planetary_system (ps_description,sta_id) value"
                    + "('"+plas.getName()+"','2')");
            insert=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar el sistema planetario(planetarySystem dao) " + e);
        }
        finally{
            return insert;
        }
    } 
        public PlanetarySystem objetcPS(String id){
        cn=Conexion.GetConexion();
        PlanetarySystem ps=new PlanetarySystem();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM planetary_system where ps_id='"+id+"'");
            while(rs.next()){
                ps.setName(rs.getString("ps_description"));
                return ps;             
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de sistemas planetarios en PlanetarySistem(dao)" + e);
        }
        return ps;
    } 

    public ArrayList<PlanetarySystem> getPS(){
        cn=Conexion.GetConexion();
        ArrayList<PlanetarySystem> array=new ArrayList<PlanetarySystem>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM planetary_system where sta_id = 2");
            while(rs.next()){
                PlanetarySystem ps= new PlanetarySystem();
                ps.setId(rs.getString("ps_id"));
                ps.setName(rs.getString("ps_description"));
                array.add(ps);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de sistemas planetarios en PlanetarySistem(dao)" + e);
        }
        finally{
            return array;
        }
    } 
    
    public int getLast(){
        int id = 0;
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        try{
            st=miConexion.createStatement();
            ResultSet miRs=st.executeQuery("SELECT ps_id FROM planetary_system WHERE ps_id = ( SELECT MAX( ps_id) FROM planetary_system)");
            miRs.first(); 
            id = (miRs.getInt("ps_id"));
        }catch(SQLException e){
            System.out.println("no se puede verificar el ultimo id " + e);        
        }finally{
            return id;
        }
    }
    
    public String getQuery(int action){
        String query = ""; 
        if(action==1){
            query = "UPDATE planetary_system SET ps_description='"+plas.getName()+"' ";
        }else if(action==2) {
            query = "UPDATE planetary_system SET sta_id=1 ";
        }
        return query;
    }
    
    
    public boolean updatePS(int action){    
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean update=false;    
        try{
            Statement miSt=miConexion.createStatement();
            miSt.executeUpdate(getQuery(action) + "WHERE ps_id='"+plas.getId()+"'");       
            update=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo actualizar el SP" + e);
        }
        finally{
            return(update);
        }
    }
    
}
