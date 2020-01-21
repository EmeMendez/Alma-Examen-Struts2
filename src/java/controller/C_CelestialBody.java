/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CelestialBody;
import Entity.CelestialBodyType;
import Entity.Star;
import Model.DAO_CelestialBody;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class C_CelestialBody extends ActionSupport {
    String id;
    String star;
    String type;
    String description;
    String mass;
    String size;
    String message;
    ArrayList<CelestialBody> arrayCB = new ArrayList<CelestialBody>();

    //getters
    public String getId() {return id;}
    public String getStar() {return star;}
    public String getType() {return type;}
    public String getDescription() {return description;}
    public String getMass() {return mass;}
    public String getSize() {return size;}    
    public ArrayList<CelestialBody> getArrayCB() {return arrayCB;}  
    
    //setters
    
    public void setId(String id) {
        this.id = id;
    }
    public void setType(String type) {
        this.type = type;
    }
    public void setStar(String star) {
        this.star = star;
    }
    @RequiredStringValidator(message="Debe proporcionar una descripción")    
    public void setDescription(String description) {
        this.description = description;
    }
    @RequiredStringValidator(message="Este campo es obligatorio")        
    public void setMass(String mass) {
        this.mass = mass;
    }
    @RequiredStringValidator(message="Este campo es obligatorio")        
    public void setSize(String size) {
        this.size = size;
    }
    
    public void setArrayCB(ArrayList<CelestialBody> arrayCB) {
        this.arrayCB = arrayCB;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    


    @Override
    public String execute(){
    CelestialBody cb = new CelestialBody();
    cb.setDescription(this.description);
    cb.setMass(Double.parseDouble(this.mass));
    cb.setSize(Double.parseDouble(this.size));
    cb.setStar(new Star(this.star));
    cb.setCelestialBodyType(new CelestialBodyType(this.type));
    DAO_CelestialBody dao_cb = new DAO_CelestialBody(cb);
    
        if(dao_cb.insertCelestialBody()){
            arrayCB=dao_cb.getCelestialBodys();
            message = "swal({\n" +
"  position: 'top-right',\n" +
"  type: 'success',\n" +
"  title: 'Cuerpo celestial Ingresado Correctamente',\n" +
"  showConfirmButton: false,\n" +
"  timer: 1500\n" +
"});";             
        arrayCB=dao_cb.getCelestialBodys(); 
            return SUCCESS;
        }
        else{
        arrayCB=dao_cb.getCelestialBodys();             
            return NONE;
        }
    }
    
    
    public String update() throws Exception {
        CelestialBody cb = new CelestialBody();
        cb.setId(this.id);
        cb.setDescription(this.description);
        cb.setMass(Double.parseDouble(this.mass));
        cb.setSize(Double.parseDouble(this.size));
        cb.setStar(new Star(this.star));
        cb.setCelestialBodyType(new CelestialBodyType(this.type));
        DAO_CelestialBody dao_cb = new DAO_CelestialBody(cb); 
            if(dao_cb.updateCB(1)){
            message = "swal({\n" +
            "  position: 'top-right',\n" +
            "  type: 'success',\n" +
            "  title: 'Cuerpo celestial Modificado Correctamente',\n" +
            "  showConfirmButton: false,\n" +
            "  timer: 1500\n" +
            "});";                  
            arrayCB=dao_cb.getCelestialBodys(); 
//             addActionMessage("Cuepo Celestial Actualizado corractamente");
                return SUCCESS;
            }
            else{
                return NONE;
            }
        }
    
    public String delete() throws Exception {
        CelestialBody cb = new CelestialBody();
        cb.setId(this.id);
        DAO_CelestialBody dao_cb = new DAO_CelestialBody(cb); 
            if(dao_cb.updateCB(2)){
            message = "swal({\n" +
            "  position: 'top-right',\n" +
            "  type: 'success',\n" +
            "  title: 'Cuerpo Celestial Eliminado,\n" +
            "  showConfirmButton: false,\n" +
            "  timer: 1500\n" +
            "});";                  
            arrayCB=dao_cb.getCelestialBodys(); 
                return SUCCESS;
            }
            else{
                return NONE;
            }
        }    
    
    
        
}
    

