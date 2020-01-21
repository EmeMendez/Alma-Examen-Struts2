/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CelestialBodyType;
import Model.DAO_CelestialBodyType;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class C_CelestialBodyType extends ActionSupport{
    String id;
    String description;
    String message;
    ArrayList<CelestialBodyType> arrayCBT = new ArrayList<CelestialBodyType>();

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<CelestialBodyType> getArrayCBT() {
        return arrayCBT;
    }

    public void setArray(ArrayList<CelestialBodyType> arrayCBT) {
        this.arrayCBT = arrayCBT;
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
    CelestialBodyType cbt = new CelestialBodyType();
    cbt.setDescription(this.description);
    
    DAO_CelestialBodyType dao=new DAO_CelestialBodyType(cbt);
        if(dao.insertCelestialBodyType()){
        arrayCBT=dao.getCBT();
        message = "swal({\n" +
        "  position: 'top-right',\n" +
        "  type: 'success',\n" +
        "  title: 'Tipo de cuerpo celestial ingresado correctamente',\n" +
        "  showConfirmButton: false,\n" +
        "  timer: 1500\n" +
        "});"; 
            return SUCCESS;

        }
        else{
            return NONE;
        }
    }
    
    
    public String update(){
    CelestialBodyType cbt = new CelestialBodyType();
    cbt.setId(this.id);
    cbt.setDescription(this.description);
    
    DAO_CelestialBodyType dao=new DAO_CelestialBodyType(cbt);
        if(dao.updateCBT(1)){
        arrayCBT=dao.getCBT();
                message = "swal({\n" +
        "  position: 'top-right',\n" +
        "  type: 'success',\n" +
        "  title: 'Tipo de cuerpo celestial modificado correctamente',\n" +
        "  showConfirmButton: false,\n" +
        "  timer: 1500\n" +
        "});";
            return SUCCESS;
        }
        else{
            return NONE;
        }
    } 
    
    //Logic Delete (update State)
    public String delete(){
    CelestialBodyType cbt = new CelestialBodyType();
    cbt.setId(this.id);  
    DAO_CelestialBodyType dao=new DAO_CelestialBodyType(cbt);
        if(dao.updateCBT(2)){
        message = "swal({\n" +
        "  position: 'top-right',\n" +
        "  type: 'success',\n" +
        "  title: 'Tipo de cuerpo celestial Eliminado correctamente',\n" +
        "  showConfirmButton: false,\n" +
        "  timer: 1500\n" +
        "});";            
        arrayCBT=dao.getCBT();
            return SUCCESS;
        }
        else{
            return NONE;
        }
    }
    
    
    
}    


    

