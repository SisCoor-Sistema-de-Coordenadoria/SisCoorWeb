<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
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
            titlePage="Módulo | Proposta de Trabalho de Curso"
            ptcAtivo="active"/>


<!------------ ATENÇÃO | ABERTURA DA ENTRADA DE CONTEÚDO | ATENÇÃO -------------
--------------------------------------------------------------------------------
Todo o Conteúdo fica entre as tags de 'conteudoInicio' e 'conteudoFim'.
Não coloque fora disso.
------------------------------------------------------------------------------->
<tag:conteudoInicio />
<!------------ ATENÇÃO | TODO CONTEÚDO DA PÁGINA VEM AQUI | ATENÇÃO ------------
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
