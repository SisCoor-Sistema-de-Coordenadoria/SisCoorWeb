<%-- 
    Document   : selecao_de_curso
    Created on : 28/05/2017, 09:17:49
    Author     : Tarcisio
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="java.util.List"%>
<%List<Curso> cursos = new ArrayList();
    cursos.add(new Curso("TADS", "matutino"));
    cursos.add(new Curso("Alimentos", "vespertino"));
    cursos.add(new Curso("GTI", "noturno"));
    cursos.add(new Curso("Teste VN", "integral_ves_not"));
    cursos.add(new Curso("Teste MV", "integral_mat_ves"));
%>

<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header paramVolta="../../SisCoorWeb" title="SisCoor | Módulo Hr. de Aula" caminho="../resources" titlePage="Módulo | Horário de Aulas" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" horarioAtivo="active"/>

<tag:conteudoInicio/>

<tag:open_coluna tamanho="12"/>
<div class="col-md-3"></div>
<div class="col-md-6" style="align-content: center">
    <div class="panel panel-grey">
        <div class="panel-heading">
            Selecione um curso</div>
        <div class="panel-body pan">
            <%if (!cursos.isEmpty()) {%>
            <form action="../VerifCursoServlet" method="post">
                <div class="form-body pal">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group" style="text-align: center">
                                <select class="form-control" name="curso">
                                    <%for (int i = 0; i < cursos.size(); i++) {%>
                                    <option style="align-content: center" value="<%=cursos.get(i).getNome()%>"><%=cursos.get(i).getNome()%></option>
                                    <%}%>
                                </select></div>
                        </div>
                    </div>
                </div>
                <div class="form-actions text-right pal">
                    <button type="submit" class="btn btn-primary">
                        Próximo</button>
                </div>
            </form>
            <%}%>
        </div>
    </div>
</div>
<div class="col-md-3"></div>

<tag:close_coluna/>

<tag:conteudoFim/>

<tag:footer ano="2017" versao="1.0" caminho="../resources" desenvolvedores="Tarcísio R. Júnior"/>
