<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Servidor"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho"%>

<%-- Objetos para preenchimento de campos select --%>
<%
    AlunoDao aluno = new AlunoDao();
    ServidorDao servidor = new ServidorDao();
    ArrayList<Aluno> listaAluno = aluno.getLista();
    ArrayList<Servidor> listaServidor = servidor.getLista();
%>

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

<!--Início do Conteudo-->
<tag:conteudoInicio />
<%
    PropostaDAO proposta = new PropostaDAO();
    ArrayList<PropostaTrabalho> lista_trabalho = proposta.getLista();
%>
<!------------ ATENÇÃO | TODO CONTEÚDO DA PÁGINA VEM AQUI | ATENÇÃO ------------
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
            <h4 class="box-heading">Ops! Não há nada a ser visto aqui.</h4>
            <p>Parece que você ainda não submeteu nenhum trabalho.<br>
                Faça uma submissão e volte, assim teremos algo a lhe mostrar.</p>
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
                        <th style="text-align: center">Título</th>
                        <th style="text-align: center">Aluno 01</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Aluno 02</th>
                        <th style="text-align: center">Orientador</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Coorientador</th>
                        <th style="text-align: center">Opções</th>
                    </tr>
                </thead>
                <tbody>
                    <%-- Reduz o nome no campo 
                    style="max-width: 20ch; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;"
                    --%>
                    <% for (int i = 0; i < lista_trabalho.size(); i++) {%>
                    <tr>
                        <td><%= i + 1%></td>
                        <td class="hidden"><%= lista_trabalho.get(i).getIdProposta()%></td>
                        <td>
                <tooltip data-toggle="tooltip" title="<%= lista_trabalho.get(i).getTituloPTC()%>">
                    <% if (lista_trabalho.get(i).getTituloPTC().length() > 25) {%>
                    <%= lista_trabalho.get(i).getTituloPTC().substring(0, 25)%>...
                    <%} else {%>
                    <%= lista_trabalho.get(i).getTituloPTC()%>
                    <%}%>
                </tooltip>
                </td>

                <%--Tooltip Script--%>
                <%-- 
                Colocar dentro da tag que se quer usar o tooltip:
                
                data-toggle = "tooltip"
                title = "Texto a ser apresentado"
                
                ------------------- Opcional: Top por padrão -------------------
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
                            <a href="#modal-editar" data-toggle="modal" data-target="#modal-editar" onclick="setValor(
                                        '<%= lista_trabalho.get(i).getIdProposta()%>',
                                        '<%= lista_trabalho.get(i).getTituloPTC()%>',
                                        '<%= lista_trabalho.get(i).getAluno1().getNome()%>',
                                        '<%= lista_trabalho.get(i).getAluno2().getIdAluno()%>',
                                        '<%= lista_trabalho.get(i).getOrientador().getIdServidor()%>',
                                        '<%= lista_trabalho.get(i).getCoorientador().getIdServidor()%>',
                                        '<%= lista_trabalho.get(i).getAluno1().getIdAluno()%>')">
                                <button class="btn btn-square btn-xs" style="background-color: rgba(0,0,0,0)" name="btn"
                                        data-toggle="tooltip" title="Editar">  
                                    <i class="fa fa-edit" style="color: darkgreen"></i>
                                </button>
                            </a>
                        </div>
                        <div class="col-md-4 col-sm-2">
                            <a href="#modal-excluir" data-toggle="modal" data-target="#modal-excluir" onclick="setID('excluir_<%= lista_trabalho.get(i).getIdProposta()%>')">
                                <button class="btn btn-square btn-xs" type="submit" style="background-color: rgba(0,0,0,0)"
                                        value="excluir_<%= lista_trabalho.get(i).getIdProposta()%>" name="btn"
                                        data-toggle="tooltip" title="Excluir">  
                                    <i class="fa fa-trash-o" style="color: red"></i>
                                </button>
                            </a>
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

<%-- SCRIPT para passar valor do ID de Exclusão para o MODAL --%>
<%-- SCRIPT para passar valores para o MODAL de Edição de proposta --%>
<script>
    //Excluir
    function setID(valor) {
    document.getElementById('btnE').value = valor;
    }

    //Editar
    function setValor(id_proposta, titulo, aluno01, aluno02, orientador, coorientador, id_aluno01){
    document.getElementById('idProposta').value = id_proposta;
    document.getElementById('tituloPTC').value = titulo;
    document.getElementById('aluno01').value = aluno01;
    document.getElementById('aluno02').value = aluno02;
    document.getElementById('orientador').value = orientador;
    document.getElementById('coorientador').value = coorientador;
    document.getElementById('btnEditar').value = 'editar_'+id_proposta;
    document.getElementById('idAluno01').value = id_aluno01;
    }
</script>

