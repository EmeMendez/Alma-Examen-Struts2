/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.PlanetarySystem;
import Model.DAO_PlanetarySystem;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import java.util.ArrayList;
import javax.xml.ws.Action;
import org.apache.struts2.convention.annotation.Result;

/**
 *
 * @author Melón
 */
public class C_PlanetarySystem extends ActionSupport {
    String id;
    String description;
    String message;
    ArrayList<PlanetarySystem> arrayPS = new ArrayList<PlanetarySystem>();

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }
    @RequiredStringValidator(message="Debe Proporcionar una descripción")
    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList<PlanetarySystem> getArrayPS() {
        return arrayPS;
    }

    public void setArrayPS(ArrayList<PlanetarySystem> arrayPS) {
        this.arrayPS = arrayPS;
    }

    public void setMessage(String message) {
        this.message = message;
    }
    
    public String getMessage() {
        return message;
    }
    
    
    public String insert(){
    PlanetarySystem ps = new PlanetarySystem();
    ps.setName(this.description);
    DAO_PlanetarySystem dao=new DAO_PlanetarySystem(ps);
        setArrayPS(dao.getPS());
        if(dao.insertPS()){
         message="swal({\n" +
        "  position: 'top-right',\n" +
        "  type: 'success',\n" +
        "  title: 'Planeta Ingresado Correctaente!! ',\n" +
        "  showConfirmButton: false,\n" +
        "  timer: 1500\n" +
        "})";
        arrayPS=dao.getPS();
         return SUCCESS;
        }
        else {
            arrayPS=dao.getPS();
            return NONE;
        }
    }

    public String update(){
    PlanetarySystem ps = new PlanetarySystem();
    ps.setId(this.id);
    ps.setName(this.description);
    DAO_PlanetarySystem dao=new DAO_PlanetarySystem(ps);
        arrayPS=dao.getPS();
         message="swal({\n" +
        "  position: 'top-right',\n" +
        "  type: 'success',\n" +
        "  title: 'Planeta Modificado Correctamente!! ',\n" +
        "  showConfirmButton: false,\n" +
        "  timer: 1500\n" +
        "})";
        if(dao.updatePS(1)){
    arrayPS=dao.getPS();
            
            return SUCCESS;
        }
        else{
            return NONE;
        }
    }     

    public String delete(){
        PlanetarySystem ps = new PlanetarySystem();
        ps.setId(this.id);
        DAO_PlanetarySystem dao=new DAO_PlanetarySystem(ps);
        arrayPS=dao.getPS();
        message="swal(\n" +
            " 'Eliminado!',\n" +
            " 'El sistema planetario de eliminó.',\n" +
            " 'success'\n" +
            "  )";
            if(dao.updatePS(2)){
            arrayPS=dao.getPS();
                return SUCCESS;
            }
            else{
                return NONE;
            }
    }     
    
}
