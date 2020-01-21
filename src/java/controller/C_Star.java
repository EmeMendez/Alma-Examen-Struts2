/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.PlanetarySystem;
import Entity.Star;
import Model.DAO_Star;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class C_Star extends ActionSupport {
    String id;
    String description;
    String planetarySystem;
    String message;
    ArrayList<Star> arrayStar = new ArrayList<Star>();

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<Star> getArrayStar() {
        return arrayStar;
    }

    public void setArrayStar(ArrayList<Star> array) {
        this.arrayStar = array;
    }

    public String getPlanetarySystem() {
        return planetarySystem;
    }

    public void setPlanetarySystem(String planetarySystem) {
        this.planetarySystem = planetarySystem;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    
    

    @Override
    public String execute(){
    Star star = new Star();
    star.setPlanetarySystem(new PlanetarySystem());
    star.setDescription(this.description);
    star.getPlanetarySystem().setId(this.planetarySystem);
    DAO_Star dao = new DAO_Star(star); 
        if(dao.insertStar()){
message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Estrella Ingresada correctamente!!',\n" +
"  showConfirmButton: false,\n" +
"  timer: 1500\n" +
"});";            
        arrayStar=dao.getStars();
            return SUCCESS;
        }
        else{
            return NONE;
        }
    }   
    
    
    public String update(){
    Star star = new Star();
    star.setPlanetarySystem(new PlanetarySystem());
    star.setId(this.id);
    star.setDescription(this.description);
    star.getPlanetarySystem().setId(this.planetarySystem);
    DAO_Star dao = new DAO_Star(star); 
        if(dao.updateStar(1)){
        arrayStar=dao.getStars();
message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Estrella Modificada correctamente!!',\n" +
"  showConfirmButton: false,\n" +
"  timer: 1500\n" +
"});";         
            return SUCCESS;
        }
        else{
            return NONE;
        }
    }
    
    public String delete(){
    Star star = new Star();
    star.setPlanetarySystem(new PlanetarySystem());
    star.setId(this.id);
    star.getPlanetarySystem().setId(this.planetarySystem);
    DAO_Star dao = new DAO_Star(star); 
        if(dao.updateStar(2)){
        arrayStar=dao.getStars();
message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Estrella Eliminada correctamente!!',\n" +
"  showConfirmButton: false,\n" +
"  timer: 1500\n" +
"});";         
            return SUCCESS;
        }
        else{
            return NONE;
        }
    }
    
    
    
}