<%-- MODAL para edição das propostas --%>
<div class="modal fade" id="modal-editar">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                <h4 class="modal-title">Editar Proposta</h4>
            </div>
            <div class="modal-body">
                <!-- Verifica se é aluno ou cordenador que esta usando o módulo -->
                <div class="panel panel-grey">
                    <div class="panel-body pan">
                        <form action="../PTCServlet" method="POST" enctype="multipart/form-data">
                            <div class="form-body pal">
                                <div class="row">
                                    <div class="col-md-12">
                                        <!-- Conteudo do formulário -->

                                        <!-- Titulo do Trabalho -->
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="tituloPTC" class="control-label">
                                                    <strong>*</strong>Título do Trabalho
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-pencil"></i>
                                                    <input type="text" id="tituloPTC" class="form-control" name="tituloPTC">
                                                </div>
                                            </div>
                                        </div>

                                        <!--Condição que checa se é aluno ou cordenador do curso -->
                                        <%if (session.getAttribute("tipoUsuario").toString().equals("4") || session.getAttribute("tipoUsuario").toString().equals("5")) {%>

                                        <!-- ID Aluno01 -->
                                        <div class="col-md-12" hidden="enable">
                                            <div class="form-group">
                                                <div class="input-icon right">                                    
                                                    <input type="text" id="idAluno01" class="form-control" name="idAluno01">
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Aluno 01 -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputAluno01" class="control-label">
                                                    <strong>*</strong> Aluno 01
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-user"></i>
                                                    <input class="form-control" id="aluno01" disabled="enable" name="aluno01"/>
                                                </div>
                                            </div>
                                        </div>
                                        <%} else {%>
                                        <!-- Aluno 01 -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputAluno01" class="control-label">
                                                    <strong>*</strong> Aluno 01
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-user"></i>
                                                    <select id="aluno01" class="form-control" name="idAluno01">
                                                        <option value="0"> </option>
                                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                                        <option id="<%= listaAluno.get(i).getIdAluno()%>"><%= listaAluno.get(i).getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>

                                        <!-- Aluno 02 -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputAluno02" class="control-label">
                                                    Aluno 02
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-user"></i>
                                                    <select id="aluno02" class="form-control" name="idAluno02">
                                                        <option value="0"> </option>
                                                        <%for (int i = 0; i < listaAluno.size(); i++) {%>
                                                        <option value="<%= listaAluno.get(i).getIdAluno()%>"><%= listaAluno.get(i).getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Orientador -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputOrientador" class="control-label">
                                                    <strong>*</strong> Orientador
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-user"></i>
                                                    <select id="orientador" class="form-control" name="idOrientador">
                                                        <%for (int i = 0; i < listaServidor.size(); i++) {%>
                                                        <option value="<%= listaServidor.get(i).getIdServidor()%>"><%= listaServidor.get(i).getNome() %></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Coorientador -->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="inputCoorientador" class="control-label">
                                                    Coorientador
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-user"></i>
                                                    <select id="coorientador" class="form-control" name="idCoorientador">
                                                        <option value="0"> </option>
                                                        <%for (int i = 0; i < listaServidor.size(); i++) {%>
                                                        <option value="<%= listaServidor.get(i).getIdServidor()%>"><%= listaServidor.get(i).getNome()%></option>
                                                        <% }%>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Arquivo a ser enviado -->
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="inputFile" class="control-label">
                                                    Selecione o Trabalho
                                                </label>
                                                <div class="input-icon right">
                                                    <i class="fa fa-file"></i>
                                                    <input type="file" id="inputFile" class="form-control" name="file" accept=".pdf"/>
                                                </div>
                                            </div>

                                            <!--Caminho do Arquivo-->
                                            <input hidden="true" id="idProposta" name="idProposta"/>

                                            <strong><h6><b>Obs.: Campos compostos de '*' são obrigatórios.</b></h6></strong>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>
                                <button type="submit" id="btnEditar" type="button" class="btn btn-blue" name="btn">
                                    Atualizar Proposta
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%-- MODAL para deletar proposta --%>
<div class="modal fade" id="modal-excluir">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
                <h4 class="modal-title">Atenção</h4>
            </div>
            <div class="modal-body">
                <p>Deseja realmente excluir esta proposta de trabalho de curso?</p>
            </div>
            <div class="modal-footer">
                <div class="col-lg-12 col-md-1" style="text-align: right">
                    <div class="col-md-8">

                    </div>
                    <div class="col-md-2">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Não</button>
                    </div>
                    <div class="col-md-2">
                        <form id="form" method="POST" action="../PTCServlet">
                            <button type="submit" id="btnE" type="button" class="btn btn-green" name="btn">
                                Sim
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%}%>


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
<tag:footer ano="2017"
            caminho="../resources"
            desenvolvedores="Jehymison Gil Alves Oliveira"
            versao="1.0" />
<!--------------------- ATENÇÃO | FIM DA PÁGINA | ATENÇÃO ----------------------
--------------------------------------------------------------------------------
