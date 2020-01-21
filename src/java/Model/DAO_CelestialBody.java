/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.CelestialBody;
import Entity.CelestialBodyType;
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
public class DAO_CelestialBody {
    Connection cn;
    public CelestialBody cb;
    Statement st; 

    public DAO_CelestialBody() {
    }

    public DAO_CelestialBody(CelestialBody cb) {
        this.cb = cb;
    }
    
    public boolean insertCelestialBody(){
        Conexion a = new Conexion();
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("INSERT into celestial_body (st_id,cbt_id,cb_descripcion,cb_masa,cb_tamanio,sta_id) value"
                    + "('"+cb.getStar().getId()+"','"+cb.getCelestialBodyType().getId()+"','"+cb.getDescription()+"','"+cb.getMass()+"','"+cb.getSize()+"',2)");
            insert=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar cuerpo celestial(DAO_CelestialBody) " + e);
        }
        finally{
            return(insert);
        }
    }  
    
    public ArrayList<CelestialBody> getCelestialBodys(){
        cn=Conexion.GetConexion();
        ArrayList<CelestialBody> array=new ArrayList<CelestialBody>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM celestial_body as cb,star as st,celestial_body_type as cbt where cb.st_id=st.st_id and cb.cbt_id=cbt.cbt_id and cb.sta_id=2");
            while(rs.next()){
                CelestialBody cb = new CelestialBody();
                cb.setStar(new Star());
                
                cb.setCelestialBodyType(new CelestialBodyType());
                cb.setId(rs.getString("cb_id"));
                cb.setDescription(rs.getString("cb_descripcion"));
                cb.getStar().setId(rs.getString("st_id"));
                cb.getStar().setDescription(rs.getString("st_description"));
                cb.getCelestialBodyType().setId(rs.getString("cbt_id"));
                cb.getCelestialBodyType().setDescription(rs.getString("cbt_description"));                
                cb.setMass(rs.getDouble("cb_masa"));
                cb.setSize(rs.getShort("cb_tamanio"));
                array.add(cb);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista cuerpos celestiales en celestialBodyDAO " + e);
        }
        finally{
            return array;
        }
    } 

    public String getQuery(int action){
        String query = ""; 
        if(action==1){
            query = "UPDATE celestial_body SET st_id='"+cb.getStar().getId()+"',cbt_id='"+cb.getCelestialBodyType().getId()+"',cb_descripcion='"+cb.getDescription()+"',cb_masa='"+cb.getMass()+"',cb_tamanio='"+cb.getSize()+"' ";       
        }else if(action==2) {
            query = "UPDATE celestial_body SET sta_id=1 ";
        }
        return query;
    }
    
    
    
    

    public boolean updateCB(int action){    
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean update=false;    
        try{
            st=miConexion.createStatement();
            st.executeUpdate(getQuery(action) + "WHERE cb_id='"+cb.getId()+"'");       
            update=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo actualizar el cuerpo celestial " + e);
        }
        finally{
            return(update);
        }
    }
    
        public ArrayList<CelestialBody> getCelestialBodysReport(String idStar){
        cn=Conexion.GetConexion();
        ArrayList<CelestialBody> array=new ArrayList<CelestialBody>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM celestial_body as cb,star as st,celestial_body_type as cbt where cb.st_id=st.st_id and cb.cbt_id=cbt.cbt_id and cb.sta_id=2 and st.st_id='"+idStar+"'");
            while(rs.next()){
                CelestialBody cb = new CelestialBody();
                cb.setStar(new Star());
                cb.setCelestialBodyType(new CelestialBodyType());
                cb.setId(rs.getString("cb_id"));
                cb.setDescription(rs.getString("cb_descripcion"));
                cb.getStar().setId(rs.getString("st_id"));
                cb.getStar().setDescription(rs.getString("st_description"));
                cb.getCelestialBodyType().setId(rs.getString("cbt_id"));
                cb.getCelestialBodyType().setDescription(rs.getString("cbt_description"));                
                cb.setMass(rs.getDouble("cb_masa"));
                cb.setSize(rs.getShort("cb_tamanio"));
                array.add(cb);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista cuerpos celestiales en celestialBodyDAO " + e);
        }
        finally{
            return array;
        }
    }

    


    
//
//    public int getLast(){
//        int id = 0;
//        Connection miConexion;
//        miConexion=Conexion.GetConexion();
//        try{
//            st=miConexion.createStatement();
//            ResultSet miRs=st.executeQuery("SELECT sa_id FROM satelite WHERE sa_id = ( SELECT MAX( sa_id) FROM satelite)");
//            miRs.first(); 
//            id = (miRs.getInt("sa_id"));
//        }catch(SQLException e){
//            System.out.println("no se puede verificar el ultimo id del satelite " + e);        
//        }finally{
//            return id;
//        }
//    }    
}
