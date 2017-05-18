<%-- 
    Document   : pre_visualizar
    Created on : 21/04/2017, 18:00:00
    Author     : Tarcisio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisCoor - Horário de Aula</title>
    </head>
    <body>
        <center>
            <table border="1">
                <tr>
                    <td colspan="11">
                        <center><b>Horário de Aulas Matutino</b></center>
                    </td>
                </tr>
                <tr>
                    <td rowspan = "2"><b>Horário</b></td>
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
                    <td><b>07:00h - 07:55h</b></td>
                    <td><%=(String)request.getAttribute("segunda1prof")%></td>
                    <td><%=(String)request.getAttribute("segunda1disc")%></td>
                    <td><%=(String)request.getAttribute("terca1prof")%></td>
                    <td><%=(String)request.getAttribute("terca1disc")%></td>
                    <td><%=(String)request.getAttribute("quarta1prof")%></td>
                    <td><%=(String)request.getAttribute("quarta1disc")%></td>
                    <td><%=(String)request.getAttribute("quinta1prof")%></td>
                    <td><%=(String)request.getAttribute("quinta1disc")%></td>
                    <td><%=(String)request.getAttribute("sexta1prof")%></td>
                    <td><%=(String)request.getAttribute("sexta1disc")%></td>
                </tr>
                <tr>
                    <td><b>07:55h - 08:50h</b></td>
                    <td><%=(String)request.getAttribute("segunda2prof")%></td>
                    <td><%=(String)request.getAttribute("segunda2disc")%></td>
                    <td><%=(String)request.getAttribute("terca2prof")%></td>
                    <td><%=(String)request.getAttribute("terca2disc")%></td>
                    <td><%=(String)request.getAttribute("quarta2prof")%></td>
                    <td><%=(String)request.getAttribute("quarta2disc")%></td>
                    <td><%=(String)request.getAttribute("quinta2prof")%></td>
                    <td><%=(String)request.getAttribute("quinta2disc")%></td>
                    <td><%=(String)request.getAttribute("sexta2prof")%></td>
                    <td><%=(String)request.getAttribute("sexta2disc")%></td>
                </tr>
                <tr>
                    <td><b>09:10h - 10:05h</b></td>
                    <td><%=(String)request.getAttribute("segunda3prof")%></td>
                    <td><%=(String)request.getAttribute("segunda3disc")%></td>
                    <td><%=(String)request.getAttribute("terca3prof")%></td>
                    <td><%=(String)request.getAttribute("terca3disc")%></td>
                    <td><%=(String)request.getAttribute("quarta3prof")%></td>
                    <td><%=(String)request.getAttribute("quarta3disc")%></td>
                    <td><%=(String)request.getAttribute("quinta3prof")%></td>
                    <td><%=(String)request.getAttribute("quinta3disc")%></td>
                    <td><%=(String)request.getAttribute("sexta3prof")%></td>
                    <td><%=(String)request.getAttribute("sexta3disc")%></td>
                </tr>
                <tr>
                    <td><b>10:05h - 11:00h</b></td>
                    <td><%=(String)request.getAttribute("segunda4prof")%></td>
                    <td><%=(String)request.getAttribute("segunda4disc")%></td>
                    <td><%=(String)request.getAttribute("terca4prof")%></td>
                    <td><%=(String)request.getAttribute("terca4disc")%></td>
                    <td><%=(String)request.getAttribute("quarta4prof")%></td>
                    <td><%=(String)request.getAttribute("quarta4disc")%></td>
                    <td><%=(String)request.getAttribute("quinta4prof")%></td>
                    <td><%=(String)request.getAttribute("quinta4disc")%></td>
                    <td><%=(String)request.getAttribute("sexta4prof")%></td>
                    <td><%=(String)request.getAttribute("sexta4disc")%></td>
                </tr>
            </table>
        </center>
    </body>
</html>
