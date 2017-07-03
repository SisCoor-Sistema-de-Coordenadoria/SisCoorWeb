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
<tag:header paramVolta="../../SisCoorWeb" title="SisCoor | Módulo Hr. de Aula" caminho="../resources" titlePage="Módulo Horário de Aulas" horarioAtivo="active"/>
<%} else{%>
<tag:header paramVolta="<%=(String) session.getAttribute("param_volta_servlet")%>" title="SisCoor | Módulo Hr. de Aula" caminho="<%=(String) session.getAttribute("caminho_servlet")%>" titlePage="Módulo Horário de Aulas" horarioAtivo="active"/>
<%}%>
<tag:conteudoInicio/>

<tag:open_coluna tamanho="12"/>

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
                                                    <select name="segunda1prof" class="col-md-12 form-control">
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

<tag:close_coluna/>

<tag:conteudoFim/>

<%if (session.getAttribute("olho_servlet_horario") == null) { //condição para verificar se a tela já passou por alguma servlet%>
<tag:footer ano="2017" versao="1.0" caminho="../resources" desenvolvedores="Tarcísio R. Júnior"/>
<%} else{%>
<tag:footer ano="2017" versao="1.0" caminho="<%=(String) session.getAttribute("caminho_servlet")%>" desenvolvedores="Tarcísio R. Júnior"/>
<%session.setAttribute("olho_servlet_horario", null);%>
<%}%>
