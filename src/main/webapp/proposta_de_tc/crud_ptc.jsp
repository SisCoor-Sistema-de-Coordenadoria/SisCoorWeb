<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho"%>

<!-- Escondendo Mensagem Sucess-->
<script language="JavaScript">
    function fecha_banner()
    {
    var banner_obj = document.getElementById('alert');
    banner_obj.style.display = 'none';
    }
    setTimeout('fecha_banner()', 5000);</script>
<!-- Fim do JavaScript -->

<!-- Escondendo Mensagem Danger-->
<script language="JavaScript">
    function fecha_banner_danger()
    {
    var banner_obj = document.getElementById('alert_danger');
    banner_obj.style.display = 'none';
    }
    setTimeout('fecha_banner_danger()', 5000000);</script>
<!-- Fim do JavaScript -->

<!---- ATEN��O | ATEN��O | ATEN��O | ATEN��O | ATEN��O | ATEN��O | ATEN��O -----
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
P�gina com menu padr�o para jsp dentro de pastas.
--------------------------------------------------------------------------------
Para utiliza-la � s� COPIAR para dentro da pasta do
seu m�dulo e mudar o nome da jsp.
--------------------------------------------------------------------------------
COPIE n�o RECORTE
Seu coleguinha pode precisar da mesma p�gina n�o
modifique-a.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------->

<!--Importando as tags criadas para o aux�lio do Front-End -->
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>

<!--Usando as tags criadas para o aux�lio do Front-End -->

<!---------- ATEN��O | VARI�VEIS OBRIGAT�RIAS PARA O HEADER | ATEN��O ----------
--------------------------------------------------------------------------------
caminho -> Caminho para as importa��es do css, js, fontes e outros, padr�o para
ser usado em p�ginas jsp dentro de pastas � '../resources'.
--------------------------------------------------------------------------------
paramVolta -> Parametro de caminho para as chamadas dos menus laterais e de
sa�da da pasta atual.
--------------------------------------------------------------------------------
titulo -> T�tulo que vai na aba da p�gina aberta, como padr�o para cada p�gina
adotamos 'SisCoor | Nome do M�dulo'.
--------------------------------------------------------------------------------
tituloPage -> T�tulo que vai na p�gina, como padr�o para cada p�gina adotamos 
'M�dulo | Nome do M�dulo'.
--------------------------------------------------------------------------------
usuario -> Nome do usu�rio que deve ser pego pela sess�o assim que o usu�rio
fizer o login atrav�s de uma sess�o. Utilize scriplets para fazer isso.
usuario='abre scriplet=(String)session.getAttribute('nomeDoAtributoNomeUsuario')
fecha scriplet>'
------------------------------------------------------------------------------->

<tag:header caminho="../resources" 
            paramVolta="../../SisCoorWeb" 
            title="SisCoor | M�dulo PTC"
            titlePage="M�dulo | Proposta de Trabalho de Curso"/>


<!------------ ATEN��O | ABERTURA DA ENTRADA DE CONTE�DO | ATEN��O -------------
--------------------------------------------------------------------------------
Todo o Conte�do fica entre as tags de 'conteudoInicio' e 'conteudoFim'.
N�o coloque fora disso.
------------------------------------------------------------------------------->

<!--In�cio do Conteudo-->
<tag:conteudoInicio />
<%
    PropostaDAO proposta = new PropostaDAO();
    ArrayList<PropostaTrabalho> lista_trabalho = proposta.getLista();
%>
<!------------ ATEN��O | TODO CONTE�DO DA P�GINA VEM AQUI | ATEN��O ------------
AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI 
------------------------------------------------------------------------------->
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

