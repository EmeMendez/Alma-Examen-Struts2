<%-- 
    Document   : Planet
    Created on : 06-dic-2017, 2:14:24
    Author     : Melón
--%>

<%@page import="Model.DAO_User"%>
<%@page import="Entity.PlanetType"%>
<%@page import="Model.DAO_PlanetType"%>
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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
       <link rel = "stylesheet" type = "text/css" href = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.css" >
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.9/sweetalert2.min.js" ></script>                        
        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>        
        
        <script src="./js/Alma.js"></script> 
        <script src="./js/img.js"></script>        
        
        <title>JSP Page</title>    
    </head>
    <%@include file="Statics/menu.jsp" %>        

<body>
    <s:div cssClass="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <s:div cssClass="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button id="button" type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
               <!-- Modal Content-->
               <s:form enctype='multipart/form-data' enctype="multipart/mixed stream" id="form"  action="regPlanet" onsubmit="return validatePlanet('description','decuatorial','mass','rorbital','porbital','rotation','catmosphere','star','planetType')">
            <input type="hidden" id="id" name="id">
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
              <label style="color: red" id="infoStar" ></label>            
                
            </select>    
            </div>
            <div class="form-group">
                <p><s:label >Tipo de planeta</s:label></p>    
                <select class="form-control" id="planetType" name="planetType">
                <%
                DAO_PlanetType dao_pt = new DAO_PlanetType();
                ArrayList<PlanetType> pt = dao_pt.getPlanetTypes(); 
                    for(PlanetType p : pt)
                    {
                        out.print("<option id='opcion' value="+p.getId()+">");
                        out.print(p.getDescription());
                        out.print("</option>");
                    }
                %>
                </select>
              <label style="color: red" id="infoPT" ></label>            
                
            </div> 
            <div class="form-group">
              <p><s:label for="description">Descripción</s:label></p>
              <s:textfield cssClass="form-control" id="description" name="description"></s:textfield>
              <label style="color: red" id="infoDescription" ></label>            
            </div>                
            <div class="form-group">
              <p><s:label for="DEcuatorial">Diametro Ecuatorial</s:label></p>
              <s:textfield cssClass="form-control" id="decuatorial" name="DEcuatorial"></s:textfield>
              <label style="color: red" id="infoDEcuatorial" ></label>                        
              </div>
          <div class="form-group">
              <p><s:label for="mass">Masa</s:label></p>
               <s:textfield cssClass="form-control" id="mass"  name="mass"></s:textfield>
               <label style="color: red" id="infoMass" ></label>                     
              </div>             
          <div class="form-group">
              <p><s:label for="ROrbital">radio orbital</s:label></p>    
              <s:textfield cssClass="form-control" id="rorbital" name="ROrbital"></s:textfield>
                <label style="color: red" id="infoROrbital" ></label>                    
               </div>            
          <div class="form-group">
              <p><s:label for="POrbital">perimetro orbital</s:label></p>
              <s:textfield cssClass="form-control" id="porbital" name="POrbital"></s:textfield>
                  <label style="color: red" id="infoPOrbital" ></label>                  
              </div>
          <div class="form-group">
              <p> <s:label for="rotation">Rotación</s:label></p>
              <s:textfield cssClass="form-control" id="rotation" name="rotation"></s:textfield>
                   <label style="color: red" id="infoRotation" ></label>                 
              </div>          
          <div class="form-group">
              <p> <s:label for="CAtmosphere">Composición Atmosferica</s:label></p>
              <s:textfield cssClass="form-control" id="catmosphere" name="CAtmosphere"></s:textfield>
              <label style="color: red" id="infoCAtmosphere" ></label>                
              </div>
         <%-- <div class="form-group">
              <p><s:label for="image">Imagen</s:label></p>
              <s:textfield cssClass="form-control" id="image" type="file" name="image"></s:textfield>
          </div>
          <div class="form-group">
              <p><s:label>Simbologia</s:label><p>
               <s:textfield cssClass="form-control" id="simbology" type="file" name="simbology" ></s:textfield>
          </div>--%>
        </div>
          
          
             <div class="row">
                 <div style="text-align: center" class="col-md-6 mb-3">
                     <div><h6 class="card-title">Simbolo</h6></div><br>
                    <img  id="imgExit" width="180px" height="180px" src="img/img.png"  />
                    <input  style="margin-top: 1em"  class="form-control" id="simbology" type="file" name="simbology" value="" multiple="true" />                        
                </div>
                <div style="text-align: center" class="col-md-6 mb-3">
                     <div><h6 class="card-title">Imagen Planeta</h6></div><br>
                     <img id="imageExit" width="180px" height="180px" src="img/img.png" />           
                    <input style="margin-top: 1em" class="form-control" id="image" type="file" name="image" value=""  multiple="true" />                
                </div>
            </div>                              
          
          
          
          
          
          
          
          
        <div class="modal-footer">
              <s:submit id="submit" cssClass="btn btn-success" value="Registrar" />
              <button type="button" class="btn btn-secondary" data-dismiss="modal" >Close</button>
            </s:form>
        </div>
      </div>
     </s:div>
    </s:div> 
    <script type="text/javascript">$( document ).ready(function() {<s:property value="mensaje"/>});</script>
        <div class="container">
        <h1>Planetas</h1>
        <p><button onclick="Planet('','','','','','','','','','','Registrar','btn btn-success')" type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
        + Nuevo Planeta
        </button></p>
            <div style="margin-left:-80px" class="container">
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
                <th >Modificar</th>
                <th >Eliminar</th>
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
                    <td><button data-toggle="modal" data-target="#exampleModal" class="btn btn-info btn-sm"  onclick="Planet('<s:property value="id"/>','<s:property value="description"/>','<s:property value="#p.star.id"/>','<s:property value="#p.planetType.id"/>','<s:property value="DEcuatorial"/>','<s:property value="mass"/>','<s:property value="POrbital"/>','<s:property value="POrbital"/>','<s:property value="rotation"/>','<s:property value="CAtmosphere"/>','Modificar','btn btn-info')">Modificar</button></td>                   
                    <td><button class="btn btn-danger btn-sm" onclick="Planet('<s:property value="id"/>','','','','','','','','','','Eliminar','')" >Eliminar</button></td>                   
                    
                </tr>
            </s:iterator>
            </tbody>            
        </table>  
        </div>
    </body>
