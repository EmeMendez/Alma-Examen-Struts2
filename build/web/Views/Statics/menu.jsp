<%-- 
    Document   : menu
    Created on : 22-nov-2017, 11:48:45
    Author     : Melón
--%>

<%@page import="Entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <img src="img/tele.png" style="height: 50px;width: 50px"><a class="navbar-brand" href="#"></a><h3>Observatorio Alma</h3>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="Home">Inicio<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="PlanetarySystem">S.Planetario</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Planeta
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="Planet">Planeta</a>          
            <a class="dropdown-item" href="#">Tipo Planeta</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="Star">Estrella<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="Satelite">Satelite<span class="sr-only">(current)</span></a>
      </li> 
<li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Cuerpos Celestes
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="CelestialBody">Cuerpos Celestes</a>          
            <a class="dropdown-item" href="CelestialBodyType">Tipo de Cuerpos Celestes</a>
        </div>
      </li>      
    </ul>
      
      <form method="POST" action="Logout.do" class="form-inline my-2 my-lg-0">
        <label style="padding:1em ">Usuario Conectado : &nbsp<span><b> ${userName}</b></span></label>     
      <button class="btn btn-outline-dark btn-sm" type="submit">Cerrar Sesión</button>
    </form>
  </div>
</nav>   
</html>
