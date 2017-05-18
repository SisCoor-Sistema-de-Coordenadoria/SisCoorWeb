<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisCoor - Uso de Laboratorio</title>
    </head>
    <body>
        <center>
            <table border="1">
                <tr>
                    <td colspan="11">
                        <center><b>Uso de Laboratorio-Horarios</b></center>
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
                    <td><b>Laboratório</b></td>
                    <td><b>Professor</b></td>
                    <td><b>Laboratório</b></td>
                    <td><b>Professor</b></td>
                    <td><b>Laboratório</b></td>
                    <td><b>Professor</b></td>
                    <td><b>Laboratório</b></td>
                    <td><b>Professor</b></td>
                    <td><b>Laboratório</b></td>
                </tr>
                <tr>
                    <td><b>07:00h - 07:55h</b></td>
                    <td><%=(String)request.getAttribute("segunda1prof")%></td>
                    <td><%=(String)request.getAttribute("segunda1lab")%></td>
                    <td><%=(String)request.getAttribute("terca1prof")%></td>
                    <td><%=(String)request.getAttribute("terca1lab")%></td>
                    <td><%=(String)request.getAttribute("quarta1prof")%></td>
                    <td><%=(String)request.getAttribute("quarta1lab")%></td>
                    <td><%=(String)request.getAttribute("quinta1prof")%></td>
                    <td><%=(String)request.getAttribute("quinta1lab")%></td>
                    <td><%=(String)request.getAttribute("sexta1prof")%></td>
                    <td><%=(String)request.getAttribute("sexta1lab")%></td>
                </tr>
                <tr>
                    <td><b>07:55h - 08:50h</b></td>
                    <td><%=(String)request.getAttribute("segunda2prof")%></td>
                    <td><%=(String)request.getAttribute("segunda2lab")%></td>
                    <td><%=(String)request.getAttribute("terca2prof")%></td>
                    <td><%=(String)request.getAttribute("terca2lab")%></td>
                    <td><%=(String)request.getAttribute("quarta2prof")%></td>
                    <td><%=(String)request.getAttribute("quarta2lab")%></td>
                    <td><%=(String)request.getAttribute("quinta2prof")%></td>
                    <td><%=(String)request.getAttribute("quinta2lab")%></td>
                    <td><%=(String)request.getAttribute("sexta2prof")%></td>
                    <td><%=(String)request.getAttribute("sexta2lab")%></td>
                </tr>
                <tr>
                    <td><b>09:10h - 10:05h</b></td>
                    <td><%=(String)request.getAttribute("segunda3prof")%></td>
                    <td><%=(String)request.getAttribute("segunda3lab")%></td>
                    <td><%=(String)request.getAttribute("terca3prof")%></td>
                    <td><%=(String)request.getAttribute("terca3lab")%></td>
                    <td><%=(String)request.getAttribute("quarta3prof")%></td>
                    <td><%=(String)request.getAttribute("quarta3lab")%></td>
                    <td><%=(String)request.getAttribute("quinta3prof")%></td>
                    <td><%=(String)request.getAttribute("quinta3lab")%></td>
                    <td><%=(String)request.getAttribute("sexta3prof")%></td>
                    <td><%=(String)request.getAttribute("sexta3lab")%></td>
                </tr>
                <tr>
                    <td><b>10:05h - 11:00h</b></td>
                    <td><%=(String)request.getAttribute("segunda4prof")%></td>
                    <td><%=(String)request.getAttribute("segunda4lab")%></td>
                    <td><%=(String)request.getAttribute("terca4prof")%></td>
                    <td><%=(String)request.getAttribute("terca4lab")%></td>
                    <td><%=(String)request.getAttribute("quarta4prof")%></td>
                    <td><%=(String)request.getAttribute("quarta4lab")%></td>
                    <td><%=(String)request.getAttribute("quinta4prof")%></td>
                    <td><%=(String)request.getAttribute("quinta4lab")%></td>
                    <td><%=(String)request.getAttribute("sexta4prof")%></td>
                    <td><%=(String)request.getAttribute("sexta4lab")%></td>
                </tr>
            </table>
        </center>
    </body>
</html>
