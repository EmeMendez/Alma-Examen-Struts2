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
public class PlanetarySystem implements Serializable {
    private String id;
    private String name;
    private State state;

    public String getId() {
        return id;
    }

    public PlanetarySystem() {
    }

    public PlanetarySystem(String id) {
        this.id = id;
    }
    
    public PlanetarySystem(String id, String name) {
        this.id = id;
        this.name = name;
    }   

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
 
    
}
