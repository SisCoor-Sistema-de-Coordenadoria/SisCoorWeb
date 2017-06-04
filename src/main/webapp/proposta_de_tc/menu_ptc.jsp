<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
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
            titlePage="M�dulo | Proposta de Trabalho de Curso"
            ptcAtivo="active"/>


<!------------ ATEN��O | ABERTURA DA ENTRADA DE CONTE�DO | ATEN��O -------------
--------------------------------------------------------------------------------
Todo o Conte�do fica entre as tags de 'conteudoInicio' e 'conteudoFim'.
N�o coloque fora disso.
------------------------------------------------------------------------------->
<tag:conteudoInicio />
<!------------ ATEN��O | TODO CONTE�DO DA P�GINA VEM AQUI | ATEN��O ------------
AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI 
------------------------------------------------------------------------------->
<tag:open_coluna tamanho="12"/>

<div id="sum_box" class="row mbl">

    <div class="col-sm-0 col-md-0">
    </div>
    <div class="col-sm-6 col-md-6">
        <a href="proposta_trabalho_curso.jsp">
            <div class="panel profit db mbm">
                <div class="panel-body">
                    <p class="icon">
                        <i class="icon fa fa-file-pdf-o"></i>
                    </p>
                    <h4 class="value">
                        <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                        </span><span>Submeter Proposta</span></h4>
                    <p class="description">
                        <br>
                        Submeta uma nova proposta de trabalho de curso
                    </p>
                </div>
            </div>
        </a>
    </div>
    <div class="col-sm-6 col-md-6">
        <a href="crud_ptc.jsp">
        <div class="panel profit db mbm">
            <div class="panel-body">
                <p class="icon">
                    <i class="icon fa fa-code-fork"></i>
                </p>
                <h4 class="value">
                    <span data-counter="" data-start="10" data-end="50" data-step="1" data-duration="0">
                    </span><span>Checar Propostas</span></h4>
                <p class="description">
                    <br>
                    Verifique, Edite e Apague suas propostas submetidas.
                </p>
            </div>
        </div>
        </a>
    </div>
    <div class="col-sm-0 col-md-0">
    </div>

</div>

<tag:close_coluna />
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
<tag:footer ano="Ano da Cria��o do Sistema"
            caminho="../resources"
            desenvolvedores="Nome dos Desenvolvedores"
            versao="Vers�o do Sistema" />
<!--------------------- ATEN��O | FIM DA P�GINA | ATEN��O ----------------------
--------------------------------------------------------------------------------
