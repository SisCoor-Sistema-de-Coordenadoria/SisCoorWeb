<%-- 
    Document   : pagPadrao_Raiz
    Created on : 28/05/2017, 12:31:25
    Author     : Jehymeson Gil
--%>
<!---- ATEN플O | ATEN플O | ATEN플O | ATEN플O | ATEN플O | ATEN플O | ATEN플O -----
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
P�gina com menu padr�o para jsp fora de pastas.
--------------------------------------------------------------------------------
Para utiliza-la � s� criar uma nova COPIA deste arquivo para dentro da pasta
raiz do projeto e mudar o nome da jsp copiada.
--------------------------------------------------------------------------------
COPIE n�o RECORTE
Seu coleguinha pode precisar da mesma p�gina n�o modifique-a.
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

<tag:headerHome caminho="resources" 
                title="T�tulo da Aba Aqui"
                titlePage="T�tulo da P�gina Aqui"
                usuario="Nome do Usu�rio Aqui"/>


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
            caminho="resources"
            desenvolvedores="Nome dos Desenvolvedores"
            versao="Vers�o do Sistema" />
<!--------------------- ATEN플O | FIM DA P핯INA | ATEN플O ----------------------
--------------------------------------------------------------------------------
