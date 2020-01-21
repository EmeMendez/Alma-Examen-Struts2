<%-- 
    Document   : PlanetarySistem
    Created on : 06-dic-2017, 0:20:18
    Author     : Melón
--%>

<%@page import="Model.DAO_User"%>
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
        <title>Sistema Planetario</title>
    </head>
    
    <% 
        User user = (User) session.getAttribute("user");
        
        if(user == null){
            request.getRequestDispatcher("index.jsp").forward(request, response);  
        } 
        request.setAttribute("userName",DAO_User.user.getUser());
    %>   
    <%@include file="Statics/menu.jsp" %>        
    <body>       
        <div class="modal fade" id="exampleModal">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 id="tittle" class="modal-title"></h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
                
              <s:form id="form" action="melooooo" onsubmit=" return validatePS('des')" >                 
                  <div class="modal-body">
                      <input type="hidden" name="id" id="id" value=""/>        
                      <div class="form-group">
                        <s:label>Descripción</s:label><br>
                        <s:textfield cssClass="form-control" name="description" id="des" ></s:textfield>
                        <label style="color: red" id="infoDescription" ></label>
                      </div>                
                  </div>
                        
                  <div class="modal-footer">
                      <input  type="submit" class="btn btn-success"  id="submit" value="Registrar"/>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                  </div>
              </s:form>                                  
            </div>
          </div>
        </div>
        <div  class="container">
            <h1>Sitemas Planetarios</h1><br>
            <div id="aviso">               
            </div>
            <p><button type="button" onclick="PlanetarySystem('','','Registrar','btn btn-success')" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                +Sistema Planetario
                </button></p>
       <script type="text/javascript">$( document ).ready(function() {<s:property value="message"/>});</script>
       <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Descripción</th>
                <th>Acciones</th>                
            </thead>
            <tbody
            <s:iterator value="arrayPS" var="ps">
                <tr>
                    <td><s:property value="id"/></td>
                    <td><s:property value="name"/></td>
                    <td>    <button onclick="PlanetarySystem('<s:property value="id"/>','<s:property value="name"/>','Reporte','')" id="delete"  class="btn btn-warning btn-sm" >Reporte</button>                                          
                    <button onclick="PlanetarySystem('<s:property value="id"/>','<s:property value="name"/>','Modificar','btn btn-info')" class="btn btn-info btn-sm">Modificar</button>              
                        <button onclick="PlanetarySystem('<s:property value="id"/>','<s:property value="name"/>','Eliminar','')" id="delete"  class="btn btn-danger btn-sm" >Eliminar</button>                     
                </td>
                </tr>
            </s:iterator>   
            </tbody>            
        </table>       
    </body>
</html>
























<script>
    function PlanetarySystem(ide,name,action,clas) {
        document.getElementById("id").value = ide;
        document.getElementById("des").value = name;
        document.getElementById("submit").value = action; 
        document.getElementById("submit").className = clas;    
        if(action=="Reporte"){
        document.form.action = "reportPS";            
          document.getElementById("des").value = "--";                          
            $('#submit').click();                            
        }
        if(action=="Registrar"){
        reset();   
        document.form.action = "regPS";
        document.getElementById("tittle").innerHTML = "Nuevo Sistema Planetario";        
        }if(action=="Modificar"){
        reset();
        document.form.action = "updPS";
        document.getElementById("tittle").innerHTML = "Editar Sistema Planetario";
        $('#exampleModal').modal('show');}    
        if(action=="Eliminar"){
          document.getElementById("des").value = "--";                          
            document.form.action = "dltPS";
        swal({
          title: 'Esta Seguro de Eliminar?',
          text: "El sistema Planetario se Eliminará",
          type: 'warning',
          showCancelButton: true,
          confirmButtonColor: '#3085d6',
          cancelButtonColor: '#d33',
          confirmButtonText: 'Si, Eliminar!'
        }).then((result) => {
          if (result.value) {
            $('#submit').click();                
          }
        });                  
          }
    }
    
    function validatePS(d){
        d=document.getElementById(d);
        if(d.value===""){
            document.getElementById("infoDescription").innerHTML = "Debe proporcionar una descripción";
            return false;
        }
        else return true;
    }
    
    
    function reset(){
      document.getElementById("infoDescription").innerHTML = "";        
    }
    
    
</script>