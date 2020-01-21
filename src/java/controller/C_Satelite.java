/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.Planet;
import Entity.Satelite;
import Model.DAO_Satelite;
import static com.opensymphony.xwork2.Action.NONE;
import static com.opensymphony.xwork2.Action.SUCCESS;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class C_Satelite extends ActionSupport {
    String id,description,planet,diameter,days,hours,minutes,image,mensaje;
    ArrayList<Satelite> arraySatelite = new ArrayList<Satelite>();
    String message;

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPlanet() {
        return planet;
    }

    public void setPlanet(String planet) {
        this.planet = planet;
    }

    public String getDiameter() {
        return diameter;
    }

    public void setDiameter(String diameter) {
        this.diameter = diameter;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getHours() {
        return hours;
    }

    public void setHours(String hours) {
        this.hours = hours;
    }

    public String getMinutes() {
        return minutes;
    }

    public void setMinutes(String minutes) {
        this.minutes = minutes;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public ArrayList<Satelite> getArraySatelite() {
        return arraySatelite;
    }

    public void setArray(ArrayList<Satelite> array) {
        this.arraySatelite = array;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
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
    public String execute() throws Exception {
        Satelite s = new Satelite();
        s.setDescription(this.description);
        s.setPlanet(new Planet(this.planet));        
        s.setDiameter(Double.parseDouble(this.diameter));
        s.setDays(Integer.parseInt(this.days));
        s.setHours(Integer.parseInt(this.hours));
        s.setMinutes(Integer.parseInt(this.minutes));
        s.setImage(this.image);
        DAO_Satelite dao_sat=new DAO_Satelite(s);
        
        if(dao_sat.insertSatelite()){
            arraySatelite=dao_sat.getSatelits();
message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Satelite ingresado correctamente!!',\n" +
"  showConfirmButton: false,\n" +
"  timer: 1500\n" +
"});";             
            return SUCCESS;
        }
        else{
         arraySatelite=dao_sat.getSatelits();            
           return NONE;
        }
        
    } 
    
    
    public String update(){
    Satelite sat = new Satelite();
    sat.setPlanet(new Planet());
    sat.setId(this.id);
    sat.getPlanet().setId(this.planet);
    sat.setDescription(this.description);
    sat.setDiameter(Double.parseDouble(this.diameter));
    sat.setDays(Integer.parseInt(this.days));
    sat.setHours(Integer.parseInt(this.hours));
    sat.setMinutes(Integer.parseInt(this.minutes));
    sat.setImage(this.image);

    DAO_Satelite dao = new DAO_Satelite(sat); 
        if(dao.updateSatelite(1)){
        arraySatelite=dao.getSatelits();
message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Satelite Modificado correctamente!!',\n" +
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
    Satelite sat = new Satelite();        
    sat.setId(this.id);
    DAO_Satelite dao = new DAO_Satelite(sat); 
        if(dao.updateSatelite(2)){
        arraySatelite=dao.getSatelits();
message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Eliminado correctamente!!',\n" +
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
