<%-- 
    Document   : pagPadrao_Pasta
    Created on : 28/05/2017, 11:04:36
    Author     : Jehymeson Gil
--%>
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
            titlePage="M�dulo | Proposta de Trabalho de Curso"
            usuario="<%= (String) session.getAttribute("nomeUsuario")%>"/>


<!------------ ATEN플O | ABERTURA DA ENTRADA DE CONTE�DO | ATEN플O -------------
--------------------------------------------------------------------------------
Todo o Conte�do fica entre as tags de 'conteudoInicio' e 'conteudoFim'.
N�o coloque fora disso.
------------------------------------------------------------------------------->
<tag:conteudoInicio />
<!------------ ATEN플O | TODO CONTE�DO DA P핯INA VEM AQUI | ATEN플O ------------
  AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI | AKI 
------------------------------------------------------------------------------->
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
