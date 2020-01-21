/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

//import Model.Empleado;
//import Model.Usuario;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.util.ValueStack;
import com.opensymphony.xwork2.validator.annotations.RequiredStringValidator;
import com.opensymphony.xwork2.validator.annotations.*;


/**
 *
 * @author valvader
 */
public class C_Home extends ActionSupport{


    @Override
    public String execute() throws Exception {
       /* 
        ValueStack miStack=ActionContext.getContext().getValueStack();
        
        usuario.setId_usuario(0123456);
        usuario.setNombre_usuario("INVITADO");
        usuario.setNivel(0);
        miStack.push(usuario);*/
        return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String PS() throws Exception{
        return(SUCCESS);
    }
    
    public String Planet() throws Exception{
        return(SUCCESS);
    }



    
}
