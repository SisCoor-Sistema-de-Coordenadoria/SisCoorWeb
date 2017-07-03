<%-- 
    Document   : adicionar_servidor
    Created on : 09/06/2017, 17:52:33
    Author     : Diego
--%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Novo Servidor" title="SisCoor | Gerenciar Conteúdo | Novo Servidor" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>

<%if (session.getAttribute("erro_cadastro") != null) {%>
<%if (session.getAttribute("erro_cadastro").equals("false")){%>
    <div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
        <strong>Servidor cadastrado com sucesso!</strong>
    <%
            session.setAttribute("erro_cadastro", null);
    %>
    </div>
<%} else{%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <%if (session.getAttribute("erro_cadastro").equals("vazio")) {%>
        <strong>Preencha todos os campos!</strong>
    <%session.setAttribute("erro_cadastro", null);
    } else {%>
        <strong>Data inválida!</strong>
    <%
            session.setAttribute("erro_cadastro", null);
        }
    %>
</div>
<%}}%>
    
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:open_coluna tamanho="8"/>
 
<div class="panel panel-grey " onpageshow="center">
    <div class="panel-heading">
        Cadastrar um Servidor
    </div>
    <div class="panel-body pan">
        <form action="../CadastroServidorServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->                                       
                        <!-- Nome da Disciplina -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input id="inputNome" class="form-control" type="text" value="" name="nome"/>
                                </div>
                            </div>
                        </div>

                        <!-- Carga Horaria da Disciplina -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCpf" class="control-label">
                                    <strong>*</strong>CPF
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-credit-card"></i>
                                    <input id="inputCpf" class="form-control" type="text" value="" name="cpf"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTelefone" class="control-label">
                                    Telefone
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-phone"></i>
                                    <input id="inputTelefone" class="form-control" type="text" value="" name="telefone"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">
                                    <strong>*</strong>E-mail
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-envelope"></i>
                                    <input id="inputEmail" class="form-control" type="text" value="" name="email"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputData" class="control-label">
                                    <strong>*</strong>Data de Nascimento
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-calendar"></i>
                                    <input id="inputData" class="form-control" type="date" value="" name="data"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputSuap" class="control-label">
                                    <strong>*</strong>Nº do Suap
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input id="inputMatricula" class="form-control" type="text" value="" name="suap"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputPassword" class="control-label">
                                    <strong>*</strong>Senha
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-lock"></i>
                                    <input id="inputPassword" class="form-control" type="password" value="" name="senha"/>
                                </div>
                            </div>
                        </div>
                        <div class="row"></div>
                        <div class="row"></div>
                        <div class="form-group">
                            <div class="col-lg-1"></div>
                            <div class="checkbox">
                                <label>
                                    <input tabindex="5" type="checkbox" />&nbsp; Aceita receber notícias e novidades do sistema.</label></div>
                        </div>
                        <div class="form-group mbn">
                            <div class="col-lg-1"></div>
                            <div class="checkbox">
                                <label>
                                    <input tabindex="5" type="checkbox" />&nbsp; Aceita os Termos e Condições de Uso do SisCoor Web.</label></div>
                        </div>
                        <!-- Botão Cadastrar Disciplina -->
                        
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Cadastrar" name="bt_cad"/>
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
