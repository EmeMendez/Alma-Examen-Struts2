<%-- 
    Document   : CelestialBody
    Created on : 05-dic-2017, 20:03:59
    Author     : Melón
--%>

<%@page import="Model.DAO_User"%>
<%@page import="Entity.CelestialBodyType"%>
<%@page import="Model.DAO_CelestialBodyType"%>
<%@page import="Entity.Star"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO_Star"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
    <%
        User user = (User) session.getAttribute("user");
        
        if(user == null){
            request.getRequestDispatcher("index.jsp").forward(request, response);  
        } 
        request.setAttribute("userName",DAO_User.user.getUser());
    %> 
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
        <title>Cuerpo Celestial</title>
    
    </head>        
    <%@include file="Statics/menu.jsp" %>        
    </head>
   
    <body>
<!-- Button trigger modal -->


        <div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button id="button" type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
               <!-- Modal Content-->
        
               <s:form id="form" name="form" action="regCB" onsubmit="return validateCB('description','mass','size')" >
            <input type="hidden" id="id" name="id">
               <div class="modal-body">
           
            <div class="form-group">
              <p><s:label >Estrella</s:label></p>
              <select class="form-control" id="star" name="star">
                        <%
                                    DAO_Star dao = new DAO_Star();
                                    ArrayList<Star> stars = dao.getStars(); 
                                        for(Star s : stars)
                                        {
                                            out.print("<option id='opcion' value="+s.getId()+">");
                                            out.print(s.getDescription());
                                            out.print("</option>");
                                        }


                        %>    
                    </select>   
            </div>                
            <div class="form-group">
                <p><s:label >Tipo de cuerpo celestial</s:label></p>
                <select class="form-control" id="type" name="type">
                <%
                            DAO_CelestialBodyType dao_cbt = new DAO_CelestialBodyType();
                            ArrayList<CelestialBodyType> cbt = dao_cbt.getCBT(); 
                                for(CelestialBodyType t : cbt)
                                {
                                    out.print("<option id='opcion' value="+t.getId()+">");
                                    out.print(t.getDescription());
                                    out.print("</option>");
                                }
              
    
                %>    
                </select>  
            </div>                
              <div class="form-group">
                  
                        <p><s:label>Descripción</s:label></p>
                        <s:textfield  cssClass="form-control" id="description" name="description" ></s:textfield>
                        <label style="color:red" id="infoDescription"></label>
              </div>               
              <div class="form-group">
                         <p><s:label for="mass">Masa</s:label></p>
                            <s:textfield  cssClass="form-control" id="mass" name="mass"></s:textfield>
                        <label style="color:red" id="infoMass"></label>
              
                        </div>
              <div class="form-group">
                         <p><s:label for="size">Tamaño</s:label></p>
                         <s:textfield   cssClass="form-control" id="size" name="size"></s:textfield>
                        <label style="color:red" id="infoSize"></label>
              
                            </div>
              </div>
              <div class="modal-footer">
              <s:submit id="submit" cssClass="btn btn-success" value="Registrar"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 </div>
        </s:form>
    <script type="text/javascript">$( document ).ready(function() {<s:property value="message"/>});</script>
             
            </div>
          </div>
        </div>
                <div class="container">
                    <h1>
                     Cuerpos Celestes   
                    </h1>
                    <p>        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal" onclick="celestyalBody('','','','','','','Registrar','btn btn-success')">
        + Cuerpo Celestial
        </button></p>                    
        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Estrella</th>
                <th>tipo</th>
                <th>descripcion</th>
                <th>masa</th>
                <th>tamaño</th>
                <th>Acciones</th>
                
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
                    <td><button onclick="celestyalBody('<s:property value="id"/>','<s:property value="#dato.star.id"/>','<s:property value="#dato.celestialBodyType.id"/>','<s:property value="description"/>','<s:property value="mass"/>','<s:property value="size"/>','Modificar','btn btn-info')" class="btn btn-info btn-sm">Modificar</button>                   
                    <button class="btn btn-danger btn-sm" onclick="celestyalBody('<s:property value="id"/>','','','','','','Eliminar','')"   >Eliminar</button></td>                     
                </tr>
            </s:iterator>
            </tbody>
        </table>        
    </body>
</html>






















<script>
    function celestyalBody(ide,star,type,description,mass,size,action,btn){
        document.getElementById("id").value = ide;
        document.getElementById("description").value = description;                             
        document.getElementById("mass").value = mass;         
        document.getElementById("size").value = size;
        document.getElementById("submit").className = btn;
        document.getElementById("submit").value = action;
        if(action==="Registrar"){
        reset();
        document.getElementById("exampleModalLabel").innerHTML = "Nuevo Cuepo Celestial";                                                      
        document.form.action = "regCB"; 
        document.getElementById("type").selected=true;
        document.getElementById("star").selected=true; 
        }
        if(action==="Modificar"){
           reset();
           document.form.action = "updCB";             
           $('#exampleModal').modal('show');              
           document.getElementById("star").value = star; 
           document.getElementById("type").value = type; 
           document.getElementById("exampleModalLabel").innerHTML = "Editar Cuepo Celestial";                                             
        }
        if(action==="Eliminar"){
            document.form.action = "dltCB";
            var dlt = confirm("Seguro que desea eliminar la el Cuepo Celestial?");
            if(dlt ===true){
            $('#submit').click();                
            }                    
        }
    }
    
    function validateCB(des,mass,size){
        des = document.getElementById(des);
        mass = document.getElementById(mass);
        size = document.getElementById(size);
        if(des.value===""){
          document.getElementById("infoDescription").innerHTML = "Debe proporcionar una descripción";
          return false;         
        }
        if(isNaN(mass.value)){
          document.getElementById("infoMass").innerHTML = "El campo masa, debe ser un número";
          return false;            
        }
        if(mass.value===""){
          document.getElementById("infoMass").innerHTML = "Debe completar este campo";
          return false;         
        }
        if(isNaN(size.value)){
          document.getElementById("infoSize").innerHTML = "El campo tamaño, debe ser un número";
          return false;            
        }
        if(size.value===""){
          document.getElementById("infoSize").innerHTML = "Debe completar este campo";
          return false;         
        }        
        
    }
    
    
    function reset(){
          document.getElementById("infoDescription").innerHTML = "";
          document.getElementById("infoMass").innerHTML = "";
          document.getElementById("infoSize").innerHTML = "";
        
    }
    
</script>