<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho"%>
<!---- ATEN플O | ATEN플O | ATEN플O | ATEN플O | ATEN플O | ATEN플O | ATEN플O -----
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

<!---------- ATEN플O | VARI햂EIS OBRIGAT�RIAS PARA O HEADER | ATEN플O ----------
--------------------------------------------------------------------------------
caminho -> Caminho para as importa寤es do css, js, fontes e outros, padr�o para
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


<!------------ ATEN플O | ABERTURA DA ENTRADA DE CONTE�DO | ATEN플O -------------
--------------------------------------------------------------------------------
Todo o Conte�do fica entre as tags de 'conteudoInicio' e 'conteudoFim'.
N�o coloque fora disso.
------------------------------------------------------------------------------->
<tag:conteudoInicio />
<%
    PropostaDAO proposta = new PropostaDAO();
    ArrayList<PropostaTrabalho> lista_trabalho = proposta.getLista();
%>
<!------------ ATEN플O | TODO CONTE�DO DA P핯INA VEM AQUI | ATEN플O ------------
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
                        <th style="text-align: center">T�tulo</th>
                        <th style="text-align: center">Aluno 01</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Aluno 02</th>
                        <th style="text-align: center">Orientador</th>
                        <th class="hidden-xs hidden-sm" style="text-align: center">Coorientador</th>
                        <th style="text-align: center">Op寤es</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < lista_trabalho.size(); i++) {%>
                    <tr>
                        <td><%= lista_trabalho.get(i).getIdProposta()%></td>
                        <td><%= lista_trabalho.get(i).getTituloPTC()%></td>
                        <td><%= lista_trabalho.get(i).getAluno1().getNome()%></td>
                        <td class="hidden-xs hidden-sm"><%= lista_trabalho.get(i).getAluno2().getNome()%></td>
                        <td><%= lista_trabalho.get(i).getOrientador().getNome()%></td>
                        <td class="hidden-xs hidden-sm"><%= lista_trabalho.get(i).getCoorientador().getNome()%></td>
                        <td>
                            <div class="todo-actions" style="text-align: center">
                                <div class="col-md-4 col-sm-2">
                                    <a href="#" class="todo-complete">
                                        <i class="fa fa-download" style="color: darkcyan"></i>
                                    </a>                                    
                                </div>
                                <div class="col-md-4 col-sm-2">
                                    <a href="#" class="todo-edit">
                                        <i class="fa fa-edit" style="color: darkgreen"></i>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-2">
                                    <a href="#" class="todo-remove">
                                        <input type="hidden" value="<%= lista_trabalho.get(i).getIdProposta()%>" name="btn"/>
                                        <i class="fa fa-trash-o" style="color: red"></i>
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
<tag:close_coluna/>

<tag:conteudoFim />


<!---------- ATEN플O | VARI햂EIS OBRIGAT�RIAS PARA O FOOTER | ATEN플O ----------
--------------------------------------------------------------------------------
ano -> Ano da cria豫o do sistema
--------------------------------------------------------------------------------
caminho -> Caminho para as importa寤es do css, js, fontes e outros, padr�o para
ser usado em p�ginas jsp dentro de pastas � '../resources'.
--------------------------------------------------------------------------------
desenvolvedores -> Nome dos desenvolvedores do m�dulo, separe por v�rgula quando
houver mais de um desenvolvedor.
--------------------------------------------------------------------------------
vers�o -> Vers�o do m�dulo do Sistema em desenvolvimento.
------------------------------------------------------------------------------->
<tag:footer ano="Ano da Cria豫o do Sistema"
            caminho="../resources"
            desenvolvedores="Nome dos Desenvolvedores"
            versao="Vers�o do Sistema" />
<!--------------------- ATEN플O | FIM DA P핯INA | ATEN플O ----------------------
--------------------------------------------------------------------------------
