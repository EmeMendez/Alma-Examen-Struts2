/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.Planet;
import Entity.PlanetType;
import Entity.Star;
import Model.DAO_Planet;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;


/**
 *
 * @author Melón
 */
public class C_Planet extends ActionSupport {
    String id;
    String star;
    String planetType;
    String description;
    String simbology;
    String DEcuatorial;
    String  mass;
    String ROrbital;
    String POrbital;
    String rotation;
    String CAtmosphere;
    String image;
    ArrayList<Planet> arrayPlanet = new ArrayList<Planet>();
    String mensaje;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStar() {
        return star;
    }

    public void setStar(String star) {
        this.star = star;
    }

    public String getPlanetType() {
        return planetType;
    }

    public void setPlanetType(String planetType) {
        this.planetType = planetType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSimbology() {
        return simbology;
    }

    public void setSimbology(String simbology) {
        this.simbology = simbology;
    }

    public String getDEcuatorial() {
        return DEcuatorial;
    }

    public void setDEcuatorial(String DEcuatorial) {
        this.DEcuatorial = DEcuatorial;
    }

    public String getMass() {
        return mass;
    }

    public void setMass(String mass) {
        this.mass = mass;
    }

    public String getROrbital() {
        return ROrbital;
    }

    public void setROrbital(String ROrbital) {
        this.ROrbital = ROrbital;
    }

    public String getPOrbital() {
        return POrbital;
    }

    public void setPOrbital(String POrbital) {
        this.POrbital = POrbital;
    }

    public String getRotation() {
        return rotation;
    }

    public void setRotation(String rotation) {
        this.rotation = rotation;
    }

    public String getCAtmosphere() {
        return CAtmosphere;
    }

    public void setCAtmosphere(String CAtmosphere) {
        this.CAtmosphere = CAtmosphere;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public ArrayList<Planet> getArrayPlanet() {
        return arrayPlanet;
    }

    public void setArrayPlanet(ArrayList<Planet> arrayPlanet) {
        this.arrayPlanet = arrayPlanet;
    }
        
    
   
    @Override
    public String execute() throws Exception {
        Planet p = new Planet();
        p.setStar(new Star());
        p.setPlanetType(new PlanetType());
        p.setDescription(this.description);
        p.setSimbology(this.simbology);
        p.setCAtmosphere(this.CAtmosphere);
        p.setImage(this.image);
        p.setMass(Double.parseDouble(this.mass));
        p.setRotation(Double.parseDouble(this.rotation));
        p.setdDEcuatorial(Double.parseDouble(this.DEcuatorial));
        p.getStar().setId(this.star);
        p.getPlanetType().setId(this.planetType);
        p.setROrbital(Double.parseDouble(this.ROrbital));
        p.setPOrbital(Double.parseDouble(this.POrbital));
        DAO_Planet dao = new DAO_Planet(p);
        
        if(dao.insertPlanet()){
            arrayPlanet=dao.getPlanets();
            mensaje = "swal({\n" +
            "  position: 'top-right',\n" +
            "  type: 'success',\n" +
            "  title: 'Planeta Ingresado',\n" +
            "  showConfirmButton: false,\n" +
            "  timer: 1500\n" +
            "});";         
//         addActionMessage("Planeta ingresado corractamente");
//         mensaje = "$('#exampleModal').modal('show');";            
            return SUCCESS;
        }
        else{
         arrayPlanet=dao.getPlanets();
           return NONE;
        }
        
    } 
    
    public String update() throws Exception {

        Planet p = new Planet();
        p.setId(this.id);
        p.setStar(new Star());
        p.setPlanetType(new PlanetType());
        p.setDescription(this.description);
        p.setSimbology(this.simbology);
        p.setCAtmosphere(this.CAtmosphere);
        p.setImage(this.image);
        p.setMass(Double.parseDouble(this.mass));
        p.setRotation(Double.parseDouble(this.rotation));
        p.setdDEcuatorial(Double.parseDouble(this.DEcuatorial));
        p.getStar().setId(this.star);
        p.getPlanetType().setId(this.planetType);
        p.setROrbital(Double.parseDouble(this.ROrbital));
        p.setPOrbital(Double.parseDouble(this.POrbital));
        DAO_Planet dao = new DAO_Planet(p);   
        
        if(dao.updatePlanet(1)){
//         addActionMessage("Planeta actualizado corractamente");
            arrayPlanet=dao.getPlanets();
            mensaje = "swal({\n" +
            "  position: 'top-right',\n" +
            "  type: 'success',\n" +
            "  title: 'Planeta Modificado Correctamente',\n" +
            "  showConfirmButton: false,\n" +
            "  timer: 1500\n" +
            "});";            
            return SUCCESS;
        }
        else{
         arrayPlanet=dao.getPlanets();
           return NONE;
        }
        
    }    
    
    public String delete() throws Exception {
        Planet p = new Planet();
        p.setId(this.id);
        DAO_Planet dao = new DAO_Planet(p);          
        if(dao.updatePlanet(2)){
//         addActionMessage("Planeta actualizado corractamente");
            arrayPlanet=dao.getPlanets();
            mensaje = "swal({\n" +
            "  position: 'top-right',\n" +
            "  type: 'success',\n" +
            "  title: 'Planeta Eliminado',\n" +
            "  showConfirmButton: false,\n" +
            "  timer: 1500\n" +
            "});";             
            return SUCCESS;
        }
        else{
         arrayPlanet=dao.getPlanets();
           return NONE;
        }
        
    } 
    

    
    
    
    
    
}
