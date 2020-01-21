/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Planet;
import Entity.Satelite;
import Entity.State;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class DAO_Satelite {
    Connection cn;
    public Satelite sat;
    Statement st; 

    public DAO_Satelite() {
    }

    public DAO_Satelite(Satelite sat) {
        this.sat = sat;
    }
    
    public boolean insertSatelite(){
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("INSERT into satelite (p_id,sa_description,sa_diameter,sa_days,sa_hours,sa_minutes,sa_image,sta_id) value"
                    + "('"+sat.getPlanet().getId()+"','"+sat.getDescription()+"','"+sat.getDiameter()+"','"+sat.getDays()+"','"+sat.getHours()+"','"+sat.getMinutes()+"','"+sat.getImage()+"',2)");
            insert=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar la el satelite(DAO_Satelite) " + e);
        }
        finally{
            return(insert);
        }
    }  
    
    public ArrayList<Satelite> getSatelits(){
        cn=Conexion.GetConexion();
        ArrayList<Satelite> array=new ArrayList<Satelite>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM satelite as sa,planet as p where sa.p_id=p.p_id and sa.sta_id = 2");
            while(rs.next()){
                Planet planet = new Planet();
                State state = new State();
                Satelite sat = new Satelite();
                sat.setPlanet(planet);
                sat.setState(state);
                sat.setId(rs.getString("sa_id"));
                sat.getPlanet().setId(rs.getString("p_id"));
                sat.getPlanet().setDescription(rs.getString("p_descripcion"));
                sat.setDescription(rs.getString("sa_description"));
                sat.setDiameter(rs.getShort("sa_diameter"));
                sat.setDays(rs.getInt("sa_days"));
                sat.setHours(rs.getShort("sa_hours"));
                sat.setMinutes(rs.getInt("sa_minutes"));                
                sat.setImage(rs.getString("sa_image"));
                sat.getState().setId("sta_id");
                
                array.add(sat);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de satelites en sateliteDAO " + e);
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
            ResultSet miRs=st.executeQuery("SELECT sa_id FROM satelite WHERE sa_id = ( SELECT MAX( sa_id) FROM satelite)");
            miRs.first(); 
            id = (miRs.getInt("sa_id"));
        }catch(SQLException e){
            System.out.println("no se puede verificar el ultimo id del satelite " + e);        
        }finally{
            return id;
        }
    }
    
    public String getQuery(int action){
        String query = ""; 
        if(action==1){
            query = "UPDATE satelite SET p_id='"+sat.getPlanet().getId()+"',sa_description='"+sat.getDescription()+"',sa_diameter='"+sat.getDiameter()+"',sa_days='"+sat.getDays()+"',sa_hours='"+sat.getHours()+"',sa_minutes='"+sat.getMinutes()+"',sa_image='"+sat.getImage()+"'";
        }else if(action==2) {
            query = "UPDATE satelite SET sta_id=1 ";
        }
        return query;
    }

    public boolean updateSatelite(int action){    
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean update=false;    
        try{
            st=miConexion.createStatement();
            st.executeUpdate(getQuery(action) + "WHERE sa_id='"+sat.getId()+"'");       
            update=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo actualizar el satelite" + e);
        }
        finally{
            return(update);
        }
    } 
    
    
        public ArrayList<Satelite> getSatelitsReport(String idPlaneta){
        cn=Conexion.GetConexion();
        ArrayList<Satelite> array=new ArrayList<Satelite>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM satelite as sa,planet as p where sa.p_id=p.p_id and sa.sta_id = 2 and p.p_id='"+idPlaneta+"'");
            while(rs.next()){
                Planet planet = new Planet();
                State state = new State();
                Satelite sat = new Satelite();
                sat.setPlanet(planet);
                sat.setState(state);
                sat.setId(rs.getString("sa_id"));
                sat.getPlanet().setId(rs.getString("p_id"));
                sat.getPlanet().setDescription(rs.getString("p_descripcion"));
                sat.setDescription(rs.getString("sa_description"));
                sat.setDiameter(rs.getShort("sa_diameter"));
                sat.setDays(rs.getInt("sa_days"));
                sat.setHours(rs.getShort("sa_hours"));
                sat.setMinutes(rs.getInt("sa_minutes"));                
                sat.setImage(rs.getString("sa_image"));
                sat.getState().setId("sta_id");
                
                array.add(sat);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de satelites en sateliteDAO " + e);
        }
        finally{
            return array;
        }
    } 
}
