<%-- 
    Document   : login_aluno
    Created on : 19/04/2017, 21:39:17
    Author     : Tarcisio & Joesio
--%>

<%if (session.getAttribute("nomeUsuario") != null) {
        response.sendRedirect("../logado.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:headerHome_inicio title="SisCoor Web - Aluno" titlePage="SisCoor Web | Aluno" caminho="../resources" paramVolta="../SisCoorWeb" alunoAtivo="active"/>

<tag:conteudoInicio/>
<%if (session.getAttribute("erro_login") != null) {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <%if (session.getAttribute("erro_login").equals("vazio")) {%>
    <strong>Preencha todos os campos!</strong>
    <%session.setAttribute("erro_login", null);
    } else {%>
    <strong>Número de Matrícula e/ou Senha incorreto(s)!</strong>
    <%
            session.setAttribute("erro_login", null);
        }
    %>
</div>
<%}%>
<tag:open_coluna tamanho="12"/>

<div class="col-lg-3"></div>
<div class="col-lg-6" style="align-content: center">
    <div class="panel panel-grey">
        <div class="panel-heading">
            Login</div>
        <div class="panel-body pan">
            <form action="../AutenticadorAluno" class="form-horizontal" method="post">
                <div class="form-body pal">
                    <div class="form-group">
                        <label for="inputMatricula" class="col-md-3 control-label">
                            Núm. de Matrícula: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="matricula" id="inputMatricula" type="text" class="form-control" /></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-md-3 control-label">
                            Senha: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input name="senha" id="inputPassword" type="password" class="form-control" /></div>
                            <br>Não tem uma conta? Cadastre-se clicando <a href="cadastro_aluno.jsp"><strong><u>aqui!</u></strong></a>
                            <!--<span class="help-block mbn"><a href="#"><small>Forgot password?</small> </a></span>-->
                        </div>
                    </div>
                    <div class="form-group mbn">
                        <div class="col-md-offset-3 col-md-6">
                        </div>
                    </div>
                </div>
                <div class="form-actions pal">
                    <div class="form-group mbn">
                        <div class="col-md-offset-3 col-md-6">
                            <button type="submit" class="btn btn-primary">
                                Entrar</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="col-lg-3"></div>
<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources" desenvolvedores="Alunos do 5º período do curso de Tecnologia em Análise e Desenvolvimento de Sistemas, do Instituto Federal Goiano - Campus Urutaí."/>
