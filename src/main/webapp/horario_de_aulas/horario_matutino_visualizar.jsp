<%-- 
    Document   : horario_matutino_visualizar
    Created on : 28/05/2017, 19:13:40
    Author     : Tarcisio
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header paramVolta="../../SisCoorWeb" title="SisCoor | Módulo Hr. de Aula" caminho="../resources" titlePage="Módulo Horário de Aulas" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" horarioAtivo="active"/>

<tag:conteudoInicio/>

<tag:open_coluna tamanho="12"/>

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
                                <tr>
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
                </div>
            </div>
        </div>


        <tag:close_coluna/>

        <tag:conteudoFim/>

        <tag:footer ano="2017" versao="1.0" caminho="../resources" desenvolvedores="Tarcísio R. Júnior"/>