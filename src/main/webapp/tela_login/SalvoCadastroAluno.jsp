<%-- 
    Document   : SalvoCadastroServidor
    Created on : 28/05/2017, 18:08:25
    Author     : joesi
--%>


<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="java.sql.Date"%>


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
            String smatricula=request.getParameter("matricula");
            Date sdata=request.getParameter("data");
            
           
Aluno a = new Aluno();

a.setIdAluno(Integer.parseInt(sid));
a.setNome(snome);
a.setCpf(scpf);
a.setEmail(semail);
a.setSenha(ssenha);
a.setTelefone(stelefone);
a.setTipo(Integer.parseInt(stipo));
a.setMatricula(smatricula);
a.setDatadeNascimento(sdata);


AlunoDao adao = new AlunoDao();
adao.adiciona(a);

        
        
        
        %>
        <h1>Salvo com sucesso</h1>
    </body>
</html>
