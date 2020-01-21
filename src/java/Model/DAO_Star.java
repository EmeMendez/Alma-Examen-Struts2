/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.PlanetarySystem;
import Entity.Star;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class DAO_Star {
    Connection cn;
    public Star star;
    Statement st; 

    public DAO_Star() {
    }

    public DAO_Star(Star star) {
        this.star = star;
    }
    
    public boolean insertStar(){
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("INSERT into star (ps_id,st_description,sta_id) value"
                    + "('"+star.getPlanetarySystem().getId()+"','"+star.getDescription()+"',2)");
            insert=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar la estrella(DAO_Star) " + e);
        }
        finally{
            return(insert);
        }
    }
    
    
    public ArrayList<Star> getStars(){
        cn=Conexion.GetConexion();
        ArrayList<Star> array=new ArrayList<Star>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM star as st,planetary_system as ps where ps.ps_id=st.ps_id and st.sta_id=2");
            while(rs.next()){
                Star star= new Star();
                star.setPlanetarySystem(new PlanetarySystem());
                star.setId(rs.getString("st_id"));
                star.getPlanetarySystem().setId(rs.getString("ps_id"));
                star.getPlanetarySystem().setName(rs.getString("ps_description"));                
                star.setDescription(rs.getString("st_description"));
                array.add(star);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de estrellas en starDAO " + e);
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
            ResultSet miRs=st.executeQuery("SELECT st_id FROM star WHERE st_id = ( SELECT MAX( st_id) FROM star)");
            miRs.first(); 
            id = (miRs.getInt("st_id"));
        }catch(SQLException e){
            System.out.println("no se puede verificar el ultimo id de la estrella " + e);        
        }finally{
            return id;
        }
    }
    
        
    public String getQuery(int action){
        String query = ""; 
        if(action==1){
            query = "UPDATE star SET st_description='"+star.getDescription()+"',ps_id='"+star.getPlanetarySystem().getId()+"' ";
        }else if(action==2) {
            query = "UPDATE star SET sta_id=1 ";
        }
        return query;
    }
    

    public boolean updateStar(int action){    
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean update=false;    
        try{
            st=miConexion.createStatement();
            st.executeUpdate(getQuery(action) + "WHERE st_id='"+star.getId()+"'");       
            update=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo actualizar la estrellita donde estas :D ?" + e);
        }
        finally{
            return(update);
        }
    }    

    public ArrayList<Star> getStarsReporte(String idPS){
        cn=Conexion.GetConexion();
        ArrayList<Star> array=new ArrayList<Star>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM star as st,planetary_system as ps where ps.ps_id=st.ps_id and st.sta_id=2 AND st.ps_id='"+idPS+"'");
            while(rs.next()){
                Star star= new Star();
                star.setPlanetarySystem(new PlanetarySystem());
                star.setId(rs.getString("st_id"));
                star.getPlanetarySystem().setId(rs.getString("ps_id"));
                star.getPlanetarySystem().setName(rs.getString("ps_description"));                
                star.setDescription(rs.getString("st_description"));
                array.add(star);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de estrellas en starDAO " + e);
        }
        finally{
            return array;
        }
    }

    
    
}