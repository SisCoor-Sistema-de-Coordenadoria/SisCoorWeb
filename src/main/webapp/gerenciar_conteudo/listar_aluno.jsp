<%-- 
    Document   : listar_curso
    Created on : 07/06/2017, 14:59:27
    Author     : Diego
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Lista de Alunos" title="SisCoor | Gerenciar Conteúdo | Lista de Alunos" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%AlunoDao alunoDAO = new AlunoDao();
ArrayList<Aluno> listaAlunos = new ArrayList<Aluno>();
listaAlunos=alunoDAO.getLista();
CursoDAO cursoDAO = new CursoDAO();
Curso curso = new Curso();

if(listaAlunos.isEmpty())
{
    session.setAttribute("msg", "Nenhum aluno cadastrado no momento.");
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
        <div class="panel-heading">Lista de Alunos</div>
        <div class="panel-body">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Código</th>
                    <th>Matricula</th>
                    <th>Nome</th>
                    <th>Curso</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Data de Nascimento</th>
                </tr>
                </thead>
                    <tbody>

                    <%
                    for(int i=0;i<listaAlunos.size();i++)
                    {
                        Aluno aluno = new Aluno();
                        aluno=listaAlunos.get(i);
                        curso=cursoDAO.buscarPorId(aluno.getIdCurso());
                        aluno.setNomeCurso(curso.getNome());
                    %>    
                        <tr>
                            <td class="active"><%=aluno.getIdAluno()%></td>
                            <td class="active"><%=aluno.getMatricula()%></td>
                            <td class="active"><%=aluno.getNome()%></td>
                            <td class="active"><%=aluno.getNomeCurso()%></td>
                            <td class="active"><%=aluno.getEmail()%></td>
                            <td class="active"><%=aluno.getTelefone()%></td>
                            <td class="active"><%=aluno.getDataNascimento()%></td>
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
