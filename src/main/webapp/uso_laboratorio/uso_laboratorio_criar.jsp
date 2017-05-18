<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Laboratorio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SisCoor - Uso de Laboratorios</title>
    </head>
    
        <%String aux;%>
        <%Servidor[] professores = {new Servidor("Gabriel"), new Servidor("Monica"), new Servidor("Patrícia"), new Servidor("Paulo")};%>
        <%Laboratorio[] labs = {new Laboratorio(1),new Laboratorio(2),new Laboratorio(3),new Laboratorio(4), new Laboratorio(5),new Laboratorio(6), new Laboratorio(7),new Laboratorio(8)};%>
        
        <h3>Preencha os dados abaixo:</h3>
        <form method="post" action="../UsoLabServlet">
            <h4>Segunda-Feira:</h4>
            07:00h - 07:55h -> Professor:<select name="segunda1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="segunda1lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="segunda2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="segunda2lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="segunda3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="segunda3lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="segunda4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="segunda4lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>



            <h4>Terça-Feira:</h4>



            07:00h - 07:55h -> Professor:<select name="terca1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="terca1lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="terca2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="terca2lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="terca3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="terca3lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="terca4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="terca4lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            
            
            
            <h4>Quarta-Feira:</h4>
            
            
            
            07:00h - 07:55h -> Professor:<select name="quarta1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quarta1lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="quarta2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quarta2lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="quarta3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quarta3lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="quarta4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quarta4lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            
            
            
            <h4>Quinta-Feira:</h4>
            
            
            
            07:00h - 07:55h -> Professor:<select name="quinta1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quinta1lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="quinta2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quinta2lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="quinta3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quinta3lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="quinta4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="quinta4lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            
            
            
            <h4>Sexta-Feira:</h4>
            
            
            
            07:00h - 07:55h -> Professor:<select name="sexta1prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="sexta1lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            07:55h - 08:50h -> Professor:<select name="sexta2prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="sexta2lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            09:10h - 10:05h -> Professor:<select name="sexta3prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="sexta3lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            10:05h - 11:00h -> Professor:<select name="sexta4prof">
                <option>Em branco</option>
                <%for (int i = 0; i < professores.length; i++) {%>
                <option><%= professores[i].getNome()%></option>
                <% } %>
            </select>
            Laboratorio: <select name="sexta4lab">
                <option>Em branco</option>
                <%for (int i = 0; i < labs.length; i++) {%>
                <option><%= labs[i].getCod()%></option>
                <% }%>
            </select><br>
            <p><input type="submit" value="Pré-Visualizar"></p>
        </form>
    

