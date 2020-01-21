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
public class Star implements Serializable {
    private String id;
    private String description;
    private PlanetarySystem planetarySystem;
    private State state;
    
    public Star() {
    }

    public Star(String id) {
        this.id = id;
    }

    public Star(String id, String description, PlanetarySystem planetarySystem,State state) {
        this.id = id;
        this.description = description;
        this.planetarySystem = planetarySystem;
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

    public PlanetarySystem getPlanetarySystem() {
        return planetarySystem;
    }

    public void setPlanetarySystem(PlanetarySystem planetarySystem) {
        this.planetarySystem = planetarySystem;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
    
    
}
