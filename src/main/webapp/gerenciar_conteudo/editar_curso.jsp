<%-- 
    Document   : editar_curso
    Created on : 07/06/2017, 14:58:48
    Author     : Diego
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Alterar Curso" title="SisCoor | Gerenciar Conteúdo | Alterar Curso" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%CursoDAO cursoDAO = new CursoDAO();
ServidorDao servidorDAO = new ServidorDao(); 
ArrayList<Curso> listaCurso = new ArrayList<Curso>();
ArrayList<Servidor> listaServidor = new ArrayList<Servidor>();
listaCurso=cursoDAO.getLista();
listaServidor=servidorDAO.getLista();

if(listaCurso.isEmpty())
{
    session.setAttribute("msg", "Nenhum curso cadastrado no momento.");
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
        Alterar Curso
    </div>
    <div class="panel-body pan">
        <form action="../CursoServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->
                        
                        <%if(session.getAttribute("Dados_editar_curso")!=null)
                        {
                            Curso curso = new Curso();
                            curso=(Curso)session.getAttribute("Dados_editar_curso");
                            session.setAttribute("Dados_editar_curso", null);
                        %>
                        
                        <!-- nome do curso -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nomeCurso" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idCurso">
                                        
                                        <%for (int i = 0; i < listaCurso.size(); i++) {
                                            if(curso.getNome().equals(listaCurso.get(i).getNome()) && curso.getTurno()==listaCurso.get(i).getTurno()){%>
                                        
                                        <option selected value=<%=listaCurso.get(i).getIdCurso()%>><%=listaCurso.get(i).getNome()+" - "+listaCurso.get(i).getTurno()%></option><%}else{%>
                                        
                                        <option value=<%=listaCurso.get(i).getIdCurso()%>><%=listaCurso.get(i).getNome()+" - "+listaCurso.get(i).getTurno()%></option><%}%>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao_editar"/>
                        </div>
                    
                        <!-- Codigo do curso -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCodigo" class="control-label">
                                    Codigo
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-certificate"></i>
                                    <input readonly="true" class="form-control" type="text" value="<%=curso.getIdCurso()%>" name="codigo"/>
                                </div>
                            </div>
                        </div>

                        <!-- numero de periodos do curso -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputNumDePeriodos" class="control-label">
                                    Numero de Periodos
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-calendar"></i>
                                    <input class="form-control" type="text" value="<%=curso.getNumDePeriodos()%>" name="numeroDePeriodos"/>
                                </div>
                            </div>
                        </div>

                        <!-- nome do coordenador de curso -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="nomeCoordenador" class="control-label">
                                    <strong>*</strong>Coordenador
                                </label>
                                <div class="input-icon right">
                                    <select id="coordenador" class="form-control" name="nomeCoordenador">  
                                        <%for (int i = 0; i < listaServidor.size(); i++) {
                                            if(curso.getNomeCoordenador().equals(listaServidor.get(i).getNome())){%>
                                        
                                        <option selected value=<%=listaServidor.get(i).getIdServidor()%>><%=listaServidor.get(i).getNome()%></option><%}else{%>
                                        
                                        <option value=<%=listaServidor.get(i).getIdServidor()%>><%=listaServidor.get(i).getNome()%></option><%}%>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                                
                        <%--  Nome do curso --%>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCurso" class="control-label">
                                    Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-graduation-cap"></i>
                                    <input class="form-control" type="text" value="<%=curso.getNome()%>" name="nomeCurso"/>
                                </div>
                            </div>
                        </div>
                        <%--  turno do curso --%>        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTurno" class="control-label">
                                    Turno
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-clock-o"></i>
                                    <select class="form-control" name="nomeTurno">  
                                        <%if(curso.getTurno().equals("Matutino")){%>                                       
                                        <option selected style="align-content: center" value="Matutino">Matutino</option>
                                        <option style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                        <%if(curso.getTurno().equals("Vespertino")){%>                                       
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option selected style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                        <%if(curso.getTurno().equals("Noturno")){%>                                       
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option selected style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                        <%if(curso.getTurno().equals("Matutino-Vespertino")){%>                                       
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option selected style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                        <%if(curso.getTurno().equals("Matutino-Noturno")){%>                                       
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option selected style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                        <%if(curso.getTurno().equals("Vespertino-Noturno")){%>                                       
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option selected style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                        <%if(curso.getTurno().equals("Matutino-Vespertino-Noturno")){%>                                       
                                        <option style="align-content: center" value="Matutino">Matutino</option>
                                        <option selected style="align-content: center" value="Vespertino">Vespertino</option>
                                        <option style="align-content: center" value="Noturno">Noturno</option>
                                        <option style="align-content: center" value="Matutino-Vespertino">Matutino-Vespertino</option>
                                        <option style="align-content: center" value="Matutino-Noturno">Matutino-Noturno</option>
                                        <option style="align-content: center" value="Vespertino-Noturno">Vespertino-Noturno</option>
                                        <option selected style="align-content: center" value="Matutino-Vespertino-Noturno">Matutino-Vespertino-Noturno</option><%}%>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12" style="text-align: right">
                            <input name="botao_editar" type="submit" class="btn btn-blue" value="Salvar"/>
                        </div>
                        <%}else{%>
                        
                        <!-- nome do curso -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="titulo" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idCurso">
                                        
                                        <%for (int i = 0; i < listaCurso.size(); i++) {%>
                                        <option value=<%=listaCurso.get(i).getIdCurso()%>><%=listaCurso.get(i).getNome()+" - "+listaCurso.get(i).getTurno()%></option>
                                        <%}%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao_editar"/>
                        </div>
                    
                        <!-- Codigo do curso -->
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

                        <!-- numero de periodos do curso -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputNumDePeriodos" class="control-label">
                                    Numero de Periodos
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-calendar"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="numDePeriodos"/>
                                </div>
                            </div>
                        </div>

                        <!-- nome do coordenador do curso -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCoordenador" class="control-label">
                                    Nome do Coordenador
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-pencil"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="coordenador"/>
                                </div>
                            </div>
                        </div>
                                
                        <%--  Nome do curso --%>
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNomeCurso" class="control-label">
                                    Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-graduation-cap"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="nomeCurso"/>
                                </div>
                            </div>
                        </div>
                                
                        <%--  turno do curso --%>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTurno" class="control-label">
                                    Turno
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-clock-o"></i>
                                    <input readonly="true" class="form-control" type="text" value="" name="turno"/>
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

