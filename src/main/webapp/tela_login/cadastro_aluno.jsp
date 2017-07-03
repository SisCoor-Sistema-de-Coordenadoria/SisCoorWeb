<%-- 
    Document   : cadastro_aluno
    Created on : 27/05/2017, 17:09:38
    Author     : Tarcísio e Joesio
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%if (session.getAttribute("usuario") != null) {
        response.sendRedirect("../logado.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:headerHome_inicio title="SisCoor Web - Aluno" titlePage="SisCoor Web | Aluno" caminho="../resources" paramVolta="../SisCoorWeb" alunoAtivo="active"/>

<tag:conteudoInicio/>
<%String erros = String.valueOf(session.getAttribute("erro_cadastro"));
%>
<%if (!erros.equals("null")) {%>
<%if (erros.equals("false")) {%>
<div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
    <strong>Cadastro efetuado com sucesso!</strong>
    <%
        session.setAttribute("erro_cadastro", null);
    %>
</div>
<%} else {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Foram encontrados os seguintes erros:</strong>
    <%if (erros.contains("vazio")) {%>
    <br>-> Há campos obrigatórios não preenchidos!
    <%session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("senha_peq")) {%>
    <br>-> Sua senha deve ter pelo menos 6 dígitos!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("matricula_inv")) {%>
    <br>-> O campo "Núm. de Matrícula" deve conter apenas números!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("cpf_inv")) {%>
    <br>-> Digite um CPF válido! Dica: digite apenas números.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("email_inv")) {%>
    <br>-> Digite um e-mail válido!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("telefone_inv")) {%>
    <br>-> Digite um telefone válido! Dica: digite apenas números.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("senhas_dif")) {%>
    <br>-> Senhas digitadas não conferem.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("termos_uso")) {%>
    <br>-> Para se cadastrar no sistema, você deverá aceitar os termos de uso!
    <%
            session.setAttribute("erro_cadastro", null);
        }
    %>
</div>
<%}
    }%>
<tag:open_coluna tamanho="12"/>

<div class="col-lg-2"></div>
<div class="col-lg-8">
    <div class="panel panel-grey">
        <div class="panel-heading">
            Cadastro de Aluno</div>
        <div class="panel-body pan">
            <form action="../CadastroAlunoServlet" method="post">
                <div class="form-body pal">
                    <div class="form-group" style="padding:5px">
                        <label><strong>Todos os itens marcados com * são obrigatórios:</strong></label><br><br><br>
                        <label for="inputNome" class="col-md-3 control-label">
                            * Nome Completo: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="nome" id="inputNome" type="text" placeholder="Escreva aqui seu nome completo" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group"  style="padding:5px">
                        <label for="inputCurso" class="col-md-3 control-label">
                            * Curso: </label>
                        <div class="col-md-9">
                            <select name="curso"class="form-control">
                                <option value="00">Escolha...</option>
                                <%for (int i = 1; i <= 31; i++) {%>
                                <option value="<%=i%>"><%=i%></option>
                                <%}%>
                            </select>
                        </div>
                        <br>
                    </div>
                    <div class="form-group"  style="padding:5px">
                        <label for="inputCpf" class="col-md-3 control-label">
                            * CPF: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-credit-card"></i>
                                <input name="cpf" id="inputCpf" type="text" placeholder="Somente números" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputEmail" class="col-md-3 control-label">
                            * E-mail: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-envelope"></i>
                                <input name="email" id="inputEmail" type="text" placeholder="Formato: email@dominio.com" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label class="col-md-3 control-label">
                            * Telefone:</label>
                        <div class="col-md-2">
                            <input name="ddd" type="text" placeholder="DDD" class="form-control" maxlength="2"/>
                        </div>
                        <div class="col-md-7">
                            <div class="input-icon right">
                                <i class="fa fa-phone"></i>
                                <input name="telefone" type="text" placeholder="Telefone (Apenas números)" class="form-control" />
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label class="col-md-3 control-label">
                            * Data de Nascimento (Dia/Mês/Ano): </label>
                        <div class="col-md-3 ">
                            <select name="dataDia"class="form-control">
                                <option value="00">Escolha...</option>
                                <%for (int i = 1; i <= 31; i++) {%>
                                <option value="<%=i%>"><%=i%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select name="dataMes"class="form-control">
                                <option value="00">Escolha...</option>
                                <option value="01">Janeiro</option>
                                <option value="02">Fevereiro</option>
                                <option value="03">Março</option>
                                <option value="04">Abril</option>
                                <option value="05">Maio</option>
                                <option value="06">Junho</option>
                                <option value="07">Julho</option>
                                <option value="08">Agosto</option>
                                <option value="09">Setembro</option>
                                <option value="10">Outubro</option>
                                <option value="11">Novembro</option>
                                <option value="12">Dezembro</option>
                            </select>
                        </div>

                        <div class="col-md-3 ">
                            <select name="dataAno"class="form-control">
                                <option value="00">Escolha...</option>
                                <%
                                    Calendar data = Calendar.getInstance();
                                    int anoAtual = data.get(Calendar.YEAR);
                                    for (int i = anoAtual; i >= anoAtual - 100; i--) {%>
                                <option value="<%=i%>"><%=i%></option>
                                <%}%>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row"></div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputMatricula" class="col-md-3 control-label">
                            * Núm. de Matrícula: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="matricula" id="inputMatricula" type="text" placeholder="Somente números" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputPassword" class="col-md-3 control-label">
                            * Senha: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input name="senha" id="inputPassword" type="password" placeholder="Mínimo de 6 caracteres" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputCPassword" class="col-md-3 control-label">
                            * Confirme sua senha: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input name="confirm_senha" id="inputCPassword" type="password" placeholder="Mínimo de 6 caracteres" class="form-control" /></div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>

                    <div class="row"></div>
                    <div class="row"></div>

                    <!-- Checkbox para enviar notícias por e-mail.
                    <div class="form-group">
                        <div class="col-lg-1"></div>
                        <div class="checkbox">
                            <label>
                                <input tabindex="5" type="checkbox" />&nbsp; Aceito receber notícias e novidades do sistema.</label></div>
                    </div>
                    -->

                    <div class="form-group mbn">
                        <div class="col-lg-1"></div>
                        <div class="checkbox">
                            <label>
                                * <input tabindex="5" type="checkbox" value="aceito" name="aceito"/>&nbsp; <strong>Aceito os Termos e Condições de Uso do SisCoor Web.</strong></label></div>
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