<tag:open_coluna tamanho="12"/>
<%if (lista_trabalho.isEmpty()) {%>
<form method="POST" action="../PTCServlet">
    <div class="col-md-12">
        <div class="note note-info">
            <h4 class="box-heading">Ops! N�o h� nada a ser visto aqui.</h4>
            <p>Parece que voc� ainda n�o submeteu nenhum trabalho.<br>
                Fa�a uma submiss�o e volte, assim teremos algo a lhe mostrar.</p>
        </div>
        <div class="col-lg-12">
            <div class="col-lg-12" style="text-align: right">
                <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn"/>
            </div>
        </div>
    </div>
</form>
<%} else {%>
<div class="panel panel-grey">
    <div class="panel-heading">Propostas Submetidas</div>
    <div class="panel-body">
        <form action="../PTCServlet" method="POST">
            <table class="table table-responsive table-hover-color">
                <thead>
                    <tr>
                        <th style="text-align: center">ID</th>
                        <th class="hidden">VALOR REAL</th>
                        <th style="text-align: center">T�tulo</th>
                        <th style="text-align: center">Aluno 01</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Aluno 02</th>
                        <th style="text-align: center">Orientador</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Coorientador</th>
                        <th style="text-align: center">Op��es</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Reduz o nome no campo 
                    style="max-width: 20ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
                    --%>
                    <% for (int i = 0; i < lista_trabalho.size(); i++) {%>
                    <tr>
                        <td><%= i + 1%></td>
                        <td class="hidden"><%= lista_trabalho.get(i).getIdProposta() %></td>
                        <td>
                            <tooltip data-toggle="tooltip" title="<%= lista_trabalho.get(i).getTituloPTC()%>">
                                <% if(lista_trabalho.get(i).getTituloPTC().length() > 25){%>
                                    <%= lista_trabalho.get(i).getTituloPTC().substring(0, 25) %>...
                                <%}else{%>
                                    <%= lista_trabalho.get(i).getTituloPTC() %>
                                <%}%>
                            </tooltip>
                        </td>

                <%--Tooltip Script--%>
                <%-- 
                Colocar dentro da tag que se quer usar o tooltip:
                
                data-toggle = "tooltip"
                title = "Texto a ser apresentado"
                data-placement = "top" || "right" || "left" || "bottom"
                
                --%> 
                <script>
                    $(document).ready(function(){
                    $('[data-toggle="tooltip"]').tooltip();
                    });
                </script>
                <%--Tooltip Script--%>
                <td><%= lista_trabalho.get(i).getAluno1().getNome()%></td>
                <td class="hidden-xs hidden-sm"><%= lista_trabalho.get(i).getAluno2().getNome()%></td>
                <td><%= lista_trabalho.get(i).getOrientador().getNome()%></td>
                <td class="hidden-xs hidden-sm"><%= lista_trabalho.get(i).getCoorientador().getNome()%></td>
                <td>
                    <div class="todo-actions" style="text-align: center">
                        <div class="col-md-4 col-sm-2">
                            <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(0,0,0,0)" 
                                    value="download_<%= lista_trabalho.get(i).getIdProposta()%>" name="btn"
                                    data-toggle="tooltip" title="Download">  
                                <i class="fa fa-download" style="color: darkcyan"></i>
                            </button>
                        </div>
                        <div class="col-md-4 col-sm-2">
                            <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(0,0,0,0)" 
                                    value="excluir_<%= lista_trabalho.get(i).getIdProposta()%>" name="btn"
                                    data-toggle="tooltip" title="Editar">  
                                <i class="fa fa-edit" style="color: darkgreen"></i>
                            </button>
                        </div>
                        <div class="col-md-4 col-sm-2">
                            <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(0,0,0,0)"
                                    value="excluir_<%= lista_trabalho.get(i).getIdProposta()%>" name="btn"
                                    data-toggle="tooltip" title="Excluir">  
                                <i class="fa fa-trash-o" style="color: red"></i>
                            </button>
                        </div>                               
                    </div>
                </td>
                </tr>                
                <%}%>
                </tbody>
            </table>
            <div class="col-lg-12">
                <div class="col-lg-12" style="text-align: right">
                    <input id="btn" type="submit" class="btn btn-blue" value="Voltar" name="btn"/>
                </div>
            </div>
        </form>
    </div>
</div>
<%}%>
<tag:close_coluna/>

<tag:conteudoFim />


<!---------- ATEN��O | VARI�VEIS OBRIGAT�RIAS PARA O FOOTER | ATEN��O ----------
--------------------------------------------------------------------------------
ano -> Ano da cria��o do sistema
--------------------------------------------------------------------------------
caminho -> Caminho para as importa��es do css, js, fontes e outros, padr�o para
ser usado em p�ginas jsp dentro de pastas � '../resources'.
--------------------------------------------------------------------------------
desenvolvedores -> Nome dos desenvolvedores do m�dulo, separe por v�rgula quando
houver mais de um desenvolvedor.
--------------------------------------------------------------------------------
vers�o -> Vers�o do m�dulo do Sistema em desenvolvimento.
------------------------------------------------------------------------------->
<tag:footer ano="2017"
            caminho="../resources"
            desenvolvedores="Jehymison Gil Alves Oliveira"
            versao="1.0" />
<!--------------------- ATEN��O | FIM DA P�GINA | ATEN��O ----------------------
--------------------------------------------------------------------------------
