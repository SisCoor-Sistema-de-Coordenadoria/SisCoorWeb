<%-- 
    Document   : adicionar_curso
    Created on : 07/06/2017, 14:58:32
    Author     : Diego
--%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="M�dulo | Gerenciar Conte�do | Novo Curso" title="SisCoor | Gerenciar Conte�do | Novo Curso" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<tag:open_coluna tamanho="12"/>

    
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:open_coluna tamanho="8"/>

<%
ServidorDao servidorDAO = new ServidorDao();
ArrayList<Servidor> servidores = new ArrayList<Servidor>();
servidores=servidorDAO.getLista();
//Collections.sort(servidores);
%>
 
<div class="panel panel-grey " onpageshow="center">
    <div class="panel-heading">
        Cadastrar um Curso
    </div>
    <div class="panel-body pan">
        <form action="../CursoServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formul�rio -->                                       
                        <!-- Nome do Curso -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCurso" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-graduation-cap"></i>
                                    <input class="form-control" type="text" value="" name="nomeCurso"/>
                                </div>
                            </div>
                        </div>

                        <!-- Turno do Curso -->
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="inputTurno" class="control-label">
                                    <strong>*</strong>Turno
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-clock-o"></i>
                                    <select class="form-control" name="nomeTurno">                
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <%-- Numero de Periodos --%>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="inputNumPeriodos" class="control-label">
                                    <strong>*</strong>N� de Periodos
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-calendar"></i>
                                    <input class="form-control" type="text" value="" name="numeroDePeriodos"/>
                                </div>
                            </div>
                        </div>
                        <%--Coordenador do Curso--%>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label for="inputCoordenador" class="control-label">
                                    <strong>*</strong>Coordenador
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <select class="form-control" name="nomeCoordenador">                
                                        <option style="align-content: center" value="<%=(String) session.getAttribute("nomeUsuario")%>"><%=(String) session.getAttribute("nomeUsuario")%></option>
                                        <%for (int i = 0; i < servidores.size(); i++) {%>
                                        <option style="align-content: center" value="<%=servidores.get(i).getNome()%>"><%=servidores.get(i).getNome()%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Bot�o Cadastrar Curso -->
                        
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