</html>





























<script>
    function resetMessage(){
        document.getElementById("infoDescription").innerHTML = "";                                     
        document.getElementById("infoCAtmosphere").innerHTML =("");
        document.getElementById("infoRotation").innerHTML =("");
        document.getElementById("infoROrbital").innerHTML =("");
        document.getElementById("infoPOrbital").innerHTML =("");
        document.getElementById("infoMass").innerHTML =("");
        document.getElementById("infoDEcuatorial").innerHTML =("");
    }    
    
    
    
    function Planet(ide,des,star,pt,decuatorial,mass,rorbital,porbital,rotation,catmosphere,action,btn){
        document.getElementById("id").value = ide;
        document.getElementById("description").value = des;
        document.getElementById("decuatorial").value = decuatorial;
        document.getElementById("mass").value = mass;        
        document.getElementById("rorbital").value = rorbital;
        document.getElementById("porbital").value = porbital;
        document.getElementById("rotation").value = rotation;
        document.getElementById("catmosphere").value = catmosphere;
        document.getElementById("submit").className = btn; 
        document.getElementById("submit").value = action;         
         if(action==="Registrar"){
        resetMessage();         
        document.getElementById("exampleModalLabel").innerHTML = "Nuevo Planeta";                      
            document.form.action = "regPlanet";                          
            document.getElementById("star").selected = true;
            document.getElementById("planetType").selected = true;    
        }
        if(action==="Modificar"){
            resetMessage();          
            document.getElementById("exampleModalLabel").innerHTML = "Editar Planeta";                                  
            document.getElementById("star").value = star;
            document.getElementById("planetType").value = pt;                
            document.form.action = "updPlanet";
            $('#exampleModal').modal('show');              
        }
        if(action==="Eliminar"){
            document.form.action = "dltPlanet";
        swal({
          title: 'Esta Seguro de Eliminar?',
          text: "El Planeta se Eliminará",
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
    
    function validatePlanet(des,ecu,mass,ror,por,rot,cat,star,pt){
        des = document.getElementById(des);
        ecu = document.getElementById(ecu);
        mass = document.getElementById(mass);
        ror = document.getElementById(ror);
        por = document.getElementById(por);
        rot = document.getElementById(rot);
        cat = document.getElementById(cat);
        star = document.getElementById(star);
        pt = document.getElementById(pt)
        if(des.value===""){
            document.getElementById("infoDescription").innerHTML = ("Debe proporcionar una descripción");
            return false;}
        if(isNaN(ecu.value)){
            document.getElementById("infoDEcuatorial").innerHTML =("El campo diametro ecuatorial debe ser un número");
            return false;
        }
        if(ecu.value===""){
           document.getElementById("infoDEcuatorial").innerHTML = ("Debe completar este campo");
            return false;
        }
        
        if(isNaN(mass.value)){
            document.getElementById("infoMass").innerHTML =("El campo masa debe ser un número");
            return false;
        }
        if(mass.value===""){
            document.getElementById("infoMass").innerHTML =("Debe completar este campo");
            return false;
        }
        if(isNaN(ror.value)){
            document.getElementById("infoROrbital").innerHTML =("El campo radio orbital debe ser un número");
            return false;
        }
        if(ror.value===""){
            document.getElementById("infoROrbital").innerHTML =("Debe completar este campo");
            return false;
        }
        if(isNaN(por.value)){
            document.getElementById("infoPOrbital").innerHTML =("El campo perimetro orbital debe ser un número");
            return false;
        }
        if(por.value===""){
            document.getElementById("infoPOrbital").innerHTML =("Debe completar este campo");
            return false;
        }
        if(isNaN(rot.value)){
            document.getElementById("infoRotation").innerHTML =("El campo rotación debe ser un número");
            return false;
        }
        if(rot.value===""){
            document.getElementById("infoRotation").innerHTML =("Debe completar este campo");
            return false;
        }
        if(cat.value===""){
        document.getElementById("infoCAtmosphere").innerHTML =("Debe completar este campo");
            return false;
        }         if(cat.value===""){
        document.getElementById("infoCAtmosphere").innerHTML =("Debe completar este campo");
            return false;
        }
        if(star.value===""){
        document.getElementById("infoStar").innerHTML =("Debe completar este campo");
            return false;
        }
        if(pt.value===""){
        document.getElementById("infoPT").innerHTML =("Debe completar este campo");
            return false;
        }
    }
    
    function xd(){
        document.getElementById("description").value = "des";
        document.getElementById("decuatorial").value = "2";
        document.getElementById("mass").value = "2";        
        document.getElementById("rorbital").value = "2";
        document.getElementById("porbital").value = "2";
        document.getElementById("rotation").value = "2";
        document.getElementById("catmosphere").value = "2";
        document.getElementById("submit").className = "2"; 
        document.getElementById("submit").value = "2";         
    }
    
    
    
    
    

    
    
    
    
    
    
</script>
 