<%-- 
    Document   : horario_integral_mat_ves
    Created on : 28/05/2017, 12:32:26
    Author     : Tarcisio
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<%String aux;%>
<%Servidor[] professores = {new Servidor("Gabriel Vieira"), new Servidor("Monica Sakuray"), new Servidor("Patr�cia Miziara"), new Servidor("Paulo Mansur")};%>
<%Disciplina[] discips = {new Disciplina("ProjOO"), new Disciplina("IHC"), new Disciplina("PADS"), new Disciplina("WebII"), new Disciplina("Topicos I")};%>

<%if (session.getAttribute("olho_servlet_horario") == null) { //condi��o para verificar se a tela j� passou por alguma servlet%>
<tag:header paramVolta="../../SisCoorWeb" title="SisCoor | M�dulo Hr. de Aula" caminho="../resources" titlePage="M�dulo Hor�rio de Aulas" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" horarioAtivo="active"/>
<%} else{%>
<tag:header paramVolta="<%=(String) session.getAttribute("param_volta_servlet")%>" title="SisCoor | M�dulo Hr. de Aula" caminho="<%=(String) session.getAttribute("caminho_servlet")%>" titlePage="M�dulo Hor�rio de Aulas" usuario="Tarc�sio R. J�nior" horarioAtivo="active"/>
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
                <li><a href="#terca-tab" data-toggle="tab">Ter�a-Feira</a></li>
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
                                                <td style="width: 20px"><b>Hor�rio</b></td>
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

                                            <tr>
                                                <td><b>13:00h 13:55h</b></td>
                                                <td>
                                                    <select name="segunda5prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda5disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>13:55h 14:50h</b></td>
                                                <td>
                                                    <select name="segunda6prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda6disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>15:10h 16:05h</b></td>
                                                <td>
                                                    <select name="segunda7prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda7disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>16:05h 17:00h</b></td>
                                                <td>
                                                    <select name="segunda8prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="segunda8disc" class="col-md-12">
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
                            <div class="panel panel-green">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Hor�rio</b></td>
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
                                            
                                            <tr>
                                                <td><b>13:00h 13:55h</b></td>
                                                <td>
                                                    <select name="terca5prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca5disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>13:55h 14:50h</b></td>
                                                <td>
                                                    <select name="terca6prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca6disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>15:10h 16:05h</b></td>
                                                <td>
                                                    <select name="terca7prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca7disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>16:05h 17:00h</b></td>
                                                <td>
                                                    <select name="terca8prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="terca8disc" class="col-md-12">
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
                            <div class="panel panel-green">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Hor�rio</b></td>
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
                                            
                                            <tr>
                                                <td style="width: 20px"><b>Hor�rio</b></td>
                                                <td><b>Professor</b></td>
                                                <td><b>Disciplina</b></td>
                                            </tr>

                                            <tr>
                                                <td><b>13:00h 13:55h</b></td>
                                                <td>
                                                    <select name="quarta5prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta5disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>13:55h 14:50h</b></td>
                                                <td>
                                                    <select name="quarta6prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta6disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>15:10h 16:05h</b></td>
                                                <td>
                                                    <select name="quarta7prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta7disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>16:05h 17:00h</b></td>
                                                <td>
                                                    <select name="quarta8prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quarta8disc" class="col-md-12">
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
                            <div class="panel panel-green">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Hor�rio</b></td>
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
                                            
                                            <tr>
                                                <td><b>13:00h 13:55h</b></td>
                                                <td>
                                                    <select name="quinta5prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta5disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>13:55h 14:50h</b></td>
                                                <td>
                                                    <select name="quinta6prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta6disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>15:10h 16:05h</b></td>
                                                <td>
                                                    <select name="quinta7prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta7disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>16:05h 17:00h</b></td>
                                                <td>
                                                    <select name="quinta8prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="quinta8disc" class="col-md-12">
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
                            <div class="panel panel-green">
                                <div class="panel-body">
                                    <table class="table table-hover table-bordered">
                                        <thead>
                                            <tr>
                                                <td style="width: 20px"><b>Hor�rio</b></td>
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
                                            
                                            <tr>
                                                <td><b>13:00h 13:55h</b></td>
                                                <td>
                                                    <select name="sexta5prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta5disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>13:55h 14:50h</b></td>
                                                <td>
                                                    <select name="sexta6prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta6disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>15:10h 16:05h</b></td>
                                                <td>
                                                    <select name="sexta7prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta7disc" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < discips.length; i++) {%>
                                                        <option><%= discips[i].getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td><b>16:05h 17:00h</b></td>
                                                <td>
                                                    <select name="sexta8prof" class="col-md-12">
                                                        <option>Em branco</option>
                                                        <%for (int i = 0; i < professores.length; i++) {%>
                                                        <option><%= professores[i].getNome()%></option>
                                                        <%}%>
                                                    </select>
                                                </td>
                                                <td><select name="sexta8disc" class="col-md-12">
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
                        <td rowspan = "2" style="width: 20px"><b>Hor�rio</b></td>
                        <td colspan = "2"><b>Segunda-Feira</b></td>
                        <td colspan = "2"><b>Ter�a-Feira</b></td>
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
                    <tr>
                        <td><b>13:00h 13:55h</b></td>
                        <td><%=(String) request.getAttribute("segunda5prof")%></td>
                        <td><%=(String) request.getAttribute("segunda5disc")%></td>
                        <td><%=(String) request.getAttribute("terca5prof")%></td>
                        <td><%=(String) request.getAttribute("terca5disc")%></td>
                        <td><%=(String) request.getAttribute("quarta5prof")%></td>
                        <td><%=(String) request.getAttribute("quarta5disc")%></td>
                        <td><%=(String) request.getAttribute("quinta5prof")%></td>
                        <td><%=(String) request.getAttribute("quinta5disc")%></td>
                        <td><%=(String) request.getAttribute("sexta5prof")%></td>
                        <td><%=(String) request.getAttribute("sexta5disc")%></td>
                    </tr>
                    <tr>
                        <td><b>13:55h 14:50h</b></td>
                        <td><%=(String) request.getAttribute("segunda6prof")%></td>
                        <td><%=(String) request.getAttribute("segunda6disc")%></td>
                        <td><%=(String) request.getAttribute("terca6prof")%></td>
                        <td><%=(String) request.getAttribute("terca6disc")%></td>
                        <td><%=(String) request.getAttribute("quarta6prof")%></td>
                        <td><%=(String) request.getAttribute("quarta6disc")%></td>
                        <td><%=(String) request.getAttribute("quinta6prof")%></td>
                        <td><%=(String) request.getAttribute("quinta6disc")%></td>
                        <td><%=(String) request.getAttribute("sexta6prof")%></td>
                        <td><%=(String) request.getAttribute("sexta6disc")%></td>
                    </tr>
                    <tr>
                        <td><b>15:10h 16:05h</b></td>
                        <td><%=(String) request.getAttribute("segunda7prof")%></td>
                        <td><%=(String) request.getAttribute("segunda7disc")%></td>
                        <td><%=(String) request.getAttribute("terca7prof")%></td>
                        <td><%=(String) request.getAttribute("terca7disc")%></td>
                        <td><%=(String) request.getAttribute("quarta7prof")%></td>
                        <td><%=(String) request.getAttribute("quarta7disc")%></td>
                        <td><%=(String) request.getAttribute("quinta7prof")%></td>
                        <td><%=(String) request.getAttribute("quinta7disc")%></td>
                        <td><%=(String) request.getAttribute("sexta7prof")%></td>
                        <td><%=(String) request.getAttribute("sexta7disc")%></td>
                    </tr>
                    
                    <tr>
                        <td><b>16:05h 17:00h</b></td>
                        <td><%=(String) request.getAttribute("segunda8prof")%></td>
                        <td><%=(String) request.getAttribute("segunda8disc")%></td>
                        <td><%=(String) request.getAttribute("terca8prof")%></td>
                        <td><%=(String) request.getAttribute("terca8disc")%></td>
                        <td><%=(String) request.getAttribute("quarta8prof")%></td>
                        <td><%=(String) request.getAttribute("quarta8disc")%></td>
                        <td><%=(String) request.getAttribute("quinta8prof")%></td>
                        <td><%=(String) request.getAttribute("quinta8disc")%></td>
                        <td><%=(String) request.getAttribute("sexta8prof")%></td>
                        <td><%=(String) request.getAttribute("sexta8disc")%></td>
                    </tr>
                    </tbody>
            </table>
        </div>
    </div>
</div>
<%}%>

<tag:close_coluna/>

<tag:conteudoFim/>

<%if (session.getAttribute("olho_servlet_horario") == null) { //condi��o para verificar se a tela j� passou por alguma servlet%>
<tag:footer ano="2017" versao="1.0" caminho="../resources" desenvolvedores="Tarc�sio R. J�nior"/>
<%} else{%>
<tag:footer ano="2017" versao="1.0" caminho="<%=(String) session.getAttribute("caminho_servlet")%>" desenvolvedores="Tarc�sio R. J�nior"/>
<%session.setAttribute("olho_servlet_horario", null);%>
<%}%>
