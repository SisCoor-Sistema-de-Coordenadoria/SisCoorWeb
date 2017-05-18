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
        <title>SisCoor - Horário de Aulas</title>
    </head>
    <body>
        <%String aux;%>
        <%Servidor[] professores = {new Servidor("Gabriel"), new Servidor("Monica"), new Servidor("Patrícia"), new Servidor("Paulo")};%>
        <%Disciplina[] discips = {new Disciplina("ProjOO"), new Disciplina("IHC"), new Disciplina("PADS"), new Disciplina("WebII"), new Disciplina("Topicos I")};%>
        <h3>Preencha os dados abaixo:</h3>
        <form method="post" action="../PreVisualizarServlet">
            <h4>Segunda-Feira:</h4>
            07:00h - 07:55h -> Professor:<select name="segunda1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="segunda1disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="segunda2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="segunda2disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="segunda3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="segunda3disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="segunda4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="segunda4disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>



            <h4>Terça-Feira:</h4>



            07:00h - 07:55h -> Professor:<select name="terca1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="terca1disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="terca2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="terca2disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="terca3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="terca3disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="terca4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="terca4disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            
            
            
            <h4>Quarta-Feira:</h4>
            
            
            
            07:00h - 07:55h -> Professor:<select name="quarta1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quarta1disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="quarta2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quarta2disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="quarta3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quarta3disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="quarta4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quarta4disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            
            
            
            <h4>Quinta-Feira:</h4>
            
            
            
            07:00h - 07:55h -> Professor:<select name="quinta1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quinta1disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="quinta2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quinta2disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="quinta3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quinta3disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="quinta4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="quinta4disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            
            
            
            <h4>Sexta-Feira:</h4>
            
            
            
            07:00h - 07:55h -> Professor:<select name="sexta1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="sexta1disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="sexta2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="sexta2disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="sexta3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="sexta3disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="sexta4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Disciplina: <select name="sexta4disc">
                <option>Em branco</option>
                <%for (int i = 0; i < discips.length; i++) {%>
                <option><%= discips[i].getNome()%></option>
                <% }%>
            </select><br>
            <p><input type="submit" value="Pré-Visualizar"></p>
        </form>
    </body>
</html>
