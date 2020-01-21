<%-- 
    Document   : PlanetarySystemReport
    Created on : 13-dic-2017, 9:36:28
    Author     : Melón
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
       <link rel = "stylesheet" type = "text/css" href = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.css" >
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.js" ></script>        
        <script src="./js/Alma.js"></script> 
    </head>
    <%@include file="Statics/menu.jsp" %>        
    
    <body>
        <div class="container">
            
            <h1>Reporte del Sistema <s:label value="%{nombre}"  name="nombre"></s:label>
</h1> 
            <h2>Estrellas Asociadas</h2>
        <table  class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Descripcion</th>
                <th>Sistema Planetario</th>               
            </thead>
            <tbody
            <s:iterator value="arrayStar" var="dato">
                <tr>
                    <td><s:property value="id"/></td>
                    <td><s:property value="description"/></td>
                    <td><s:property value="#dato.planetarySystem.name"/></td>
                </tr>
            </s:iterator>
            </tbody>
            
        </table> </div>        
        <br>
        <div class="container">
             <h2>Planetas Asociados a Estrellas</h2>
           
<table class="table table-striped table-sm " >
            <thead >
                <th >ID</th>
                <th >Descripcion</th>
                <th >Estrella</th>
                <th >Tipo de planeta</th>
                <th >simbologia</th>
                <th >Diametro Ec.</th>
                <th >Masa</th>
                <th >Radio Orbital</th>
                <th >Perimetro Orbital</th>
                <th >Rotacion</th> 
                <th >Comp. Atmosferica</th>
                <th >imagen</th> 
            </thead>
            <tbody class="table-striped"  >
            <s:iterator value="arrayPlanet" var="p">
                <tr scope="row">
                    <td><s:property value="id"/></td>
                    <td><s:property value="description"/></td>
                    <td><s:property value="#p.star.description"/></td>
                    <td><s:property value="#p.planetType.description"/></td>
                    <td><s:property value="simbology"/></td>
                    <td><s:property value="DEcuatorial"/></td>
                    <td><s:property value="mass"/></td>
                    <td><s:property value="ROrbital"/></td>
                    <td><s:property value="POrbital"/></td>
                    <td><s:property value="rotation"/></td>
                    <td><s:property value="CAtmosphere"/></td>
                    <td><s:property value="image"/></td> 
                    
                </tr>
            </s:iterator>
                
            </tbody>            
        </table>
            </div>
        <div class="container">
             <h2>Satelites asociados a Planetas</h2>
            
<table class="table table-striped" >
            <thead>
                <th>ID</th>
                <th>Planeta</th>                
                <th>nombre</th>
                <th>diametro</th>
                <th>dias</th>
                <th>horas</th>
                <th>Minutos</th>
                <th>Imagen</th>
               
            </thead>
            <tbody
            <s:iterator value="arraySatelite" var="dato">
                <tr>
                    <td><s:property value="id"/></td>
                    <td><s:property value="#dato.planet.description"/></td>
                    <td><s:property value="description"/></td>
                    <td><s:property value="diameter"/></td>
                    <td><s:property value="days"/></td>
                    <td><s:property value="hours"/></td>
                    <td><s:property value="minutes"/></td>
                    <td><s:property value="image"/></td>
                    
                </tr>
            </s:iterator>
            </tbody>
            
</table></div>
        <div class="container">
              <h2>Cuerpos Celestiales Asociados a Estrellas</h2>
           
        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Estrella</th>
                <th>tipo</th>
                <th>descripcion</th>
                <th>masa</th>
                <th>tamaño</th>
                
            </thead>
            <tbody
            <s:iterator value="arrayCB" var="dato">
                <tr>
                    <td><s:property value="id"/></td>
                    <td><s:property value="#dato.star.description"/></td>
                    <td><s:property value="#dato.celestialBodyType.description" /></td>
                    <td><s:property value="description"/></td>
                    <td><s:property value="mass"/></td>
                    <td><s:property value="size"/></td>
                </tr>
            </s:iterator>
            </tbody>
        </table> 
        </div>
    </body>
</html>
