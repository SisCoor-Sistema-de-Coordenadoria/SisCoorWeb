<%-- 
    Document   : adicionar_curso
    Created on : 07/06/2017, 14:58:32
    Author     : Diego
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.TreeMap"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Novo Curso" title="SisCoor | Gerenciar Conteúdo | Novo Curso" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>

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
    
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:open_coluna tamanho="8"/>

<%
ServidorDao servidorDAO = new ServidorDao();
ArrayList<Servidor> servidores = new ArrayList<Servidor>();

servidores=servidorDAO.getLista();
//Collections.sort(servidores);
%>
 
<div class="panel panel-grey " onpageshow="center">
    <div class="panel-heading">
        Cadastrar um Curso
    </div>
    <div class="panel-body pan">
        <form action="../CursoServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->                                       
                        <!-- Nome do Curso -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCurso" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <input class="form-control" type="text" value="" name="nomeCurso"/>
                                </div>
                            </div>
                        </div>

                        <!-- Turno do Curso -->
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="inputTurno" class="control-label">
                                    <strong>*</strong>Turno
                                </label>
                                <select class="form-control" name="nomeTurno">                
                                    <option style="align-content: center" value="Matutino">Matutino</option>
                                    <option style="align-content: center" value="Vespertino">Vespertino</option>
                                    <option style="align-content: center" value="Noturno">Noturno</option>
                                    <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                    <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                    <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                    <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option>
                                </select>
                            </div>
                        </div>
                        
                        <%-- Numero de Periodos --%>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="inputNumPeriodos" class="control-label">
                                    <strong>*</strong>Nº de Periodos
                                </label>
                                <div class="input-icon right">
                                    <input class="form-control" type="text" value="" name="numeroDePeriodos"/>
                                </div>
                            </div>
                        </div>
                        <%--Coordenador do Curso--%>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="inputCoordenador" class="control-label">
                                    <strong>*</strong>Coordenador
                                </label>
                                <select class="form-control" name="nomeCoordenador">                
                                    <option style="align-content: center" value="<%=(String) session.getAttribute("nomeUsuario")%>"><%=(String) session.getAttribute("nomeUsuario")%></option>
                                    <%for (int i = 0; i < servidores.size(); i++) {%>
                                    <option style="align-content: center" value="<%=servidores.get(i).getNome()%>"><%=servidores.get(i).getNome()%></option>
                                    <%}%>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Botão Cadastrar Curso -->
                        
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Cadastrar" name="botao"/>
                        </div>
                        
                    </div>
                </div>
            </div>
           
        </form>
    </div>

</div>

<tag:close_coluna/>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>
