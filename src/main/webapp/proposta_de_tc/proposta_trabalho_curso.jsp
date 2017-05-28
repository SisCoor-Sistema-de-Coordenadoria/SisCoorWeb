<%-- 
    Document   : proposta_trabalho_curso
    Created on : 23/04/2017, 17:04:05
    Author     : Jehymeson Gil
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>
<tag:header title="SisCoor | Módulo PTC" titlePage="Módulo|Proposta de Trabalho
de Curso" caminho="../resources" paramVolta="../../SisCoorWeb" ptcAtivo="active" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" />

<%Servidor[] professores = {new Servidor(001, "Gabriel"), new Servidor(002, "Monica"), new Servidor(003, "Patrícia"), new Servidor(004, "Paulo")};%>
<%Aluno[] alunos = {new Aluno("Jehymison Gil", 001), new Aluno("Naiane Maria", 002), new Aluno("Tarcísio Ribeiro", 003)};%>


<!-- Escondendo Mensagem Sucess-->
<script language="JavaScript">
    function fecha_banner()
    {
    var banner_obj = document.getElementById('alert');
            banner_obj.style.display = 'none';
    }
    setTimeout('fecha_banner()', 5000);</script>
<!-- Fim do JavaScript -->

<!-- Escondendo Mensagem Danger-->
<script language="JavaScript">
            function fecha_banner_danger()
            {
            var banner_obj = document.getElementById('alert_danger');
                    banner_obj.style.display = 'none';
            }
    setTimeout('fecha_banner_danger()', 5000000);</script>
<!-- Fim do JavaScript -->


<!--Início do Conteudo-->
<tag:conteudoInicio />
<% if (session.getAttribute("msg") != null) {
        String tipo_msg = String.valueOf(session.getAttribute("tipo_msg"));
        if (tipo_msg.equals("danger")) {%>
<div id="alert_danger" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%session.setAttribute("msg", null);
    session.setAttribute("tipo_msg", null);
} else if (tipo_msg.equals("success")) {%>
<div id="alert" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%>
    </strong>
</div>
<%session.setAttribute("msg", null);
            session.setAttribute("tipo_msg", null);
        }
    } else {
        session.setAttribute("msg", null);
        session.setAttribute("tipo_msg", null);
    }%>
<tag:open_coluna tamanho="3" />
<tag:close_coluna />

<tag:open_coluna tamanho="6"/>

