<%-- 
    Document   : index
    Created on : 19/04/2017, 21:39:17
    Author     : Tarcisio & Jehymison

    --------------------------------- LEIA-ME ----------------------------------
    ----------------------------------------------------------------------------
    Para importações das tags usem primeiro o '<%@taglib' para informar os 
    caminhos com 'tagdir=/WEB-INF/tags/' e o prefixo da tag com 'prefix = 'tag'.
    ----------------------------------------------------------------------------
    Toda pagina deve conter a '<tag:header>' e a '<tag:footer>', ficando a cargo
    do desenvolvedor criar a parte de conteúdo da sua página.
    ----------------------------------------------------------------------------
    Maiores dúvidas entrar em contato:jehymes.gil@live.com|jehymes.gil@gmail.com
    ----------------------------------------------------------------------------
    ----------------------------------------------------------------------------
--%>
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
