/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Entity.Planet;
import Entity.PlanetType;
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
public class DAO_Planet {
    Connection cn;
    public Planet p;
    Statement st;

    public DAO_Planet() {
    }
    
    public DAO_Planet(Planet p) {
        this.p = p;
    }
    
    public boolean insertPlanet(){
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean insert=false;
        try{
            Statement miSt=miConexion.createStatement();
            miSt.execute("INSERT into planet(st_id,pt_id,p_descripcion,p_simbologia,p_decuatorial,p_masa,p_rorbital,p_porbital,p_rotacion,p_catmosfera,p_imagen,sta_id) value"
                    + "('"+p.getStar().getId()+"','"+p.getPlanetType().getId()+"','"+p.getDescription()+"','"+p.getSimbology()+"','"+p.getDEcuatorial()+"','"+p.getMass()+"','"+p.getROrbital()+"','"+p.getPOrbital()+"','"+p.getRotation()+"','"+p.getCAtmosphere()+"','"+p.getImage()+"',2)");
            insert=true;
            System.out.println("se insertpo el planeta ");
            
        }
        catch(SQLException e){
            System.out.println("no se pudo insertar el planeta(planet dao) " + e);
            System.out.println("No el planeta ");
        
        }
        finally{
            return(insert);
        }
    }
    
    public ArrayList<Planet> getPlanets(){
        cn=Conexion.GetConexion();
        ArrayList<Planet> array=new ArrayList<Planet>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM planet as p,star as st,planet_type as pt where p.st_id=st.st_id and p.pt_id=pt.pt_id and p.sta_id=2");
            while(rs.next()){
                Planet p = new Planet();
                p.setStar(new Star());
                p.setPlanetType(new PlanetType());
                p.setId(rs.getString("p_id"));
                p.getStar().setId(rs.getString("st_id"));
                p.getStar().setDescription(rs.getString("st_description"));
                p.getPlanetType().setDescription(rs.getString("pt_description"));
                p.getPlanetType().setId(rs.getString("pt_id"));
                p.setDescription(rs.getString("p_descripcion"));
                p.setSimbology(rs.getString("p_simbologia"));
                p.setdDEcuatorial(rs.getDouble("p_decuatorial"));
                p.setMass(rs.getDouble("p_masa"));
                p.setROrbital(rs.getDouble("p_rorbital"));
                p.setPOrbital(rs.getDouble("p_porbital"));
                p.setRotation(rs.getDouble("p_rotacion"));
                p.setCAtmosphere(rs.getString("p_catmosfera"));
                p.setImage(rs.getString("p_imagen"));

                array.add(p);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de planetas en planetDAO " + e);
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
            ResultSet miRs=st.executeQuery("SELECT p_id FROM planet WHERE p_id = ( SELECT MAX( p_id) FROM planet)");
            miRs.first(); 
            id = (miRs.getInt("p_id"));
        }catch(SQLException e){
            System.out.println("no se puede verificar el ultimo id de la estrella " + e);        
        }finally{
            return id;
        }
    }
    
   public String getQuery(int action){
        String query = ""; 
        if(action==1){
           query = "UPDATE planet SET st_id='"+p.getStar().getId()+"',pt_id='"+p.getPlanetType().getId()+"',p_descripcion='"+p.getDescription()+"',p_simbologia='"+p.getSimbology()+"',p_decuatorial='"+p.getDEcuatorial()+"',p_masa='"+p.getMass()+"',p_rorbital='"+p.getROrbital()+"',p_porbital='"+p.getPOrbital()+"',p_rotacion='"+p.getRotation()+"',p_catmosfera='"+p.getCAtmosphere()+"',p_imagen='"+p.getImage()+"' ";
        }else if(action==2) {
            query = "UPDATE planet SET sta_id=1 ";
        }
        return query;
    }
    
    
    public boolean updatePlanet(int action){    
        Connection miConexion;
        miConexion=Conexion.GetConexion();
        boolean update=false;    
        try{
            st=miConexion.createStatement();
            st.executeUpdate(getQuery(action) + "WHERE p_id='"+p.getId()+"' ");       
            update=true;     
        }
        catch(SQLException e){
            System.out.println("no se pudo actualizar el planeta" + e);
        }
        finally{
            return(update);
        }
    }
    
        public ArrayList<Planet> getPlanetsReport(String idStar){
        cn=Conexion.GetConexion();
        ArrayList<Planet> array=new ArrayList<Planet>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM planet as p,star as st,planet_type as pt where p.st_id=st.st_id and p.pt_id=pt.pt_id and p.sta_id=2 and st.st_id='"+idStar+"'");
            while(rs.next()){
                Planet p = new Planet();
                p.setStar(new Star());
                p.setPlanetType(new PlanetType());
                p.setId(rs.getString("p_id"));
                p.getStar().setId(rs.getString("st_id"));
                p.getStar().setDescription(rs.getString("st_description"));
                p.getPlanetType().setDescription(rs.getString("pt_description"));
                p.getPlanetType().setId(rs.getString("pt_id"));
                p.setDescription(rs.getString("p_descripcion"));
                p.setSimbology(rs.getString("p_simbologia"));
                p.setdDEcuatorial(rs.getDouble("p_decuatorial"));
                p.setMass(rs.getDouble("p_masa"));
                p.setROrbital(rs.getDouble("p_rorbital"));
                p.setPOrbital(rs.getDouble("p_porbital"));
                p.setRotation(rs.getDouble("p_rotacion"));
                p.setCAtmosphere(rs.getString("p_catmosfera"));
                p.setImage(rs.getString("p_imagen"));

                array.add(p);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de planetas en planetDAO " + e);
        }
        finally{
            return array;
        }
    } 
        
    public Planet getPlanet(String idStar){
        cn=Conexion.GetConexion();
        ArrayList<Planet> array=new ArrayList<Planet>();
        try{
            st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM planet as p,star as st,planet_type as pt where p.st_id=st.st_id and p.pt_id=pt.pt_id and p.sta_id=2 and st.st_id='"+idStar+"'");
            if(rs.next()){
                Planet p = new Planet();
                p.setStar(new Star());
                p.setPlanetType(new PlanetType());
                p.setId(rs.getString("p_id"));
                p.getStar().setId(rs.getString("st_id"));
                p.getStar().setDescription(rs.getString("st_description"));
                p.getPlanetType().setDescription(rs.getString("pt_description"));
                p.getPlanetType().setId(rs.getString("pt_id"));
                p.setDescription(rs.getString("p_descripcion"));
                p.setSimbology(rs.getString("p_simbologia"));
                p.setdDEcuatorial(rs.getDouble("p_decuatorial"));
                p.setMass(rs.getDouble("p_masa"));
                p.setROrbital(rs.getDouble("p_rorbital"));
                p.setPOrbital(rs.getDouble("p_porbital"));
                p.setRotation(rs.getDouble("p_rotacion"));
                p.setCAtmosphere(rs.getString("p_catmosfera"));
                p.setImage(rs.getString("p_imagen"));

                array.add(p);               
            }
        }
        catch(SQLException e){
            System.out.println("no se puede recuperar la lista de planetas en planetDAO " + e);
        }
        finally{
            return p;
        }
    }
    
    
}
