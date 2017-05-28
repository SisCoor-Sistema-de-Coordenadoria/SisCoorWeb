<%-- 
    Document   : horario_matutino
    Created on : 27/05/2017, 16:00:00
    Author     : Tarcisio
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<%String aux;%>
<%Servidor[] professores = {new Servidor("Gabriel Vieira"), new Servidor("Monica Sakuray"), new Servidor("Patrícia Miziara"), new Servidor("Paulo Mansur")};%>
<%Disciplina[] discips = {new Disciplina("ProjOO"), new Disciplina("IHC"), new Disciplina("PADS"), new Disciplina("WebII"), new Disciplina("Topicos I")};%>

<%if (session.getAttribute("olho_servlet_horario") == null) { //condição para verificar se a tela já passou por alguma servlet%>
<tag:header paramVolta="../../SisCoorWeb" title="SisCoor | Módulo Hr. de Aula" caminho="../resources" titlePage="Módulo Horário de Aulas" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" horarioAtivo="active"/>
<%} else{%>
<tag:header paramVolta="<%=(String) session.getAttribute("param_volta_servlet")%>" title="SisCoor | Módulo Hr. de Aula" caminho="<%=(String) session.getAttribute("caminho_servlet")%>" titlePage="Módulo Horário de Aulas" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" horarioAtivo="active"/>
<%}%>
<tag:conteudoInicio/>

<tag:open_coluna tamanho="12"/>

