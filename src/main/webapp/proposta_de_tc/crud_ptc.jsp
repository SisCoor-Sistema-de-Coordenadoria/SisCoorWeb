<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
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
<tag:conteudoInicio />
<%
    PropostaDAO proposta = new PropostaDAO();
    ArrayList<PropostaTrabalho> lista_trabalho = proposta.getLista();
%>
<!------------ ATENÇÃO | TODO CONTEÚDO DA PÁGINA VEM AQUI | ATENÇÃO ------------
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
