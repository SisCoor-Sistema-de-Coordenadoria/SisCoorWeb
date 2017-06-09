<%-- 
    Document   : adicionar_disciplina
    Created on : 31/05/2017, 17:48:52
    Author     : Diego
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Nova Disciplina" title="SisCoor | Gerenciar Conteúdo | Nova Disciplina" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<tag:open_coluna tamanho="12"/>
<div class="col-md-2"> </div>  
    
<div class="panel panel-grey col-md-8" onpageshow="center">
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

                        <!-- Botão Agendar Defesa -->
                        
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Cadastrar"/>
                        </div>
                        
                    </div>
                </div>
            </div>
           
        </form>
    </div>

</div>
    
<div class="col-md-2"> </div> 

<tag:close_coluna/>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>
