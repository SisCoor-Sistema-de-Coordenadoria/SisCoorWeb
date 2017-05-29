<%-- 
    Document   : SalvoCadastroServidor
    Created on : 28/05/2017, 18:08:25
    Author     : joesi
--%>

<%@page import="java.sql.Date"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
           
            String sid=request.getParameter("id");
            String snome=request.getParameter("nome");
            String scpf=request.getParameter("cpf");
            String semail=request.getParameter("email");
            String ssenha=request.getParameter("senha");
            String stelefone=request.getParameter("telefone");
            String stipo=request.getParameter("tipo");
            String ssuap=request.getParameter("suap");
            Date sdata=request.getParameter(new Date("data"));
            
           
Servidor s = new Servidor();

s.setIdServidor(Integer.parseInt(sid));
s.setNome(snome);
s.setCpf(scpf);
s.setEmail(semail);
s.setSenha(ssenha);
s.setTelefone(stelefone);
s.setTipo(Integer.parseInt(stipo));
s.setSiape(ssuap);
s.setDataNascimento(sdata);


ServidorDao sdao = new ServidorDao();
sdao.adiciona(s);

        
        
        
        %>
        <h1>Salvo com sucesso</h1>
    </body>
</html>
