<%-- 
    Document   : CelestialBodyType
    Created on : 05-dic-2017, 22:28:48
    Author     : Melón
--%>
<%@page import="Model.DAO_User"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <% 
        User user = (User) session.getAttribute("user");
        
        if(user == null){
            request.getRequestDispatcher("index.jsp").forward(request, response);  
        } 
        request.setAttribute("userName",DAO_User.user.getUser());
    %> 
<html>

    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
       <link rel = "stylesheet" type = "text/css" href = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.css" >
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.js" ></script>        
        <script src="./js/Alma.js"></script>            
        
        <title>Tipos de cuerpos celestes</title>
    </head>
    <%@include file="Statics/menu.jsp" %>        
    <body>

        <div class="modal fade" id="exampleModal">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Nuevo Tipo de Cuepo Celeste</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <s:form id="form" action="updCBT" onsubmit="return validateCBT('description')">
                <p>
                <input type="hidden" id="id" name="id" value=""> 
          
                <div class="form-group">
                <p> <s:label>Descripción</s:label></p>
                <s:textfield cssClass="form-control" id="description" name="description" ></s:textfield>
                <label style="color:red" id="infoDescription"></label>
                </div>                
                
                
               
              </div>
              <div class="modal-footer">
                <s:submit id="submit"  cssClass="btn btn-success" value="Registrar"/>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                 </s:form>              
              </div>
            </div>
          </div>
        </div>
        <div class="container">
            <h1>Tipos de Cuerpos Celestes</h1>
            <p><button onclick="CelestialBodyType('','','Registrar','btn btn-success')"  type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">+Tipo Cuerpo Celestial</button>
</p>
    <script type="text/javascript">$( document ).ready(function() {<s:property value="message"/>});</script>

        <table class="table table-striped">
            <thead>
                <th>ID</th>
                <th>Descripcion</th>
                <th>Acciones</th>
                
            </thead>
            <tbody
            <s:iterator value="arrayCBT" var="dato">
                <tr>
                    <td><s:property value="id"/></td>
                    <td><s:property value="description"/></td>
                    <td><button onclick="CelestialBodyType('<s:property value="id"/>','<s:property value="description"/>','Modificar','btn btn-info')" class="btn btn-info btn-sm" >Modificar</button>                   
                    <button onclick="CelestialBodyType('<s:property value="id"/>','','Eliminar','')" class="btn btn-danger btn-sm">Eliminar</button></td>                    
                </tr>
            </s:iterator>
            </tbody>
            
        </table>  
        </div>
    </body>
</html>




















<script>
    
    function validateCBT(des){
        des=document.getElementById(des);
        if(des.value===""){
            document.getElementById("infoDescription").innerHTML="Debe proporcionar una descripción";
            return false;
        }
    }
    
    function CelestialBodyType(ide,des,action,btn){
        document.getElementById("id").value = ide;
        document.getElementById("description").value = des;
        document.getElementById("submit").className = btn; 
        document.getElementById("submit").value = action; 
        if(action=="Registrar"){
            document.getElementById("infoDescription").innerHTML="";            
            document.getElementById("exampleModalLabel").innerHTML = "Nuevo Tipo de Cuerpo Celestial";                                              
            document.form.action = "regCBT";                          
        }
        if(action=="Modificar"){ 
            document.getElementById("infoDescription").innerHTML="";                        
            document.form.action = "updCBT";
            document.getElementById("exampleModalLabel").innerHTML = "Editar Tipo de Cuerpo Celestial";                                              
           $('#exampleModal').modal('show');                 
        }
        if(action=="Eliminar"){
        document.getElementById("description").value = "--";            
            document.form.action = "dltCBT";
        swal({
          title: 'Esta Seguro de Eliminar?',
          text: "El Tipo de Cuerpo Celestial se Eliminará",
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
</script>
