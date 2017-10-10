<%-- 
    Document   : quadro_de_defesa
    Created on : 01/07/2017, 12:08:53
    Author     : Naiane
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.DefesaTC"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/"%>
<tag:header defesaAtivo="active" usuario="<%=(String)session.getAttribute("nomeUsuario")%>" caminho="../resources" paramVolta="../../SisCoorWeb" title="SisCoor | Defesa de TC" titlePage="Defesa de Trabalho de Curso" usuario="<%=(String) session.getAttribute("nomeUsuario")%>"/>

<!-- Escondendo Mensagem Danger-->
<script language="JavaScript">
    function fecha_banner_danger()
    {
        var banner_obj = document.getElementById('alert_danger');
        banner_obj.style.display = 'none';
    }
    setTimeout('fecha_banner_danger()', 5000000);
</script>
<!-- Fim do JavaScript -->

<tag:conteudoInicio/>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:open_coluna tamanho="8"/>

<% if (session.getAttribute("msg") != null) {
        String tipo_msg = String.valueOf(session.getAttribute("tipo_msg"));
        if (tipo_msg.equals("danger")) {%>
<div id="alert_danger" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%></strong>
</div>
<%session.setAttribute("msg", null);
    session.setAttribute("tipo_msg", null);
} else if (tipo_msg.equals("success")) {%>
<div id="alert" class="alert alert-<%=session.getAttribute("tipo_msg")%> col-lg-12" role="alert" ng-hide="delay_scroll."
     style="text-align: center">
    <strong><%= session.getAttribute("msg")%>
    </strong>
</div>
<%session.setAttribute("msg", null);
            session.setAttribute("tipo_msg", null);
        }
    } else {
        session.setAttribute("msg", null);
        session.setAttribute("tipo_msg", null);
    }%>

<!-- Inicializando Lista de Trabalhos -->
<% ArrayList<DefesaTC> lista = new ArrayList();%>
<% lista = (ArrayList<DefesaTC>) request.getAttribute("lista");%>
    
    <div class="panel panel-green" onpageshow="center">
    <div class="panel-heading">
        Defesas Agendadas
    </div>
    <div class="panel-body pan">
        <div class="col-lg-6">
              <table class="table table-hover">
               <%if(lista==null){%>
               <strong>Obs.: Não há defesas agendadas até o momento</strong>
                  <%}else{%>     
                  <thead>
                      <tr>
                          <th>Alunos</th>
                          <th>Título</th>
                          <th>Banca</th>
                          <th>Data/Horário/Local da Defesa</th>
                          <th>Opções</th>
                      </tr>
                  </thead>
                  <tbody>
                      <%for (int i = 0; i < lista.size(); i++) {%>
                      <tr>
                          <td>
                              <b>
                                  <%=lista.get(i).getProposta().getAluno1().getNome() + " e "%>
                                  <%if (lista.get(i).getProposta().getAluno2() != null) {%>
                                  <%=lista.get(i).getProposta().getAluno2().getNome()%>
                                  <% }%>
                              </b>
                          </td>
                          <td><%=lista.get(i).getProposta().getTituloPTC()%></td>
                          <td>
                              <%for (int j = 0; j < 3; j++) {%>
                              <%=lista.get(i).getBanca().getLista().get(i).getNome()%>
                              <%if (lista.get(i).getBanca().getLista().get(i).getNome().equals(lista.get(i).getProposta().getOrientador().getNome())) {%>
                              <%=" Orientador(a)"%>
                              <%}%>
                              <br>
                              <%}%>

                          </td>
                          <td><%="" + lista.get(i).getData() + " às " + lista.get(i).getHorario() + "hrs no " + lista.get(i).getLocal()%></td>
                          <td></td>
                      </tr>
                      <%}}%>
                  </tbody>
              </table>
                  
        </div>
                  <form method="POST" action="../DefesaTCServlet">
                      <input type="submit" name="botao" value="Exportar como PDF"/>
                  </form>
    </div>
    </div>
</div>
</div>
<tag:close_coluna/>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Naiane" versao="1.0"/>