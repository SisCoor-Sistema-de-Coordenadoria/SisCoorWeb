<%-- 
    Document   : listar_servidor
    Created on : 09/06/2017, 18:03:01
    Author     : Diego
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>

<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="Módulo | Gerenciar Conteúdo | Lista de Servidores" title="SisCoor | Gerenciar Conteúdo | Lista de Servidores" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%ServidorDao servidorDAO = new ServidorDao();
ArrayList<Servidor> listaServidor = new ArrayList<Servidor>();
listaServidor=servidorDAO.getLista();

if(listaServidor.isEmpty())
{
    session.setAttribute("msg", "Nenhum servidor cadastrado no momento.");
    session.setAttribute("tipo_msg", "danger");
}
%>

<% if (session.getAttribute("msg") != null) {
        String tipo_msg = String.valueOf(session.getAttribute("tipo_msg"));
        if (tipo_msg.equals("danger")) {%>
<div id="alert_danger" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%session.setAttribute("msg", null);
    session.setAttribute("tipo_msg", null);
}}else{%>

<tag:open_coluna tamanho="12"/>
    <div class="panel panel-grey">
        <div class="panel-heading">Lista de Servidores</div>
        <div class="panel-body">
            <table class="table table-hover table-bordered">
                <thead>
                <tr>
                    <th>Código</th>
                    <th>Siape</th>
                    <th>Nome</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Data de Nascimento</th>
                </tr>
                </thead>
                    <tbody>
                    <%
                    for(int i=0;i<listaServidor.size();i++)
                    {
                        Servidor servidor = new Servidor();
                        servidor=listaServidor.get(i);
                    %>    
                        <tr>
                            <td class="active"><%=servidor.getIdServidor()%></td>                           
                            <td class="active"><%=servidor.getSiape()%></td>
                            <td class="active"><%=servidor.getNome()%></td>
                            <td class="active"><%=servidor.getEmail()%></td>
                            <td class="active"><%=servidor.getTelefone()%></td>
                            <td class="active"><%=servidor.getDataNascimento()%></td>
                        </tr>                       
                    <%}%>
                    </tbody>
            </table>
        </div>
    </div>

<tag:close_coluna/>

<%}%>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>