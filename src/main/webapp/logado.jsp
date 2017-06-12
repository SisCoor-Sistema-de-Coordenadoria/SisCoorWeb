<%-- 
    Document   : index
    Created on : 19/04/2017, 21:39:17
    Author     : Tarcisio & Jehymison
--%>
<%if(session.getAttribute("nomeUsuario") == null){
    response.sendRedirect("");
}%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:headerHome title="SisCoor Web - 1.0" titlePage="Início" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" caminho="resources"/>

<tag:conteudoInicio />
<!--
Conteúdo do Início do Site aqui.
-->
<tag:conteudoFim />

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:footerHome ano="2017" versao="1.0" caminho="resources" desenvolvedores="Tarcísio Ribeiro, Jehymison Gil e Naiane Maria."/>
