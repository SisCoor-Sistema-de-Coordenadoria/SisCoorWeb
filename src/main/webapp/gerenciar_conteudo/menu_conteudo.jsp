<%-- 
    Document   : menu_conteudo
    Created on : 31/05/2017, 21:14:07
    Author     : Diego
--%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="M�dulo | Gerenciar Conte�do" title="SisCoor | Gerenciar Conte�do" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<tag:open_coluna tamanho="12"/>

    <div class="col-md-12">
        <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
        </div>
    </div>

    <div class="col-lg-12">
        <div class="col-lg-12">
            <ul id="generalTab" class="nav nav-tabs responsive">
                <li class="active"><a href="#crud_disciplina" data-toggle="tab">Disciplinas</a></li>
                <li><a href="#crud_curso" data-toggle="tab">Cursos</a></li>
            </ul>

            <div id="generalTabContent" class="tab-content responsive">           
                <div id="crud_disciplina" class="tab-pane fade in active">
                    <div class="row"><div class="col-lg-2"></div>
                        <div id="sum_box" class="row mbl">
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="adicionar_disciplina.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-plus-square-o"></i>
                                            </p>
                                            <h4 class="value">Nova Disciplina</h4>
                                            <p class="description">Cadastra uma Nova Disciplina</p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="editar_disciplina.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-edit"></i>
                                            </p>
                                            <h4 class="value">Alterar Disciplina</h4>
                                            <p class="description">Altera os Dados de uma Disciplina</p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="excluir_disciplina.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-trash-o"></i>
                                            </p>
                                            <h4 class="value">Excluir Disciplina</h4>
                                            <p class="description">Exclui uma Disciplina Cadastrada</p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="listar_disciplina.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-file-text"></i>
                                            </p>
                                            <h4 class="value">Lista de Disciplinas</h4>
                                            <p class="description">Exibe uma Lista de Disciplinas</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div><div class="col-lg-2"></div>
                    </div>
                </div>

                <div id="crud_curso" class="tab-pane fade">
                    <div class="row"><div class="col-lg-2"></div>
                        <div id="sum_box" class="row mbl">
                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="adicionar_curso.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-plus-square-o"></i>
                                            </p>
                                            <h4 class="value">Novo Curso</h4>
                                            <p class="description">Cadastra um Novo Curso</p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="editar_curso.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-edit"></i>
                                            </p>
                                            <h4 class="value">Alterar Curso</h4>
                                            <p class="description">Altera os Dados de um Curso</p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="excluir_curso.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-trash-o"></i>
                                            </p>
                                            <h4 class="value">Excluir Curso</h4>
                                            <p class="description">Exclui um Curso Cadastrado</p>
                                        </div>
                                    </div>
                                </a>
                            </div>

                            <div class="col-sm-6 col-md-4 col-lg-4">
                                <a href="listar_curso.jsp">
                                    <div class="panel profit db mbm">
                                        <div class="panel-body">
                                            <p class="icon">
                                                <i class="icon fa fa-file-text"></i>
                                            </p>
                                            <h4 class="value">Lista de Cursos</h4>
                                            <p class="description">Exibe uma Lista de Cursos</p>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div><div class="col-lg-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-actions text-right pal"></div>                                      

<tag:close_coluna/>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>
