<%-- 
    Document   : Satelite
    Created on : 05-dic-2017, 23:45:36
    Author     : Melón
--%>

<%@page import="Model.DAO_User"%>
<%@page import="Entity.Planet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO_Planet"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <link rel = "stylesheet" type = "text/css" href = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.css" >
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.js" ></script>                                            
        <script src="./js/Alma.js"></script>        
        <title>JSP Page</title>

    </head>
    <%@include file="Statics/menu.jsp" %>        
    <body>
        <script type="text/javascript">
            $( document ).ready(function() {
            <s:property value="mensaje"/>
        });
</script>        
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
              <div class="modal-body">
               <!-- Modal Content-->
        <s:form id="form" name="form" action="" onsubmit="return validateSatelite('description','diameter','days','hours','minutes')" >
           <input type="hidden" value="" id="ide" name="id" />           
          <div class="form-group">
                   <p><s:label >Planeta</s:label></p>
                   <select class="form-control" id="planet" name="planet">
                    <%
                                DAO_Planet dao = new DAO_Planet();
                                ArrayList<Planet> planets = dao.getPlanets(); 
                                    for(Planet p : planets)
                                    {
                                        out.print("<option id='opcion' value="+p.getId()+">");
                                        out.print(p.getDescription());
                                        out.print("</option>");
                                    }


                    %>    
                    </select>   
          </div>           
          <div class="form-group">
                    <p><s:label>Descripción</s:label> </p> 
                    <s:textfield id="description" cssClass="form-control" name="description" ></s:textfield>
                    <label style="color: red" id="infoDescription"></label>
          </div>

          <div class="form-group">
                     <p><s:label for="diameter">Diametro</s:label></p>
                     <s:textfield cssClass="form-control" id="diameter" name="diameter"></s:textfield>
                    <label style="color: red" id="infoDiameter"></label>
                    </div>   
          <div class="form-row">
            <div class="form-group col-md-4">
                <s:label for="days">Dias</s:label>      
                <s:textfield cssClass="form-control" id="days" name="days"></s:textfield>
                    <label style="color: red" id="infoDays"></label>
            
          </div>
            <div class="form-group col-md-4">
                <s:label for="hours">Horas</s:label>      
                <s:textfield cssClass="form-control" id="hours" name="hours"></s:textfield>
                    <label style="color: red" id="infoHours"></label>

            </div>
            <div class="form-group col-md-4">
                <s:label for="minutes">Minutos</s:label>
                <s:textfield cssClass="form-control" id="minutes" name="minutes"></s:textfield>
                    <label style="color: red" id="infoMinutes"></label>
            
                </div>
          </div>           

          <div class="form-group">
                     <p> <s:label for="image">Imagen Satelite</s:label></p>             
                     <s:textfield cssClass="form-control" id="image" type="file" name="image"></s:textfield>
          </div>
          
         
          
          
          </div>
       <div class="modal-footer">
              <s:submit id="submit" cssClass="btn btn-success" value="Registrar"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </s:form>
        </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">$( document ).ready(function() {<s:property value="message"/>});</script>            

        <div class="container">
                    <h1>Satelites</h1>
                    <p>        <button onclick="Satelite('','','','','','','','','Registrar','btn btn-success')" type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
            <b>+</b> Nuevo Satelite
        </button></p>
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
                 <th>----Acciones----</th>
               
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
                    
                    <td><button onclick="Satelite('<s:property value="id"/>',<s:property value="#dato.planet.id"/>,'<s:property value="description"/>','<s:property value="diameter"/>','<s:property value="days"/>','<s:property value="hours"/>','<s:property value="minutes"/>','<s:property value="image"/>','Modificar','btn btn-info')" class="btn btn-info btn-sm">Modificar</button>                   
                    <button onclick="Satelite('<s:property value="id"/>','','','','','','','','Eliminar','')" class="btn btn-danger btn-sm">Eliminar</button></td>                    
                </tr>
            </s:iterator>
            </tbody>
            
        </table>   
        </div>
    </body>
</html>




































<script>
    function Satelite(ide,planet,description,diameter,days,hours,minutes,image,action,clas){ 
        document.getElementById("ide").value = ide; 
        document.getElementById("description").value = description;
        document.getElementById("diameter").value = diameter;         
        document.getElementById("days").value = days;         
        document.getElementById("hours").value = hours;         
        document.getElementById("minutes").value = minutes; 
        document.getElementById("submit").value = action; 
        document.getElementById("submit").className = clas; 
        if(action=="Registrar"){
          reset();  
         document.getElementById("planet").selected = true;                                                                    
        document.form.action = "regSatelite";
        document.getElementById("exampleModalLabel").innerHTML = "Nuevo Satelite";                                
        }    
        if(action=="Modificar"){
         reset();   
        document.getElementById("planet").value = planet; 
        document.getElementById("exampleModalLabel").innerHTML = "Editar Satelite";                        
           $('#exampleModal').modal('show');  
           document.form.action = "updSatelite";
        }
        if(action==='Eliminar'){       
            document.form.action = "dltSatelite";  
          swal({
          title: 'Esta Seguro de Eliminar?',
          text: "El satelite se Eliminará",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Eliminar!'
        }).then((result) => {
          if (result.value) {
              xd();
            $('#submit').click();                
          }
        });               
            } 
    }
    
    
    function validateSatelite(des,diam,d,h,m){
        des = document.getElementById(des);
        diam = document.getElementById(diam);
        d = document.getElementById(d);
        h = document.getElementById(h);
        m = document.getElementById(m);
        if(des.value===""){
            document.getElementById("infoDescription").innerHTML = "Debe proporcionar una descripción";
            return false;
        }
        if(isNaN(diam.value)){
            document.getElementById("infoDiameter").innerHTML = "El campo diametro debe ser un número";
            return false;      
        }
        if(diam.value===""){
            document.getElementById("infoDiameter").innerHTML = "Debe completar este campo";
            return false;      
        } 
        if(isNaN(d.value)){
            document.getElementById("infoDays").innerHTML = "El campo dias debe ser un número";
            return false;      
        }
        if(d.value===""){
            document.getElementById("infoDays").innerHTML = "Debe completar este campo";
            return false;      
        }
        if(isNaN(h.value)){
            document.getElementById("infoHous").innerHTML = "El campo Horas debe ser un número";
            return false;      
        }
        if(h.value===""){
            document.getElementById("infoHous").innerHTML = "Debe completar este campo";
            return false;      
        }
        if(isNaN(m.value)){
            document.getElementById("infoMinutes").innerHTML = "El campo Minutos debe ser un número";
            return false;      
        }
        if(m.value===""){
            document.getElementById("infoMinutes").innerHTML = "Debe completar este campo";
            return false;      
        }       
    }
        
       function xd(){
        document.getElementById("description").value = "--";
        document.getElementById("diameter").value =1;         
        document.getElementById("days").value = 2;         
        document.getElementById("hours").value = 3;         
        document.getElementById("minutes").value = 4;           
       } 
       
       function reset(){
        document.getElementById("infoDescription").innerHTML = "";
        document.getElementById("infoDays").innerHTML = "";
        document.getElementById("infoHours").innerHTML = "";
        document.getElementById("infoMinutes").innerHTML = "";
        document.getElementById("infoDiameter").innerHTML = "";
   
       }
  
    
    
    
    
    
    
     
</script>