<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho"%>
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
<tag:conteudoInicio />
<%
    PropostaDAO proposta = new PropostaDAO();
    ArrayList<PropostaTrabalho> lista_trabalho = proposta.getLista();
%>
<!------------ ATEN��O | TODO CONTE�DO DA P�GINA VEM AQUI | ATEN��O ------------
AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI 
------------------------------------------------------------------------------->
<tag:open_coluna tamanho="12"/>
<div class="row">
    <div class="col-lg-4">
        <div class="timeline-centered timeline-sm">
            <article class="timeline-entry">
                <div class="timeline-entry-inner">
                    <time datetime="2014-01-10T03:45" class="timeline-time"><span>12:45 AM</span><span>Today</span></time>
                    <div class="timeline-icon bg-violet"><i class="fa fa-exclamation"></i></div>
                    <div class="timeline-label"><h4 class="timeline-title">New Project</h4>

                        <p>Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial.</p></div>
                </div>
            </article>
            <article class="timeline-entry left-aligned">
                <div class="timeline-entry-inner">
                    <time datetime="2014-01-10T03:45" class="timeline-time"><span>9:15 AM</span><span>Today</span></time>
                    <div class="timeline-icon bg-green"><i class="fa fa-group"></i></div>
                    <div class="timeline-label bg-green"><h4 class="timeline-title">Job Meeting</h4>

                        <p>Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach kombu courgette.</p></div>
                </div>
            </article>
            <article class="timeline-entry">
                <div class="timeline-entry-inner">
                    <time datetime="2014-01-09T13:22" class="timeline-time"><span>8:20 PM</span><span>04/03/2013</span></time>
                    <div class="timeline-icon bg-orange"><i class="fa fa-paper-plane"></i></div>
                    <div class="timeline-label bg-orange"><h4 class="timeline-title">Daily Feeds</h4>

                        <p><img src="http://lorempixel.com/45/45/nature/3/" alt="" class="timeline-img pull-left"/>Parsley amaranth tigernut silver beet maize fennel spinach ricebean black-eyed. Tolerably earnestly middleton extremely distrusts she boy now not. Add and offered prepare how cordial.</p></div>
                </div>
                <div class="timeline-entry-inner">
                    <div style="-webkit-transform: rotate(-90deg); -moz-transform: rotate(-90deg);" class="timeline-icon"><i class="fa fa-plus"></i></div>
                </div>
            </article>
        </div>
    </div>
</div>

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
<tag:footer ano="Ano da Cria��o do Sistema"
            caminho="../resources"
            desenvolvedores="Nome dos Desenvolvedores"
            versao="Vers�o do Sistema" />
<!--------------------- ATEN��O | FIM DA P�GINA | ATEN��O ----------------------
--------------------------------------------------------------------------------
