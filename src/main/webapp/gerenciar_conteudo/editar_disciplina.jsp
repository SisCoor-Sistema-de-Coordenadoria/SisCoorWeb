<%-- 
    Document   : editar_disciplina
    Created on : 31/05/2017, 17:49:06
    Author     : Diego
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.DisciplinaDAO"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Alterar Disciplina" title="SisCoor | Gerenciar Conteúdo | Alterar Disciplina" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>

<%DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
ArrayList<Disciplina> listaDisciplina = new ArrayList<Disciplina>();
listaDisciplina=disciplinaDAO.getLista();

if(listaDisciplina.isEmpty())
{
    session.setAttribute("msg", "Nenhuma disciplina cadastrada no momento.");
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

<tag:open_coluna tamanho="3"/>
<tag:close_coluna/>

<tag:open_coluna tamanho="6"/>

<div class="panel panel-grey" onpageshow="center">
    <div class="panel-heading">
        Alterar Disciplina
    </div>
    <div class="panel-body pan">
        <form action="../DisciplinaServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->
                        
                        <%if(session.getAttribute("Dados_editar_disciplina")!=null)
                        {
                            Disciplina disciplina = new Disciplina();
                            disciplina=(Disciplina)session.getAttribute("Dados_editar_disciplina");
                            session.setAttribute("Dados_editar_disciplina", null);
                        %>
                        
                        <!-- nome da disciplina -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="titulo" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idDisciplina">
                                        
                                        <%for (int i = 0; i < listaDisciplina.size(); i++) {
                                            if(disciplina.getNome().equals(listaDisciplina.get(i).getNome()) && disciplina.getCargaHora()==listaDisciplina.get(i).getCargaHora()){%>
                                        
                                        <option selected value=<%=listaDisciplina.get(i).getIdDisciplina()%>><%=listaDisciplina.get(i).getNome()+" - "+listaDisciplina.get(i).getCargaHora()+"h"%></option><%}else{%>
                                        
                                        <option value=<%=listaDisciplina.get(i).getIdDisciplina()%>><%=listaDisciplina.get(i).getNome()+" - "+listaDisciplina.get(i).getCargaHora()+"h"%></option><%}%>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao_editar"/>
                        </div>
                    
                        <!-- Codigo da disciplina -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCodigo" class="control-label">
                                    Código
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-certificate"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=disciplina.getIdDisciplina()%>" name="codigo"/>
                                </div>
                            </div>
                        </div>

                        <!-- Carga horaria da disciplina -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCH" class="control-label">
                                    <strong>*</strong>Carga Horária
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-clock-o"></i>
                                    <input class="form-control" type="text" value="<%=disciplina.getCargaHora()%>" name="ch"/>
                                </div>
                            </div>
                        </div>

                        <!-- nome da disciplina -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-pencil"></i>
                                    <input class="form-control" type="text" value="<%=disciplina.getNome()%>" name="nomeDisciplina"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12" style="text-align: right">
                            <input name="botao_editar" type="submit" class="btn btn-blue" value="Salvar"/>
                        </div>
                        <%}else{%>
                        
                        <!-- nome da disciplina -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="titulo" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idDisciplina">
                                        
                                        <%for (int i = 0; i < listaDisciplina.size(); i++) {%>
                                        <option value=<%=listaDisciplina.get(i).getIdDisciplina()%>><%=listaDisciplina.get(i).getNome()+" - "+listaDisciplina.get(i).getCargaHora()+"h"%></option>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao_editar">
                        </div>
                    
                        <!-- Codigo da disciplina -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCodigo" class="control-label">
                                    Codigo
                                </label>
                                <div class="input-icon right">
                                    <input readonly="true" class="form-control" type="text" value="" name="codigo"/>
                                </div>
                            </div>
                        </div>

                        <!-- Carga horaria da disciplina -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCH" class="control-label">
                                    Carga Horária
                                </label>
                                <div class="input-icon right">
                                    <input readonly="true" class="form-control" type="text" value="" name="ch"/>
                                </div>
                            </div>
                        </div>

                        
                        <!-- nome da disciplina -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    Nome
                                </label>
                                <div class="input-icon right">
                                    <input readonly="true" class="form-control" type="text" value="" name="nomeDisciplina"/>
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
<tag:open_coluna tamanho="3"/>
<tag:close_coluna/>
<%}%>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>

