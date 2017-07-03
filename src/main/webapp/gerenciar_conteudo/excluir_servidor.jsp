<%-- 
    Document   : excluir_servidor
    Created on : 09/06/2017, 17:59:37
    Author     : Diego
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Excluir Servidor" title="SisCoor | Gerenciar Conteúdo | Excluir Servidor" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%ServidorDao servidorDAO = new ServidorDao();
ArrayList<Servidor> listaServidor = new ArrayList<Servidor>();
listaServidor=servidorDAO.getLista();

if(listaServidor.isEmpty())
{
    session.setAttribute("msg", "Nenhum servidor cadastrado no momento.");
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
        Excluir Servidor
    </div>
    <div class="panel-body pan">
        <form action="../CadastroServidorServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->
                        
                        <%if(session.getAttribute("Dados_excluir_servidor")!=null)
                        {
                            Servidor servidor = new Servidor();
                            servidor=(Servidor)session.getAttribute("Dados_excluir_servidor");
                            session.setAttribute("Dados_excluir_servidor", null);
                        %>
                        
                        <!-- nome do servidor -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="servidor" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idServidor">
                                        
                                        <%for (int i = 0; i < listaServidor.size(); i++) {
                                            if(servidor.getNome().equals(listaServidor.get(i).getNome())){%>
                                        
                                            <option selected value=<%=listaServidor.get(i).getIdServidor()%>><%=listaServidor.get(i).getNome()%></option><%}else{%>
                                        
                                        <option value=<%=listaServidor.get(i).getIdServidor()%>><%=listaServidor.get(i).getNome()%></option><%}%>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao"/>
                        </div>
                    
                        <!-- Codigo do Servidor -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCodigo" class="control-label">
                                    Código
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-certificate"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=servidor.getIdServidor()%>" name="codigo"/>
                                </div>
                            </div>
                        </div>

                        <!-- numero cpf do servidor -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCPF" class="control-label">
                                    CPF
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-credit-card"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=servidor.getCpf()%>" name="numCPF"/>
                                </div>
                            </div>
                        </div>

                        <!-- email do servidor -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">
                                    E-mail
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-pencil"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=servidor.getEmail()%>" name="email"/>
                                </div>
                            </div>
                        </div>
                                
                        <%--  telefone do servidor --%>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTelefone" class="control-label">
                                    Telefone
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-phone"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=servidor.getTelefone()%>" name="telefone"/>
                                </div>
                            </div>
                        </div>
                        <%--  matricula do servidor --%>        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputSiape" class="control-label">
                                    Siape
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=servidor.getSiape()%>" name="siape"/>
                                </div>
                            </div>
                        </div>
                        <%--  nome do servidor --%>        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=servidor.getNome()%>" name="nome"/>
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
                                    <input readonly="true" class="form-control" type="date" value="<%=servidor.getDataNascimento()%>" name="dataNascimento"/>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12" style="text-align: right">
                            <input name="botao" type="submit" class="btn btn-blue" value="Excluir"/>
                        </div>
                        <%}else{%>
                        
                        <!-- nome do curso do servidor -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="servidor" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idServidor">
                                        
                                        <%for (int i = 0; i < listaServidor.size(); i++) {%>
                                        <option value=<%=listaServidor.get(i).getIdServidor()%>><%=listaServidor.get(i).getNome()%></option>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->  
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao"/>
                        </div>
                        <!-- Codigo do servidor -->
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

                        <!-- numero cpf do servidor -->
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

                        <!-- email do servidor -->
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
                                
                        <%--  telefone do servidor --%>
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
                        <%--  matricula do servidor --%>        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputSiape" class="control-label">
                                    Siape
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="siape"/>
                                </div>
                            </div>
                        </div>
                        <%--  nome do servidor --%>        
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