/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Entity.CelestialBody;
import Entity.CelestialBodyType;
import Entity.Planet;
import Entity.PlanetarySystem;
import Entity.Satelite;
import Entity.Star;
import Model.DAO_CelestialBody;
import Model.DAO_CelestialBodyType;
import Model.DAO_Planet;
import Model.DAO_PlanetarySystem;
import Model.DAO_Satelite;
import Model.DAO_Star;
import static com.opensymphony.xwork2.Action.NONE;
import static com.opensymphony.xwork2.Action.SUCCESS;
import java.util.ArrayList;

/**
 *
 * @author Melón
 */
public class C_List {
    String id;
    String nombre;
    ArrayList<PlanetarySystem> arrayPS = new ArrayList<PlanetarySystem>();
    ArrayList<Planet> arrayPlanet = new ArrayList<Planet>();
    ArrayList<Star> arrayStar = new ArrayList<Star>();
    ArrayList<Satelite> arraySatelite = new ArrayList<Satelite>();
    ArrayList<CelestialBody> arrayCB = new ArrayList<CelestialBody>();
    ArrayList<CelestialBodyType> arrayCBT = new ArrayList<CelestialBodyType>();

    public ArrayList<PlanetarySystem> getArrayPS() {
        return arrayPS;
    }

    public void setArrayPS(ArrayList<PlanetarySystem> arrayPS) {
        this.arrayPS = arrayPS;
    }

    public ArrayList<Planet> getArrayPlanet() {
        return arrayPlanet;
    }

    public void setArrayPlanet(ArrayList<Planet> arrayPlanet) {
        this.arrayPlanet = arrayPlanet;
    }

    public ArrayList<Star> getArrayStar() {
        return arrayStar;
    }

    public void setArrayStar(ArrayList<Star> arrayStar) {
        this.arrayStar = arrayStar;
    }

    public ArrayList<Satelite> getArraySatelite() {
        return arraySatelite;
    }

    public void setArraySatelite(ArrayList<Satelite> arraySatelite) {
        this.arraySatelite = arraySatelite;
    }

    public ArrayList<CelestialBody> getArrayCB() {
        return arrayCB;
    }

    public void setArrayCB(ArrayList<CelestialBody> arrayCB) {
        this.arrayCB = arrayCB;
    }

    public ArrayList<CelestialBodyType> getArrayCBT() {
        return arrayCBT;
    }

    public void setArrayCBT(ArrayList<CelestialBodyType> arrayCBT) {
        this.arrayCBT = arrayCBT;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
    

    public String ListPS() throws Exception {
    DAO_PlanetarySystem dao=new DAO_PlanetarySystem();
    arrayPS=dao.getPS();
    System.out.println(arrayPS);
        if(arrayPS!=null){
            return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
        }
        else{
            return (NONE);
        }
    }
    
    public String ListPlanet() throws Exception {
    DAO_Planet dao=new DAO_Planet();
    arrayPlanet=dao.getPlanets();
    System.out.println(arrayPlanet);
        if(arrayPlanet!=null){
            return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
        }
        else{
            return (NONE);
        }

    }
    
    public String ListStar() throws Exception {
    DAO_Star dao=new DAO_Star();
    arrayStar=dao.getStars();
    System.out.println(arrayStar);
        if(arrayStar!=null){
    arrayStar=dao.getStars();            
            return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
        }
        else{
            return (NONE);
        }

    }
    
    public String ListSatelite(){
        DAO_Satelite dao=new DAO_Satelite();
        arraySatelite=dao.getSatelits();
        System.out.println(arraySatelite);
        if(arraySatelite!=null){
            return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
        }
        else
        {
            return (NONE);
        }      
    }
    
    public String ListCB() throws Exception {
        DAO_CelestialBody dao_cb=new DAO_CelestialBody();
        arrayCB=dao_cb.getCelestialBodys();
        System.out.println(arrayCB);
        if(arrayCB!=null){
            return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
        }
        else
        {
            return (NONE);
        }
    
    }
    
    public String ListCBT() throws Exception {
        DAO_CelestialBodyType dao=new DAO_CelestialBodyType();
        arrayCBT=dao.getCBT();
        System.out.println(arrayCBT);
        if(arrayCBT!=null){
            return (SUCCESS); //To change body of generated methods, choose Tools | Templates.
        }
        else
        {
            return (NONE);
        }
    
    } 
    
    
    public String ListReportPS(){
    DAO_PlanetarySystem daops = new DAO_PlanetarySystem();
    this.nombre = daops.objetcPS(this.id).getName();
    DAO_Star dao = new DAO_Star();
    DAO_Planet daop = new DAO_Planet();
    DAO_Satelite daos = new DAO_Satelite();
    DAO_CelestialBody daocb = new DAO_CelestialBody();
    ArrayList<Planet> planetas = new ArrayList<Planet>();
    arrayStar=dao.getStarsReporte(this.id);
        for (int i = 0; i < arrayStar.size(); i++) {
            for(Planet p : daop.getPlanetsReport(arrayStar.get(i).getId())){
                arrayPlanet.add(p);
            }
        }
        for (int i = 0; i < arrayPlanet.size(); i++) {
            for (Satelite s : daos.getSatelitsReport(arrayPlanet.get(i).getId()) ) {
                arraySatelite.add(s);
            }
        }
        for (int i = 0; i < arrayStar.size(); i++) {
            for (CelestialBody cb : daocb.getCelestialBodysReport(arrayStar.get(i).getId())) {
                arrayCB.add(cb);
            }
        }
//        }
//    
    return SUCCESS;
    }
    
    
    
    
}    

