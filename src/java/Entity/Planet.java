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
public class Planet implements Serializable {
    private String id;
    private Star star;
    private PlanetType planetType;
    private String description;
    private String simbology;
    private double dEcuatorial;
    private double mass;
    private double rOrbital;
    private double pOrbital;
    private double rotation;
    private String cAtmosphere;
    private String image;
    private State state;

    public Planet() {
    }

    public Planet(String id) {
        this.id = id;
    }
    public Planet(String id, Star star, PlanetType planetType, String description, String simbology, double dEcuatorial, double mass, double rOrbital,double pOrbital, double rotation, String cAtmosphere, String image,State state) {
        this.id = id;
        this.star = star;
        this.planetType = planetType;
        this.description = description;
        this.simbology = simbology;
        this.dEcuatorial = dEcuatorial;
        this.mass = mass;
        this.rOrbital = rOrbital;
        this.pOrbital = pOrbital;
        this.rotation = rotation;
        this.cAtmosphere = cAtmosphere;
        this.image = image;
        this.state = state;
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

    public PlanetType getPlanetType() {
        return planetType;
    }

    public void setPlanetType(PlanetType planetType) {
        this.planetType = planetType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSimbology() {
        return simbology;
    }

    public void setSimbology(String simbology) {
        this.simbology = simbology;
    }

    public double getDEcuatorial() {
        return dEcuatorial;
    }

    public void setdDEcuatorial(double dEcuatorial) {
        this.dEcuatorial = dEcuatorial;
    }

    public double getMass() {
        return mass;
    }

    public void setMass(double mass) {
        this.mass = mass;
    }

    public double getROrbital() {
        return rOrbital;
    }

    public void setROrbital(double rOrbital) {
        this.rOrbital = rOrbital;
    }

    public double getRotation() {
        return rotation;
    }

    public void setRotation(double rotation) {
        this.rotation = rotation;
    }

    public String getCAtmosphere() {
        return cAtmosphere;
    }

    public void setCAtmosphere(String cAtmosphere) {
        this.cAtmosphere = cAtmosphere;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPOrbital() {
        return pOrbital;
    }

    public void setPOrbital(double pOrbital) {
        this.pOrbital = pOrbital;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    
}
