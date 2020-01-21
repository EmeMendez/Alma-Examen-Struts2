/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.io.Serializable;

/**
 *
 * @author Melón
 */
public class User implements Serializable{
    private String user;
    private String pass;
    private Employee employee;

    public User(String user, String pass) {
        this.user = user;
        this.pass = pass;
    }
    
    public User(String user, String pass,Employee employee) {
        this.user = user;
        this.pass = pass;
        this.employee=employee;
        
    }    

    public User(){
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
    
    
}
