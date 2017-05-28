<%-- 
    Document   : login
    Created on : 27/05/2017, 21:57:17
    Author     : Jehymeson Gil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="logar" method="post">
        <h1>Login</h1><br><br><hr>
        <p>Nome: </p>
        <input name="nomeUsuario"/><br><br>
            <button name="login" value="Logar">Logar</button>
        </form>
    </body>
</html>
