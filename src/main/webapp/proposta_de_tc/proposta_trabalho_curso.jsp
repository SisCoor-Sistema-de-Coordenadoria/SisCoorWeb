<%-- 
    Document   : proposta_trabalho_curso
    Created on : 23/04/2017, 17:04:05
    Author     : Jehymeson Gil
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
--%>
<tag:header title="SisCoor | Módulo PTC" titlePage="Módulo|Proposta de Trabalho
            de Curso" caminho="../resources" paramVolta="../../SisCoorWeb" ptcAtivo="active" />

<%-- Objetos para preenchimento de campos select --%>
<%
    AlunoDao aluno = new AlunoDao();
    ServidorDao servidor = new ServidorDao();
    ArrayList<Aluno> listaAluno = aluno.getLista();
    ArrayList<Servidor> listaServidor = servidor.getLista();
%>

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

<!-- Verifica se é aluno ou cordenador que esta usando o módulo -->
<%if (session.getAttribute("tipoUsuario").toString().equals("2")) {%>
<tag:open_coluna tamanho="2" />
<div class="row">
    <div class="container-fluid">
        <button value="Novo Aluno" name="btn_propostaSubmissao" class="btn btn-default">
            Novo Aluno
        </button>
    </div>
</div>
<tag:close_coluna/>

<tag:open_coluna tamanho="6"/>
<div class="panel panel-grey">
    <div class="panel-heading">
        Submeter Proposta
    </div>
    <div class="panel-body pan">
        <form action="../UploadServlet" method="POST" enctype="multipart/form-data">
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

                        <!--Condição que checa se é aluno ou cordenador do curso -->
                        <%if (session.getAttribute("tipoUsuario").toString().equals("1")) {%>

                        <!-- ID Aluno01 -->
                        <div class="col-md-12" hidden="enable">
                            <div class="form-group">
                                <div class="input-icon right">                                    
                                    <input value="<%= session.getAttribute("idUsuario")%>" type="text" id="idAluno01" class="form-control" name="idAluno01">
                                </div>
                            </div>
                        </div>

                        <!-- Aluno 01 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno01" class="control-label">
                                    Aluno 01
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input class="form-control" 
                                           value="<%=(String) session.getAttribute("nomeUsuario")%>"
                                           disabled="enable" name="aluno01"/>
                                </div>
                            </div>
                        </div>
                        <%} else {%>
                        <!-- Aluno 01 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno01" class="control-label">
                                    Aluno 01
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputAluno01" class="form-control" name="idAluno01">
                                        <option value="0"> </option>
                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                        <option value="<%=listaAluno.get(i).getIdAluno()%>"><%= listaAluno.get(i).getNome()%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <%}%>

                        <!-- Aluno 02 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno02" class="control-label">
                                    Aluno 02
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputAluno02" class="form-control" name="idAluno02">
                                        <option value="0"> </option>
                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                        <option value="<%=listaAluno.get(i).getIdAluno()%>"><%= listaAluno.get(i).getNome()%></option>
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
                                        <option value="0"> </option>
                                        <%for (int i = 0; i < listaServidor.size(); i++) {%>
                                        <option value="<%=listaServidor.get(i).getIdServidor()%>"><%= listaServidor.get(i).getNome()%></option>
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
                                        <option value="0"> </option>
                                        <%for (int i = 0;
                                                    i < listaServidor.size();
                                                    i++) {%>
                                        <option value="<%=listaServidor.get(i).getIdServidor()%>"><%= listaServidor.get(i).getNome()%></option>
                                        <%}%>
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

<tag:open_coluna tamanho="3"/>
<tag:close_coluna/>

<%} else {%>
<tag:open_coluna tamanho="3" />
<tag:close_coluna />
<tag:open_coluna tamanho="6"/>
<div class="panel panel-grey">
    <div class="panel-heading">
        Submeter Proposta
    </div>
    <div class="panel-body pan">
        <form action="../UploadServlet" method="POST" enctype="multipart/form-data">
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

                        <!--Condição que checa se é aluno ou cordenador do curso -->
                        <%if (session.getAttribute("tipoUsuario").toString().equals("1")) {%>

                        <!-- ID Aluno01 -->
                        <div class="col-md-12" hidden="enable">
                            <div class="form-group">
                                <div class="input-icon right">                                    
                                    <input value="<%= session.getAttribute("idUsuario")%>" type="text" id="idAluno01" class="form-control" name="idAluno01">
                                </div>
                            </div>
                        </div>

                        <!-- Aluno 01 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno01" class="control-label">
                                    Aluno 01
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input class="form-control" 
                                           value="<%=(String) session.getAttribute("nomeUsuario")%>"
                                           disabled="enable" name="aluno01"/>
                                </div>
                            </div>
                        </div>
                        <%} else {%>
                        <!-- Aluno 01 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno01" class="control-label">
                                    Aluno 01
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputAluno01" class="form-control" name="idAluno01">
                                        <option value="0"> </option>
                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                        <option value="<%=listaAluno.get(i).getIdAluno()%>"><%= listaAluno.get(i).getNome()%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <%}%>

                        <!-- Aluno 02 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno02" class="control-label">
                                    Aluno 02
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select id="inputAluno02" class="form-control" name="idAluno02">
                                        <option value="0"> </option>
                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                        <option value="<%=listaAluno.get(i).getIdAluno()%>"><%= listaAluno.get(i).getNome()%></option>
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
                                        <option value="0"> </option>
                                        <%for (int i = 0; i < listaServidor.size(); i++) {%>
                                        <option value="<%=listaServidor.get(i).getIdServidor()%>"><%= listaServidor.get(i).getNome()%></option>
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
                                        <option value="0"> </option>
                                        <%for (int i = 0;i < listaServidor.size();i++) {%>
                                        <option value="<%=listaServidor.get(i).getIdServidor()%>"><%= listaServidor.get(i).getNome()%></option>
                                        <%}%>
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

<tag:open_coluna tamanho="3"/>
<tag:close_coluna />
<%}%>



<tag:conteudoFim />

<tag:footer ano="2017" versao="1.0" desenvolvedores="Jehymison Gil"
            caminho="../resources"/>