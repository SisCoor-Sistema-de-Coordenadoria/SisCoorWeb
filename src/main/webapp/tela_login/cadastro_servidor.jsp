<%-- 
    Document   : CadastrarAluno
    Created on : 27/05/2017, 17:09:38
    Author     : joesi
--%>

<%if(session.getAttribute("nomeUsuario")!=null){
    response.sendRedirect("../logado.jsp");
}%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <fieldset>
        <h1>Cadastrar Servidor</h1>
    
          <form method="post" action="SalvoCadastroServidor.jsp">
             <p>Id:<input type="text" name="id"/></p>
             <p>Nome:<input type="text" name="nome"/></p>
            <p>Cpf:<input type="text" name="cpf"/></p>
            <p>Email:<input type="text" name="email"/></p>
            <p>Senha:<input type="password" name="senha"/></p>
            <p>Telefone:<input type="text" name="telefone"/></p>
            <p>Tipo:<input type="text" name="tipo"/></p>
            <p>Suap:<input type="text" name="suap"/></p>
            <p>Data de Nascimento:<input type="text" name="data"/></p>
            <p><input type="submit" value="Cadastrar" /></p>
                    </form>
        </fieldset>
    </body>
</html>