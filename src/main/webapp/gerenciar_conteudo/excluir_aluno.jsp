<%-- 
    Document   : excluir_aluno
    Created on : 09/06/2017, 18:00:21
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo| Gerenciar Conteúdo | Excluir Aluno" title="SisCoor | Gerenciar Conteúdo | Excluir Aluno" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%AlunoDao alunoDAO = new AlunoDao();
ArrayList<Aluno> listaAluno = new ArrayList<Aluno>();
listaAluno=alunoDAO.getLista();

if(listaAluno.isEmpty())
{
    session.setAttribute("msg", "Nenhum aluno cadastrado no momento.");
    session.setAttribute("tipo_msg", "danger");
}
%>

<% if (session.getAttribute("msg") != null && !session.getAttribute("tipo_msg").equals("success")) {
        String tipo_msg = String.valueOf(session.getAttribute("tipo_msg"));
        if (tipo_msg.equals("danger")) {%>
<div id="alert_danger" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%session.setAttribute("msg", null);
    session.setAttribute("tipo_msg", null);}
}else{%>
<%if (session.getAttribute("msg") != null && session.getAttribute("tipo_msg").equals("success"))
{%>
<div id="alert_danger" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%session.setAttribute("msg", null);
    session.setAttribute("tipo_msg", null);}
%>

<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>

<tag:open_coluna tamanho="8"/>

<div class="panel panel-grey" onpageshow="center">
    <div class="panel-heading">
        Excluir Aluno
    </div>
    <div class="panel-body pan">
        <form action="../CadastroAlunoServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulÃ¡rio -->
                        
                        <%if(session.getAttribute("Dados_excluir_aluno")!=null)
                        {
                            Aluno aluno = new Aluno();
                            aluno=(Aluno)session.getAttribute("Dados_excluir_aluno");
                            session.setAttribute("Dados_excluir_aluno", null);
                        %>
                        
                        <!-- nome do aluno -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="aluno" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idAluno">
                                        
                                        <%for (int i = 0; i < listaAluno.size(); i++) {
                                            if(aluno.getNome().equals(listaAluno.get(i).getNome())){%>
                                        
                                            <option selected value=<%=listaAluno.get(i).getIdAluno()%>><%=listaAluno.get(i).getNome()%></option><%}else{%>
                                        
                                        <option value=<%=listaAluno.get(i).getIdAluno()%>><%=listaAluno.get(i).getNome()%></option><%}%>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- BotÃ£o Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao"/>
                        </div>
                    
                        <!-- Codigo do Aluno -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCodigo" class="control-label">
                                    Código
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-certificate"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getIdAluno()%>" name="codigo"/>
                                </div>
                            </div>
                        </div>

                        <!-- numero cpf do aluno -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCPF" class="control-label">
                                    CPF
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-credit-card"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getCpf()%>" name="numCPF"/>
                                </div>
                            </div>
                        </div>

                        <!-- email do aluno -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">
                                    E-mail
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-pencil"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getEmail()%>" name="email"/>
                                </div>
                            </div>
                        </div>
                                
                        <%--  telefone do aluno --%>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTelefone" class="control-label">
                                    Telefone
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-phone"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getTelefone()%>" name="telefone"/>
                                </div>
                            </div>
                        </div>
                        <%--  matricula do aluno --%>        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputMatricula" class="control-label">
                                    Matricula
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getMatricula()%>" name="matricula"/>
                                </div>
                            </div>
                        </div>
                        <%--  nome do aluno --%>        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getNome()%>" name="nome"/>
                                </div>
                            </div>
                        </div>
                                <%--  nome do curso do aluno --%>        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCurso" class="control-label">
                                    Nome do Curso
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-graduation-cap"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=aluno.getNomeCurso()%>" name="nomeCurso"/>
                                </div>
                            </div>
                        </div>
                        <%--  data de nascimento  --%>     
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputDataNascimento" class="control-label">
                                    Data de Nascimento
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-calendar"></i>
                                    <input readonly="true" class="form-control" type="date" value="<%=aluno.getDataNascimento()%>" name="dataNascimento"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12" style="text-align: right">
                            <input name="botao" type="submit" class="btn btn-blue" value="Excluir"/>
                        </div>
                        <%}else{%>
                        
                        <!-- nome do curso do aluno -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="Aluno" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idAluno">
                                        
                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                        <option value=<%=listaAluno.get(i).getIdAluno()%>><%=listaAluno.get(i).getNome()%></option>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- BotÃ£o Buscar -->  
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao"/>
                        </div>
                        <!-- Codigo do Aluno -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCodigo" class="control-label">
                                    Código
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-certificate"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="codigo"/>
                                </div>
                            </div>
                        </div>

                        <!-- numero cpf do aluno -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCPF" class="control-label">
                                    CPF
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-credit-card"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="numCPF"/>
                                </div>
                            </div>
                        </div>

                        <!-- email do aluno -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">
                                    E-mail
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-envelope"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="email"/>
                                </div>
                            </div>
                        </div>
                                
                        <%--  telefone do aluno --%>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTelefone" class="control-label">
                                    Telefone
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-phone"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="telefone"/>
                                </div>
                            </div>
                        </div>
                        <%--  matricula do aluno --%>        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputMatricula" class="control-label">
                                    Matricula
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="matricula"/>
                                </div>
                            </div>
                        </div>
                        <%--  nome do aluno --%>        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="nome"/>
                                </div>
                            </div>
                        </div>
                                <%--  nome do aluno --%>        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCurso" class="control-label">
                                    Nome do Curso
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-graduation-cap"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="nomeCurso"/>
                                </div>
                            </div>
                        </div>
                        <%--  data de nascimento  --%>     
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputDataNascimento" class="control-label">
                                    Data de Nascimento
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-calendar"></i>
                                    <input readonly="true" class="form-control" type="date" value="" name="dataNascimento"/>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
           
        </form>
    </div>
</div>

<tag:close_coluna/>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<%}%>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>