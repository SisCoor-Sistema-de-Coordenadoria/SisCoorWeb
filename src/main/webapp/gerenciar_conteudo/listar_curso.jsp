<%-- 
    Document   : listar_curso
    Created on : 07/06/2017, 14:59:27
    Author     : Diego
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Lista de Cursos" title="SisCoor | Gerenciar Conteúdo | Lista de Cursos" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%CursoDAO cursoDAO = new CursoDAO();
ArrayList<Curso> listaCursos = new ArrayList<Curso>();
listaCursos=cursoDAO.getLista();
if(listaCursos.isEmpty())
{
    session.setAttribute("msg", "Nenhum curso cadastrado no momento.");
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

<tag:open_coluna tamanho="12"/>
   <div class="panel panel-grey">
        <div class="panel-heading">Lista de Cursos</div>
        <div class="panel-body">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Numero de Periodos</th>
                    <th>Turno</th>
                    <th>Coordenador</th>
                </tr>
                </thead>
                    <tbody>
                    <% 
                    for(int i=0;i<listaCursos.size();i++)
                    {
                        Curso curso = new Curso();
                        curso=listaCursos.get(i);
                    %>    
                        <tr>
                            <td class="active"><%=curso.getIdCurso()%></td>
                            <td class="active"><%=curso.getNome()%></td>
                            <td class="active"><%=curso.getNumDePeriodos()%></td>
                            <td class="active"><%=curso.getTurno()%></td>
                            <td class="active"><%=curso.getNomeCoordenador()%></td>
                        </tr>                       
                    <%}%>
                    </tbody>
            </table>
        </div>
    </div>


<tag:close_coluna/>

<%}%>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>