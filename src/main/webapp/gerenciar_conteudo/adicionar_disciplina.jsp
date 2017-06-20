<%-- 
    Document   : adicionar_disciplina
    Created on : 31/05/2017, 17:48:52
    Author     : Diego
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Nova Disciplina" title="SisCoor | Gerenciar Conteúdo | Nova Disciplina" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

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
 
<div class="panel panel-grey " onpageshow="center">
    <div class="panel-heading">
        Cadastrar uma Disciplina
    </div>
    <div class="panel-body pan">
        <form action="../DisciplinaServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->                                       
                        <!-- Nome da Disciplina -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeDisciplina" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <input class="form-control" type="text" value="" name="nomeDisciplina"/>
                                </div>
                            </div>
                        </div>

                        <!-- Carga Horaria da Disciplina -->
                        <div class="col-md-3">
                            <div class="form-group">
                                <label for="inputCargaHorariaDisciplina" class="control-label">
                                    <strong>*</strong>Carga Horária
                                </label>
                                <div class="input-icon right">
                                    <input class="form-control" type="text" value="" name="cargaHorariaDisciplina"/>
                                </div>
                            </div>
                        </div>

                        <!-- Botão Cadastrar Disciplina -->
                        
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
