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
public class CelestialBodyType implements Serializable {
    private String id;
    private String description;
    private State state;

    public CelestialBodyType() {
    }

    public CelestialBodyType(String id) {
        this.id = id;
    }

    public CelestialBodyType(String id, String description,State state) {
        this.id = id;
        this.description = description;
        this.state=state;
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
