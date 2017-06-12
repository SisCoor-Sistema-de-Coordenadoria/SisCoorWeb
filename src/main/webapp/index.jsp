<%-- 
    Document   : index
    Created on : 19/04/2017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>

<%if(session.getAttribute("nomeUsuario")!=null){
    response.sendRedirect("logado.jsp");
}%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:headerHome_inicio title="SisCoor Web - Início" titlePage="SisCoor Web | Início" caminho="resources"/>

<tag:conteudoInicio />
<tag:open_coluna tamanho="12"/>
<%--<div class="col-md-2"></div>
<div class="col-md-8" style="align-content: center">
    <div class="panel panel-grey">
        <div class="panel-heading">
            Bem vindo(a)!</div>
        <div class="panel-body pan" style="align-content: center">
                <div class="col-md-1"></div>
                <h4>Escolha o tipo de acesso adequado no menu ao lado!</h4>
                <div class="col-md-1"></div>
        </div>
    </div>
</div>
<div class="col-md-2"></div>
--%>

<center>
    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="align-content: center">
        <img src="resources/img/siscoor/SisCoor64_transparente.png" width="300">
    </div>
    <div class="row"></div>
    <br><br><br>
    
    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12" style="align-content: center">
        <h2>Bem vindo(a)!</h2><br><br>
        <h4>Escolha o seu perfil de acesso, e comece a utilizar o sistema!</h4>
    </div>
</center>
<tag:close_coluna/>
<tag:conteudoFim />
<tag:footerHome ano="2017" versao="1.0" caminho="resources" desenvolvedores="Alunos do 5º período do curso de Tecnologia em Análise e Desenvolvimento de Sistemas, do Instituto Federal Goiano - Campus Urutaí."/>