<%if (session.getAttribute("olho_servlet_horario") == null) {%>
<form method="post" action="../HorarioAulaServlet">
    <div class="col-md-12">
        <div id="area-chart-spline" style="width: 100%; height: 300px; display: none;">
        </div>
    </div>

    <div class="col-lg-12">
        <div class="col-lg-12">
            <ul id="generalTab" class="nav nav-tabs responsive">
                <li class="active"><a href="#segunda-tab" data-toggle="tab">Segunda-Feira</a></li>
                <li><a href="#terca-tab" data-toggle="tab">Terça-Feira</a></li>
                <li><a href="#quarta-tab" data-toggle="tab">Quarta-Feira</a></li>
                <li><a href="#quinta-tab" data-toggle="tab">Quinta-Feira</a></li>
                <li><a href="#sexta-tab" data-toggle="tab">Sexta-Feira</a></li>
            </ul>

            <div id="generalTabContent" class="tab-content responsive">
                <div id="segunda-tab" class="tab-pane fade in active">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8" style="text-align: center">
                            <div class="panel panel-grey">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Horário</b></td>
                                                <td><b>Professor</b></td>
                                                <td><b>Disciplina</b></td>
                                            </tr>

                                            <tr>
                                                <td><b>07:00h 07:55h</b></td>
                                                <td>
                                                    <select name="segunda1prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda1disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>07:55h 08:50h</b></td>
                                                <td>
                                                    <select name="segunda2prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda2disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>09:10h 10:05h</b></td>
                                                <td>
                                                    <select name="segunda3prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda3disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>10:05h 11:00h</b></td>
                                                <td>
                                                    <select name="segunda4prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda4disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>

                <div id="terca-tab" class="tab-pane fade">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8" style="text-align: center">
                            <div class="panel panel-grey">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Horário</b></td>
                                                <td><b>Professor</b></td>
                                                <td><b>Disciplina</b></td>
                                            </tr>

                                            <tr>
                                                <td><b>07:00h 07:55h</b></td>
                                                <td>
                                                    <select name="terca1prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca1disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>07:55h 08:50h</b></td>
                                                <td>
                                                    <select name="terca2prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca2disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>09:10h 10:05h</b></td>
                                                <td>
                                                    <select name="terca3prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca3disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>10:05h 11:00h</b></td>
                                                <td>
                                                    <select name="terca4prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca4disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>

                <div id="quarta-tab" class="tab-pane fade">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8" style="text-align: center">
                            <div class="panel panel-grey">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Horário</b></td>
                                                <td><b>Professor</b></td>
                                                <td><b>Disciplina</b></td>
                                            </tr>

                                            <tr>
                                                <td><b>07:00h 07:55h</b></td>
                                                <td>
                                                    <select name="quarta1prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta1disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>07:55h 08:50h</b></td>
                                                <td>
                                                    <select name="quarta2prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta2disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>09:10h 10:05h</b></td>
                                                <td>
                                                    <select name="quarta3prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta3disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>10:05h 11:00h</b></td>
                                                <td>
                                                    <select name="quarta4prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta4disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>

                <div id="quinta-tab" class="tab-pane fade">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8" style="text-align: center">
                            <div class="panel panel-grey">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Horário</b></td>
                                                <td><b>Professor</b></td>
                                                <td><b>Disciplina</b></td>
                                            </tr>

                                            <tr>
                                                <td><b>07:00h 07:55h</b></td>
                                                <td>
                                                    <select name="quinta1prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta1disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>07:55h 08:50h</b></td>
                                                <td>
                                                    <select name="quinta2prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta2disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>09:10h 10:05h</b></td>
                                                <td>
                                                    <select name="quinta3prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta3disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>10:05h 11:00h</b></td>
                                                <td>
                                                    <select name="quinta4prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta4disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>

                <div id="sexta-tab" class="tab-pane fade">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8" style="text-align: center">
                            <div class="panel panel-grey">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Horário</b></td>
                                                <td><b>Professor</b></td>
                                                <td><b>Disciplina</b></td>
                                            </tr>

                                            <tr>
                                                <td><b>07:00h 07:55h</b></td>
                                                <td>
                                                    <select name="sexta1prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta1disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>07:55h 08:50h</b></td>
                                                <td>
                                                    <select name="sexta2prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta2disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>09:10h 10:05h</b></td>
                                                <td>
                                                    <select name="sexta3prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta3disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>10:05h 11:00h</b></td>
                                                <td>
                                                    <select name="sexta4prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta4disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>
                                            </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="form-actions text-right pal">
        <input type="submit" class="btn btn-primary" value="Validar dados"/>
    </div>                                      
</form>
<%} else {%>
<div class="col-lg-12" style="text-align: center">
    <div class="panel panel-grey">
        <div class="panel-body">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <td rowspan = "2" style="width: 20px"><b>Horário</b></td>
                        <td colspan = "2"><b>Segunda-Feira</b></td>
                        <td colspan = "2"><b>Terça-Feira</b></td>
                        <td colspan = "2"><b>Quarta-Feira</b></td>
                        <td colspan = "2"><b>Quinta-Feira</b></td>
                        <td colspan = "2"><b>Sexta-Feira</b></td>
                    </tr>
                    <tr>
                        <td><b>Professor</b></td>
                        <td><b>Disciplina</b></td>
                        <td><b>Professor</b></td>
                        <td><b>Disciplina</b></td>
                        <td><b>Professor</b></td>
                        <td><b>Disciplina</b></td>
                        <td><b>Professor</b></td>
                        <td><b>Disciplina</b></td>
                        <td><b>Professor</b></td>
                        <td><b>Disciplina</b></td>
                    </tr>
                    <tr>
                        <td><b>07:00h 07:55h</b></td>
                        <td><%=(String) request.getAttribute("segunda1prof")%></td>
                        <td><%=(String) request.getAttribute("segunda1disc")%></td>
                        <td><%=(String) request.getAttribute("terca1prof")%></td>
                        <td><%=(String) request.getAttribute("terca1disc")%></td>
                        <td><%=(String) request.getAttribute("quarta1prof")%></td>
                        <td><%=(String) request.getAttribute("quarta1disc")%></td>
                        <td><%=(String) request.getAttribute("quinta1prof")%></td>
                        <td><%=(String) request.getAttribute("quinta1disc")%></td>
                        <td><%=(String) request.getAttribute("sexta1prof")%></td>
                        <td><%=(String) request.getAttribute("sexta1disc")%></td>
                    </tr>
                    <tr>
                        <td><b>07:55h 08:50h</b></td>
                        <td><%=(String) request.getAttribute("segunda2prof")%></td>
                        <td><%=(String) request.getAttribute("segunda2disc")%></td>
                        <td><%=(String) request.getAttribute("terca2prof")%></td>
                        <td><%=(String) request.getAttribute("terca2disc")%></td>
                        <td><%=(String) request.getAttribute("quarta2prof")%></td>
                        <td><%=(String) request.getAttribute("quarta2disc")%></td>
                        <td><%=(String) request.getAttribute("quinta2prof")%></td>
                        <td><%=(String) request.getAttribute("quinta2disc")%></td>
                        <td><%=(String) request.getAttribute("sexta2prof")%></td>
                        <td><%=(String) request.getAttribute("sexta2disc")%></td>
                    </tr>
                    <tr>
                        <td><b>09:10h 10:05h</b></td>
                        <td><%=(String) request.getAttribute("segunda3prof")%></td>
                        <td><%=(String) request.getAttribute("segunda3disc")%></td>
                        <td><%=(String) request.getAttribute("terca3prof")%></td>
                        <td><%=(String) request.getAttribute("terca3disc")%></td>
                        <td><%=(String) request.getAttribute("quarta3prof")%></td>
                        <td><%=(String) request.getAttribute("quarta3disc")%></td>
                        <td><%=(String) request.getAttribute("quinta3prof")%></td>
                        <td><%=(String) request.getAttribute("quinta3disc")%></td>
                        <td><%=(String) request.getAttribute("sexta3prof")%></td>
                        <td><%=(String) request.getAttribute("sexta3disc")%></td>
                    </tr>
                    <tr>
                        <td><b>10:05h 11:00h</b></td>
                        <td><%=(String) request.getAttribute("segunda4prof")%></td>
                        <td><%=(String) request.getAttribute("segunda4disc")%></td>
                        <td><%=(String) request.getAttribute("terca4prof")%></td>
                        <td><%=(String) request.getAttribute("terca4disc")%></td>
                        <td><%=(String) request.getAttribute("quarta4prof")%></td>
                        <td><%=(String) request.getAttribute("quarta4disc")%></td>
                        <td><%=(String) request.getAttribute("quinta4prof")%></td>
                        <td><%=(String) request.getAttribute("quinta4disc")%></td>
                        <td><%=(String) request.getAttribute("sexta4prof")%></td>
                        <td><%=(String) request.getAttribute("sexta4disc")%></td>
                    </tr>
                    </tbody>
            </table>
        </div>
    </div>
</div>
<%}%>

<tag:close_coluna/>

<tag:conteudoFim/>

<%if (session.getAttribute("olho_servlet_horario") == null) { //condição para verificar se a tela já passou por alguma servlet%>
<tag:footer ano="2017" versao="1.0" caminho="../resources" desenvolvedores="Tarcísio R. Júnior"/>
<%} else{%>
<tag:footer ano="2017" versao="1.0" caminho="<%=(String) session.getAttribute("caminho_servlet")%>" desenvolvedores="Tarcísio R. Júnior"/>
<%session.setAttribute("olho_servlet_horario", null);%>
<%}%>