<div class="panel panel-grey">
    <div class="panel-heading">
        Submeter Proposta
    </div>
    <div class="panel-body pan">
        <form action="../UploadServletPTC" method="POST" enctype="multipart/form-data">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->

                        <!-- Titulo do Trabalho -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputTitlePTC" class="control-label">
                                    <strong>*</strong>Título do Trabalho
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-pencil"></i>
                                    <input type="text" id="inputTitlePTC" class="form-control" name="tituloPTC">
                                </div>
                            </div>
                        </div>

                        <!-- ID Aluno01 -->
                        <div class="col-md-12" hidden="enable">
                            <div class="form-group">
                                <div class="input-icon right">
                                    <i class="fa fa-pencil"></i>
                                    <% int idAluno01;
                                        for (int i = 0; i < alunos.length; i++) {%>
                                    <%if (alunos[i].getNome().equals(
                                                (String) session.getAttribute("nomeUsuario"))) {%>
                                    <%idAluno01 = alunos[i].getIdAluno();%>
                                    <input value="<%=idAluno01%>" type="text" id="idAluno01" class="form-control" name="idAluno01">
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>

                        <!-- Aluno 01 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno01" class="control-label">
                                    <strong>*</strong>Aluno 01
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input value="<%=(String) session.getAttribute("nomeUsuario")%>" 
                                           disabled="true" type="text" id="aluno01" class="form-control" name="aluno01">
                                </div>
                            </div>
                        </div>

                        <!-- Aluno 02 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno02" class="control-label">
                                    Aluno 02
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputAluno02" class="form-control" name="aluno02">
                                        <option> </option>
                                        <%for (int i = 0; i < alunos.length; i++) {%>
                                        <option value="<%=alunos[i].getIdAluno()%>"><%= alunos[i].getNome()%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Orientador -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputOrientador" class="control-label">
                                    <strong>*</strong>Orientador
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputOrientador" class="form-control" name="idOrientador">
                                        <option> </option>
                                        <%for (int i = 0; i < professores.length; i++) {%>
                                        <option value="<%=professores[i].getIdServidor()%>"><%= professores[i].getNome()%></option>
                                        <%}%>                                       
                                    </select>                                        
                                </div>
                            </div>
                        </div>

                        <!-- Coorientador -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCoorientador" class="control-label">
                                    Coorientador
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputCoorientador" class="form-control" name="idCoorientador">
                                        <option> </option>
                                        <%for (int i = 0; i < professores.length; i++) {%>
                                        <option value="<%=professores[i].getIdServidor()%>"><%= professores[i].getNome()%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Arquivo a ser enviado -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputFile" class="control-label">
                                    <strong>*</strong>Selecione o Trabalho
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-file"></i>
                                    <input type="file" id="inputFile" class="form-control" name="file" accept=".pdf"/>
                                </div>
                            </div>
                            <strong><h6><b>Obs.: Campos compostos de '*' são obrigatórios.</b></h6></strong>
                        </div>

                        <!-- Botão de Envio -->
                        <div class="col-lg-12" style="text-align: justify">
                            <div class="col-sm-4 col-md-2 col-lg-4" style="text-align: justify">
                                <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn_propostaSubmit"/>
                            </div>
                            <div class="col-sm-4 col-md-7 col-lg-4"></div>
                            <div class="col-sm-4 col-md-2 col-lg-3">
                                <input type="submit" class="btn btn-blue" value="Submeter Proposta" name="btn_propostaSubmit"/>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<tag:close_coluna />

<tag:open_coluna tamanho="3" />
<tag:close_coluna />

<tag:conteudoFim />

<!-- Conteúdo Aqui 
        <br>
<h3>Preencha os dados abaixo:</h3>
<br>
<form method="POST" action="../PTCServlet" enctype="multipart/form-data">
    <table>
        <tr>
            <td><u>Título da proposta:</u></td>
        <td><input type="text" name="titulo"/></td>
        </tr>

        <tr>
            <td><u>Aluno 01: </u></td>
        <td>
            <select name="idAluno01">
                <option> </option>
<%for (int i = 0; i < alunos.length; i++) {%>
<option><%= alunos[i].toString()%></option>
<% }%>
</select>
</td>
</tr>

<tr>
<td>Aluno 02: </td>
<td>
<select name="idAluno02">
    <option> </option>
<%for (int i = 0; i < alunos.length; i++) {%>
<option><%= alunos[i].toString()%></option>
<% }%>
</select>
</td>
</tr>

<tr>
<td><u>Orientador: </u></td>
<td>
<select name="idOrientador">
<option> </option>
<%for (int i = 0; i < professores.length; i++) {%>
<option><%= professores[i].getNome()%></option>
<% }%>
</select>
</td>
</tr>

<tr>
<td>Coorientador: </td>
<td>
<select name="idCoorientador">
    <option> </option>
<%for (int i = 0; i < professores.length; i++) {%>
<option><%= professores[i].getNome()%></option>
<% }%>
</select>
</td>
</tr>

<tr>
<td><u>Proposta de Trabalho:</u></td>
<td><input type="file" name="file" id="file" accept=".pdf"/>
</tr>

</table><br>

<input type="submit" value="Submeter proposta" >
</form>
-->

<tag:footer ano="2017" versao="1.0" desenvolvedores="Jehymison Gil"
            caminho="../resources"/>