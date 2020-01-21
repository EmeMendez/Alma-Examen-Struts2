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
public class PlanetType implements Serializable {
    private String id;
    private String description;
    private State state;

    public PlanetType(String id) {
        this.id = id;
    }

    public PlanetType(String id, String description,State state) {
        this.id = id;
        this.description = description;
        this.state=state;
    }

    public PlanetType() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
    
    
 
}
