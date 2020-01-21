<%-- 
    Document   : welcome
    Created on : 22-nov-2017, 10:58:46
    Author     : Melón
--%>
<%@page import="Model.DAO_User"%>

    <% 
        User user = (User) session.getAttribute("user");
        
        if(user == null){
            request.getRequestDispatcher("index.jsp").forward(request, response);  
        } 
        request.setAttribute("userName",DAO_User.user.getUser());
    %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>                
        <title>Welcome!</title>
    </head>   
    <%@include file="Statics/menu.jsp" %>        
    <body>
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner">
            <div class="carousel-item active">
              <img class="d-block w-100" src="img/bkg_1.jpg" alt="First slide">

            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="img/bkg_3.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block w-100" src="img/bkg_2.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
                  <div class="carousel-caption d-none d-md-block">
                <h1>Bienvenido</h1>
                <h4>${name}</h4>
              </div>            
        </div>
    <div style="margin-top:2em" class="container">                      
        <div class="row">
            <div class="col-md-4">
                <h2>Sistema Planetario</h2>
                <p>
                    Un sistema planetario (también llamado en ocasiones sistema solar1​) está formado por una estrella central o varias (sistema estelar), y distintos objetos orbitando a su alrededor.
                </p>
                <p><a class="btn btn-default" href="">Learn more &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Planetas</h2>
                <p>Según la definición, el sistema solar consta de ocho planetas: Mercurio, Venus, Tierra, Marte, Júpiter, Saturno, Urano y Neptuno.</p>
                <p><a class="btn btn-default" href="#">Learn more &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Estrellas</h2>
                <p>Una estrella (del latín: stella) es una esfera luminosa de plasma que mantiene su forma gracias a su propia gravedad. La estrella más cercana a la Tierra es el Sol.</p>
                <p><a class="btn btn-default" href="#">Learn more &raquo;</a></p>
            </div>  
            </div>
    </div>        
    </body>
</html>
