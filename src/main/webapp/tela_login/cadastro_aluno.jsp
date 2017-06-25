<%-- 
    Document   : cadastro_aluno
    Created on : 27/05/2017, 17:09:38
    Author     : Tarcísio e Joesio
--%>

<%if (session.getAttribute("nomeUsuario") != null) {
        response.sendRedirect("../logado.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header_inicio title="SisCoor Web - Aluno" titlePage="SisCoor Web | Aluno" caminho="../resources" paramVolta="../../SisCoorWeb" alunoAtivo="active"/>

<tag:conteudoInicio/>
<%if (session.getAttribute("erro_cadastro") != null) {%>
<%if (session.getAttribute("erro_cadastro").equals("false")){%>
    <div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
        <strong>Cadastro efetuado com sucesso!</strong>
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
<tag:open_coluna tamanho="12"/>

<div class="col-lg-2"></div>
<div class="col-lg-8">
    <div class="panel panel-grey">
        <div class="panel-heading">
            Cadastro de Aluno</div>
        <div class="panel-body pan">
            <form action="../CadastroAlunoServlet" method="post">
                <div class="form-body pal">
                    <div class="form-group">
                        <label for="inputNome" class="col-md-3 control-label">
                            Nome Completo: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="nome" id="inputNome" type="text" placeholder="" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputCpf" class="col-md-3 control-label">
                            CPF: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-credit-card"></i>
                                <input name="cpf" id="inputCpf" type="text" placeholder="" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-md-3 control-label">
                            E-mail: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-envelope"></i>
                                <input name="email" id="inputEmail" type="text" placeholder="" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputTelefone" class="col-md-3 control-label">
                            Telefone: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-phone"></i>
                                <input name="telefone" id="inputTelefone" type="text" placeholder="" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputData" class="col-md-3 control-label">
                            Data de Nascimento: </label>
                        <div class="col-md-7">
                            <div class="input-icon right">
                                <i class="fa fa-calendar"></i>
                                <div class="row"></div>
                                <input name="data" id="inputData" type="date" placeholder="" class="form-control"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row"></div>
                        <br>
                    </div>
                    <div class="form-group">
                        <label for="inputMatricula" class="col-md-3 control-label">
                            Núm. de Matrícula: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="matricula" id="inputMatricula" type="text" placeholder="" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-3 control-label">
                            Senha: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input name="senha" id="inputPassword" type="password" placeholder="" class="form-control" /></div>
                        </div>
                    </div>

                    <div class="row"></div>
                    <div class="row"></div>
                    
                    <div class="form-group">
                        <div class="col-lg-1"></div>
                        <div class="checkbox">
                            <label>
                                <input tabindex="5" type="checkbox" />&nbsp; Aceito receber notícias e novidades do sistema.</label></div>
                    </div>
                    <div class="form-group mbn">
                        <div class="col-lg-1"></div>
                        <div class="checkbox">
                            <label>
                                <input tabindex="5" type="checkbox" />&nbsp; Aceito os Termos e Condições de Uso do SisCoor Web.</label></div>
                    </div>
                </div>
                <div class="form-actions text-right pal">
                    <center>
                        <button type="submit" name="bt_cad" value="voltar" class="btn btn-primary">
                            Voltar</button>&nbsp;&nbsp; &nbsp;&nbsp;
                        <button type="submit" name="bt_cad" value="cad" class="btn btn-primary">
                            Cadastrar-se</button>
                    </center>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="col-lg-2"></div>
<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources" desenvolvedores="Alunos do 5º período do curso de Tecnologia em Análise e Desenvolvimento de Sistemas, do Instituto Federal Goiano - Campus Urutaí."/>
