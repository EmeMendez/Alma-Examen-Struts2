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
public class CelestialBody implements Serializable {
    private String id;
    private Star star;
    private CelestialBodyType celestialBodyType;
    private String description;
    private double mass;
    private double size;
    private State state;

    public CelestialBody(String id) {
        this.id = id;
    }

    
    public CelestialBody(String id, Star star, CelestialBodyType celestialBodyType, String description, double mass, double size, State state) {
        this.id = id;
        this.star = star;
        this.celestialBodyType = celestialBodyType;
        this.description = description;
        this.mass = mass;
        this.size = size;
        this.state = state;
    }

    public CelestialBody() {
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Star getStar() {
        return star;
    }

    public void setStar(Star star) {
        this.star = star;
    }

    public CelestialBodyType getCelestialBodyType() {
        return celestialBodyType;
    }

    public void setCelestialBodyType(CelestialBodyType celestialBodyType) {
        this.celestialBodyType = celestialBodyType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getMass() {
        return mass;
    }

    public void setMass(double mass) {
        this.mass = mass;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    
    
    
}
