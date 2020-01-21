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
public class Satelite implements Serializable {
    private String id;
    private Planet planet;
    private String description;
    private double diameter;
    private int days;
    private int hours;
    private int minutes;
    private String image;
    private State state;

    public Satelite(){}
    
    public Satelite(String id, Planet planet, String description, double diameter, int days, int hours, int minutes, String image, State state) {
        this.id = id;
        this.planet = planet;
        this.description = description;
        this.diameter = diameter;
        this.days = days;
        this.hours = hours;
        this.minutes = minutes;
        this.image = image;
        this.state = state;
    }

    public Satelite(String id) {
        this.id=id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Planet getPlanet() {
        return planet;
    }

    public void setPlanet(Planet planet) {
        this.planet = planet;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getDiameter() {
        return diameter;
    }

    public void setDiameter(double diameter) {
        this.diameter = diameter;
    }

    public int getDays() {
        return days;
    }

    public void setDays(int days) {
        this.days = days;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }

    public int getMinutes() {
        return minutes;
    }

    public void setMinutes(int minutes) {
        this.minutes = minutes;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }
    
    
    
}
