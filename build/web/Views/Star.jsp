<%-- 
    Document   : Star
    Created on : 06-dic-2017, 1:10:18
    Author     : Melón
--%>

<%@page import="Model.DAO_User"%>
<%@page import="Entity.PlanetarySystem"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.DAO_PlanetarySystem"%>
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
              <div class="modal-body">
               <!-- Modal Content-->
               <p><s:actionmessage /></p>
        <h2><s:fielderror/></h2>        
        <s:form name="form" action="" onsubmit="return validateStar('description')">
            <input type="hidden" name="id" id="ide" value="" />            
            <div class="form-group">
                <p><s:label >Sistema Planetario</s:label></p>
                <select class="form-control" id="planetarySystem" name="planetarySystem">
                <%
                            DAO_PlanetarySystem dao = new DAO_PlanetarySystem();
                            ArrayList<PlanetarySystem> ps = dao.getPS(); 
                                for(PlanetarySystem p : ps)
                                {
                                    out.print("<option id='opcion' value="+p.getId()+">");
                                    out.print(p.getName());
                                    out.print("</option>");
                                }

                        %>    
                </select>    
            </div>            
            <div class="form-group">
                <p><s:label>Descripción</s:label></p>
                <s:textfield cssClass="form-control" id="description" name="description" ></s:textfield>
                <label id="infoDescription" style="color: red"></label>
            </div>               
        </div>
        <div class="modal-footer">
               <s:submit id="submit" cssClass="" value="Registrar"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
            </s:form>
        </div>
      </div>
     </div>
   </div>
        <div class="container">
    <script type="text/javascript">$( document ).ready(function() {<s:property value="message"/>});</script>            
            <h1>Estrellas</h1>
            <p>
         <button type="button" onclick="Star('','','','Registrar','btn btn-success')" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
        + Nueva Estrella
         </button></p>
        <table  class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Descripcion</th>
                <th>Sistema Planetario</th>
                <th>Acciones</th>
                
            </thead>
            <tbody
            <s:iterator value="arrayStar" var="dato">
                <tr>
                    <td><s:property value="id"/></td>
                    <td><s:property value="description"/></td>
                    <td><s:property value="#dato.planetarySystem.name"/></td>
                    <td><button class="btn btn-info btn-sm" onclick="Star('<s:property value="id"/>','<s:property value="#dato.planetarySystem.id"/>','<s:property value="description"/>','Modificar','btn btn-info')">Modificar</button>                  
                    <button class="btn btn-danger btn-sm" onclick="Star('<s:property value="id"/>','','','Eliminar','')" >Eliminar</button></td>                    
                </tr>
            </s:iterator>
            </tbody>
            
        </table>         
        
        </div>
    </body>
</html>
<script>
 function Star(ide,planetarySystem,description,action,clas){
    document.getElementById("ide").value = ide;             
    document.getElementById("description").value = description; 
    document.getElementById("submit").value = action; 
    document.getElementById("submit").className = clas;
    if(action=="Registrar"){
        document.getElementById("infoDescription").innerHTML = "";                
        document.form.action = "regStar";
        document.getElementById("exampleModalLabel").innerHTML = "Nueva Estrella";         
    }    
    if(action=="Modificar"){
        document.getElementById("infoDescription").innerHTML = "";      
        document.getElementById("planetarySystem").value= planetarySystem ;        
        document.form.action = "updStar";
        document.getElementById("exampleModalLabel").innerHTML = "Editar Estrella";                
        $('#exampleModal').modal('show');          
    }
    if(action=='Eliminar'){
            document.form.action = "dltStar";
        swal({
          title: 'Esta Seguro de Eliminar?',
          text: "La Estrella se Eliminará",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Eliminar!'
        }).then((result) => {
          if (result.value) {
            document.getElementById("description").value="--";
            $('#submit').click();                
          }
        });      
    }
} 
    
    function validateStar(d){
        d = document.getElementById(d);
        if(d.value===""){
            document.getElementById("infoDescription").innerHTML = "Debe proporcionar una descripción"
            return false;
        }
    }
    
    function reset(){
        
    }




</script>