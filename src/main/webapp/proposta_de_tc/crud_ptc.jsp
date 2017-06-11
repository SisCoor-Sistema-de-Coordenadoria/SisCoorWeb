<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho"%>
<!---- ATENÇÃO | ATENÇÃO | ATENÇÃO | ATENÇÃO | ATENÇÃO | ATENÇÃO | ATENÇÃO -----
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
Página com menu padrão para jsp dentro de pastas.
--------------------------------------------------------------------------------
Para utiliza-la é só COPIAR para dentro da pasta do
seu módulo e mudar o nome da jsp.
--------------------------------------------------------------------------------
COPIE não RECORTE
Seu coleguinha pode precisar da mesma página não
modifique-a.
--------------------------------------------------------------------------------
------------------------------------------------------------------------------->

<!--Importando as tags criadas para o auxílio do Front-End -->
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag" %>

<!--Usando as tags criadas para o auxílio do Front-End -->

<!---------- ATENÇÃO | VARIÁVEIS OBRIGATÓRIAS PARA O HEADER | ATENÇÃO ----------
--------------------------------------------------------------------------------
caminho -> Caminho para as importações do css, js, fontes e outros, padrão para
ser usado em páginas jsp dentro de pastas é '../resources'.
--------------------------------------------------------------------------------
paramVolta -> Parametro de caminho para as chamadas dos menus laterais e de
saída da pasta atual.
--------------------------------------------------------------------------------
titulo -> Título que vai na aba da página aberta, como padrão para cada página
adotamos 'SisCoor | Nome do Módulo'.
--------------------------------------------------------------------------------
tituloPage -> Título que vai na página, como padrão para cada página adotamos 
'Módulo | Nome do Módulo'.
--------------------------------------------------------------------------------
usuario -> Nome do usuário que deve ser pego pela sessão assim que o usuário
fizer o login através de uma sessão. Utilize scriplets para fazer isso.
usuario='abre scriplet=(String)session.getAttribute('nomeDoAtributoNomeUsuario')
fecha scriplet>'
------------------------------------------------------------------------------->

<tag:header caminho="../resources" 
            paramVolta="../../SisCoorWeb" 
            title="SisCoor | Módulo PTC"
            titlePage="Módulo | Proposta de Trabalho de Curso"/>


<!------------ ATENÇÃO | ABERTURA DA ENTRADA DE CONTEÚDO | ATENÇÃO -------------
--------------------------------------------------------------------------------
Todo o Conteúdo fica entre as tags de 'conteudoInicio' e 'conteudoFim'.
Não coloque fora disso.
------------------------------------------------------------------------------->

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


<!--Início do Conteudo-->
<tag:conteudoInicio />
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

<%
    PropostaDAO proposta = new PropostaDAO();
    ArrayList<PropostaTrabalho> lista_trabalho = proposta.getLista();
%>
<!------------ ATENÇÃO | TODO CONTEÚDO DA PÁGINA VEM AQUI | ATENÇÃO ------------
AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI 
------------------------------------------------------------------------------->
<tag:open_coluna tamanho="12"/>
<div class="panel panel-grey">
    <div class="panel-heading">Propostas Submetidas</div>
    <div class="panel-body">
        <form action="../PTCServlet" method="POST">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th style="text-align: center">ID</th>
                        <th class="hidden">VALOR REAL</th>
                        <th style="text-align: center">Título</th>
                        <th style="text-align: center">Aluno 01</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Aluno 02</th>
                        <th style="text-align: center">Orientador</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Coorientador</th>
                        <th style="text-align: center">Opções</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista_trabalho.size(); i++) {%>
                    <tr>
                        <td><%= i + 1%></td>
                        <td class="hidden"><%= lista_trabalho.get(i).getIdProposta()%></td>
                        <td><%= lista_trabalho.get(i).getTituloPTC()%></td>
                        <td><%= lista_trabalho.get(i).getAluno1().getNome()%></td>
                        <td class="hidden-xs hidden-sm"><%= lista_trabalho.get(i).getAluno2().getNome()%></td>
                        <td><%= lista_trabalho.get(i).getOrientador().getNome()%></td>
                        <td class="hidden-xs hidden-sm"><%= lista_trabalho.get(i).getCoorientador().getNome()%></td>
                        <td>
                            <div class="todo-actions" style="text-align: center">
                                <div class="col-lg-4 col-sm-2" style="text-align: right">
                                    <a href="btnDownload" class="todo-edit">
                                        <i class="fa fa-download" style="color: darkcyan"></i>
                                    </a>
                                    <input id="#btnDownload" type="submit" class="todo-complete hidden"
                                           value="<%= lista_trabalho.get(i).getIdProposta()%>" name="btnDownload"/>
                                </div>
                                <div class="col-md-4 col-sm-2">
                                    <a href="btnEditar" class="todo-edit">
                                        <i class="fa fa-edit" style="color: darkgreen"></i>
                                    </a>
                                    <input id="#btnEditar" type="submit" class="todo-complete hidden"
                                           value="<%= lista_trabalho.get(i).getIdProposta()%>" name="btnEditar"/>
                                </div>
                                <div class="col-md-4 col-sm-2">
                                    <button class="btn btn-square btn-xs" type="submit" 
                                            value="excluir_<%= lista_trabalho.get(i).getIdProposta()%>" name="btn">  
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
<tag:close_coluna/>

<tag:conteudoFim />


<!---------- ATENÇÃO | VARIÁVEIS OBRIGATÓRIAS PARA O FOOTER | ATENÇÃO ----------
--------------------------------------------------------------------------------
ano -> Ano da criação do sistema
--------------------------------------------------------------------------------
caminho -> Caminho para as importações do css, js, fontes e outros, padrão para
ser usado em páginas jsp dentro de pastas é '../resources'.
--------------------------------------------------------------------------------
desenvolvedores -> Nome dos desenvolvedores do módulo, separe por vírgula quando
houver mais de um desenvolvedor.
--------------------------------------------------------------------------------
versão -> Versão do módulo do Sistema em desenvolvimento.
------------------------------------------------------------------------------->
<tag:footer ano="Ano da Criação do Sistema"
            caminho="../resources"
            desenvolvedores="Nome dos Desenvolvedores"
            versao="Versão do Sistema" />
<!--------------------- ATENÇÃO | FIM DA PÁGINA | ATENÇÃO ----------------------
--------------------------------------------------------------------------------
