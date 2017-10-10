<%-- 
    Document   : buscar_disciplina
    Created on : 31/05/2017, 17:49:49
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.DisciplinaDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Lista de Disciplinas" title="SisCoor | Gerenciar Conteúdo | Lista de Disciplinas" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
ArrayList<Disciplina> listaDisciplinas = new ArrayList<Disciplina>();
listaDisciplinas=disciplinaDAO.getLista();

if(listaDisciplinas.isEmpty())
{
    session.setAttribute("msg", "Nenhuma disciplina cadastrada no momento.");
    session.setAttribute("tipo_msg", "danger");
}
%>

<% if (session.getAttribute("msg") != null) {
        String tipo_msg = String.valueOf(session.getAttribute("tipo_msg"));
        if (tipo_msg.equals("danger")) {%>
<div id="alert_danger" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%session.setAttribute("msg", null);
    session.setAttribute("tipo_msg", null);
}}else{%>
<tag:open_coluna tamanho="1"/>
<tag:close_coluna/>

<tag:open_coluna tamanho="10"/>
    <div class="panel panel-grey">
        <div class="panel-heading">Lista de Disciplinas</div>
        <div class="panel-body">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nome</th>
                    <th>Carga Horária</th>
                </tr>
                </thead>
                    <tbody>
                    <%
                    for(int i=0;i<listaDisciplinas.size();i++)
                    {
                        Disciplina disciplina = new Disciplina();
                        disciplina=listaDisciplinas.get(i);
                    
                    %>    
                        <tr>
                            <td class="active"><%=disciplina.getIdDisciplina()%></td>
                            <td class="active"><%=disciplina.getNome()%></td>
                            <td class="active"><%=disciplina.getCargaHora()%></td>
                        </tr>                       
                    <%}%>
                    </tbody>
            </table>
        </div>
    </div>

<tag:close_coluna/>
<tag:open_coluna tamanho="1"/>
<%}%>
<tag:close_coluna/>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>
