<%-- 
    Document   : menu_horario_aula
    Created on : 28/05/2017, 15:26:24
    Author     : Tarcisio
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%Curso curso = (Curso) session.getAttribute("curso_horario");%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header paramVolta="../../SisCoorWeb" title="SisCoor | Módulo Hr. de Aula" caminho="../resources" titlePage="Módulo Horário de Aulas" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" horarioAtivo="active"/>

<tag:conteudoInicio/>

<tag:open_coluna tamanho="12"/>

<div id="sum_box" class="row mbl">
    <div class="col-sm-6 col-md-6">
        <a href="horario_<%=curso.getTurno()%>.jsp">
            <div class="panel profit db mbm">
                <div class="panel-body">
                    <p class="icon">
                        <i class="icon fa fa-plus-square-o"></i>
                    </p>
                    <h4 class="value">
                        <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                        </span><span>Novo horário</span></h4>
                    <p class="description">
                        Criar novo horário de aulas para o curso selecionado.</p>
                </div>
            </div>
        </a>
    </div>
</div>

<tag:close_coluna/>

<tag:conteudoFim/>

<tag:footer ano="2017" versao="1.0" caminho="../resources" desenvolvedores="Tarcísio R. Júnior"/>
