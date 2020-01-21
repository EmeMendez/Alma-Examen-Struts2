<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>                        
        <title>JSP Page</title>
    </head>
    <body  style="background-size: 100%"  background="img/galaxy.jpg">
        <video style="position: fixed;min-height: 100%;min-width: 100%" src="img/video2.mp4" muted autoplay loop></video>
        <form   name="login" action="Login.do" method="POST">
            <div style="text-align: center;margin-left: 500px" class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-4 ">
                        <div style="color: whitesmoke;margin-top:1em"><h1  class="text-center login-title">Observatorio Alma</h1><h3>Iniciar Sesión</h3></div>
                        <div class="account-wall">
                            <img  style="padding-bottom: 1em;height: 180px;width: 180px" class="profile-img " src="img/user.png"
                                alt="">
                            ${log}
                            <input name="txt_user" style="margin-top: 1em" type="text" class="form-control" placeholder="Usuario" required autofocus>
                            <input name="txt_pass" style="margin-bottom:1em;margin-top: 1em" type="password" class="form-control" placeholder="Contraseña" required>
                            <button class="btn btn-lg btn-dark btn-block" type="submit">
                                Ingresar</button>
                            <label style="color: whitesmoke" class="checkbox pull-left">
                                <input type="checkbox" value="remember-me">
                                Recordar Cuenta
                            </label><br>
                            <a href="#" style="color: white" class="pull-right need-help">Â¿Olvidaste tu contrasena? </a><span class="clearfix"></span>
                        </div>
                    </div>
                </div>
            </div>        
        </form>
    </body>
</html>

