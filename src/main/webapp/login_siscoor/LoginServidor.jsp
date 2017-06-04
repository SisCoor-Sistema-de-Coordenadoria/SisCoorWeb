<%-- 
    Document   : LoginAluno
    Created on : 27/05/2017, 11:49:41
    Author     : joesi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Aluno</title>
    </head>
    <body>
        <fieldset>
            <h1>
                Pagina de Login
            </h1>
               
            <form action="../AutenticadorServidor" method="post">
                <label>Suap:</label>
                <input type="text" name="suap"><br
                <label>Senha:</label>
                <input type="password" name="senha"><br>
                <input type="submit" value=" logar"> <a href="CadastrarServidor.jsp">Cadastrar</a>
            </form>
            
            
        </fieldset>
    </body>
</html>
