<%-- 
    Document   : criar_horario_matutino
    Created on : 22/04/2017, 16:59:39
    Author     : Tarcisio
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Disciplina"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisCoor - Horário de Aula</title>
    </head>
    <body>
        <%String aux;%>
        <%Servidor[] professores = {new Servidor("Gabriel"), new Servidor("Monica"), new Servidor("Patrícia"), new Servidor("Paulo")};%>
        <%Disciplina[] discips = {new Disciplina("ProjOO"), new Disciplina("IHC"), new Disciplina("PADS"), new Disciplina("WebII"), new Disciplina("Topicos I")};%>
    <center>
        <form method="post" action="../PreVisualizarServlet">
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
                    <td>
                        <select name="segunda1prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <%}%>
                        </select>
                    </td>
                    <td><select name="segunda1disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca1prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca1disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta1prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta1disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta1prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta1disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta1prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta1disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td><b>07:55h - 08:50h</b></td>
                    <td>
                        <select name="segunda2prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td><select name="segunda2disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca2prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca2disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta2prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta2disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta2prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta2disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta2prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta2disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b>09:10h - 10:05h</b></td>
                    <td>
                        <select name="segunda3prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td><select name="segunda3disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca3prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca3disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta3prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta3disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta3prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta3disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta3prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta3disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><b>10:05h - 11:00h</b></td>
                    <td>
                        <select name="segunda4prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td><select name="segunda4disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca4prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="terca4disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta4prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quarta4disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta4prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="quinta4disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta4prof">
                            <option>Em branco</option>
                            <%for (int i = 0; i < professores.length; i++) {%>
                            <option><%= professores[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                    <td>
                        <select name="sexta4disc">
                            <option>Em branco</option>
                            <%for (int i = 0; i < discips.length; i++) {%>
                            <option><%= discips[i].getNome()%></option>
                            <% }%>
                        </select>
                    </td>
                </tr>
            </table><br><br>
                <input type="submit" value="Salvar Informações" name="botao_criar_horario">        
        </form>
    </center>

</body>
</html>
