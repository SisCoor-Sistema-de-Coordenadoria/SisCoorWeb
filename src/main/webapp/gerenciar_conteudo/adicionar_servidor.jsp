<%-- 
    Document   : adicionar_servidor
    Created on : 09/06/2017, 17:52:33
    Author     : Diego
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" titlePage="M�dulo | Gerenciar Conte�do | Novo Servidor" title="SisCoor | Gerenciar Conte�do | Novo Servidor" usuario="<%=(String) session.getAttribute("nomeUsuario")%>" crudMenuConteudoAtivo="active"/>

<tag:conteudoInicio/>
<%String erros = String.valueOf(session.getAttribute("erro_cadastro"));
%>
<%if (!erros.equals("null")) {%>
<%if (erros.equals("false")) {%>
<div id="alert" class="alert alert-success col-lg-12" role="alert" style="text-align: center">
    <strong>Cadastro efetuado com sucesso!</strong>
    <%
        session.setAttribute("erro_cadastro", null);
    %>
</div>
<%} else {%>
<div id="alert_danger" class="alert alert-danger col-lg-12" role="alert" style="text-align: center">
    <strong>Foram encontrados os seguintes erros:</strong>
    <%if (erros.contains("vazio")) {%>
    <br>-> H� campos obrigat�rios n�o preenchidos!
    <%session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("senha_peq")) {%>
    <br>-> Sua senha deve ter pelo menos 6 d�gitos!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("siape_inv")) {%>
    <br>-> O campo "N�m. do Siape" deve conter apenas n�meros!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("cpf_inv")) {%>
    <br>-> Digite um CPF v�lido! Dica: digite apenas n�meros.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("email_inv")) {%>
    <br>-> Digite um e-mail v�lido!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("telefone_inv")) {%>
    <br>-> Digite um telefone v�lido! Dica: digite apenas n�meros.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("senhas_dif")) {%>
    <br>-> Senhas digitadas n�o conferem.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("termos_uso")) {%>
    <br>-> Para se cadastrar no sistema, voc� dever� aceitar os termos de uso!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("cpf_existe")) {%>
    <br>-> CPF j� cadastrado no sistema!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("email_existe")) {%>
    <br>-> E-mail j� cadastrado no sistema!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("siape_existe")) {%>
    <br>-> Siape j� cadastrado no sistema!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("data_inv")) {%>
    <br>-> Digite uma data de nascimento v�lida!
    <%
            session.setAttribute("erro_cadastro", null);
        }
    %>
</div>
<%}
    }%>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:open_coluna tamanho="8"/>
 
<div class="panel panel-grey " onpageshow="center">
    <div class="panel-heading">
        Cadastrar um Servidor
    </div>
    <div class="panel-body pan">
        <form action="../CadastroServidorServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Conteudo do formul�rio -->                                       
                        <!-- Nome da Disciplina -->
                        <label><strong>Todos os itens marcados com * s�o obrigat�rios:</strong></label><br><br>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputNome" class="control-label">
                                    <strong>*</strong>Nome
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input id="inputNome" placeholder="Escreva aqui seu nome completo" class="form-control" type="text" value="" name="nome"/>
                                </div>
                            </div>
                        </div>

                        <!-- Carga Horaria da Disciplina -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputCpf" class="control-label">
                                    <strong>*</strong>CPF
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-credit-card"></i>
                                    <input id="inputCpf" class="form-control" placeholder="Somente n�meros" type="text" value="" name="cpf"/>
                                </div>
                            </div>
                        </div>
                        
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputTelefone" class="control-label">
                                    <strong>*</strong>Telefone
                                </label>
                                <div class="row">
                                <div class="col-md-4">
                            <input name="ddd" type="text" placeholder="DDD" class="form-control" maxlength="2"/>
                        </div>
                        <div class="col-md-8">
                            <div class="input-icon right">
                                <i class="fa fa-phone"></i>
                                <input name="telefone" type="text" placeholder="Telefone (Apenas n�meros)" class="form-control" />
                            </div>
                        </div></div>
                            </div>
                        </div>
                        
                        <div class="col-md-12">
                           <div class="form-group">
                            <label for="inputTelefone" class="control-label">
                                    <strong>*</strong>Cargo exercido
                                </label>
                        <label><input type="radio" name="cargo" value="1" style="margin-left:20px;margin-right: 10px"/>T�cnico Administrativo</label>
                        <label><input type="radio" name="cargo" value="2" style="margin-left:40px; margin-right: 10px"/>Professor</label>
                    </div> 
                            
                        </div>
                        
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="inputEmail" class="control-label">
                                    <strong>*</strong>E-mail
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-envelope"></i>
                                    <input id="inputEmail" class="form-control" type="text" value="" name="email"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-12">                        
                                <label for="inputData" class="control-label">
                                    <strong>*</strong>Data de Nascimento
                                </label>
                            <div class="row">
                                <div class="form-group">
                                <div class="col-md-4 ">
                                    <select name="dataDia"class="form-control">
                                        <option value="00">Escolha...</option>
                                        <%for (int i = 1; i <= 31; i++) {%>
                                        <option value="<%=i%>"><%=i%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <select name="dataMes"class="form-control">
                                        <option value="00">Escolha...</option>
                                        <option value="01">Janeiro</option>
                                        <option value="02">Fevereiro</option>
                                        <option value="03">Mar�o</option>
                                        <option value="04">Abril</option>
                                        <option value="05">Maio</option>
                                        <option value="06">Junho</option>
                                        <option value="07">Julho</option>
                                        <option value="08">Agosto</option>
                                        <option value="09">Setembro</option>
                                        <option value="10">Outubro</option>
                                        <option value="11">Novembro</option>
                                        <option value="12">Dezembro</option>
                                    </select>
                                </div>

                                <div class="col-md-4 ">
                                    <select name="dataAno"class="form-control">
                                        <option value="00">Escolha...</option>
                                            <%
                                            Calendar data = Calendar.getInstance();
                                            int anoAtual = data.get(Calendar.YEAR);
                                            for (int i = anoAtual; i >= anoAtual - 100; i--) {%>
                                        <option value="<%=i%>"><%=i%></option>
                                        <%}%>
                                    </select>
                                </div>
                            </div></div>
                        </div>
                                    <div class="row"></div><br>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputPassword" class="control-label">
                                    <strong>*</strong>Senha
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-lock"></i>
                                    <input id="inputPassword" class="form-control" placeholder="M�nimo de 6 caracteres" type="password" value="" name="senha"/>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputPassword2" class="control-label">
                                    <strong>*</strong>Confirmar Senha
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-lock"></i>
                                    <input id="inputPassword" class="form-control" placeholder="M�nimo de 6 caracteres" type="password" value="" name="confirm_senha"/>
                                </div>
                            </div>
                        </div>
                                
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputSiape" class="control-label">
                                    <strong>*</strong>N� do Siape
                                </label>
                                <div class="input-icon right">
                                    <i class="fa fa-user"></i>
                                    <input id="inputSiape" class="form-control" placeholder="Somente n�meros" type="text" value="" name="siape"/>
                                </div>
                            </div>
                        </div>
                        

                        <div class="row"></div><br>
                       
                        <div class="row">
                            <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                        <textarea rows="7" cols="65" readonly class="col-lg-12 col-md-12 col-sm-12col-xs-12" style="text-align: justify">Os documentos, informa��es, imagens e gr�ficos publicados neste projeto podem conter imprecis�es t�cnicas ou erros tipogr�ficos. Em nenhuma hip�tese o SisCoor Web - 1.0 e/ou seus respectivos fornecedores ser�o respons�veis por qualquer dano direto ou indireto decorrente da impossibilidade de uso, perda de dados ou lucros, resultante do acesso e desempenho do site, dos servi�os oferecidos ou de informa��es dispon�veis neste projeto. O acesso aos servi�os, materiais, informa��es e facilidades contidas neste projeto n�o garante a sua qualidade.

1-) Limita��o da responsabilidade

Os materiais s�o fornecidos neste projeto sem nenhuma garantia expl�cita ou impl�cita de comercializa��o ou adequa��o a qualquer objetivo espec�fico.
Em nenhum caso o SisCoor Web - 1.0 ou os seus colaboradores ser�o responsabilizados por quaisquer danos, incluindo lucros cessantes, interrup��o de neg�cio, ou perda de informa��o que resultem do uso ou da incapacidade de usar os materiais. 
O SisCoor Web - 1.0 n�o garante a precis�o ou integridade das informa��es, textos, gr�ficos, links e outros itens dos materiais. O SisCoor Web - 1.0 n�o se responsabiliza pelo conte�do dos artigos e informa��es aqui publicadas, uma vez que os textos s�o de autoria de terceiros e n�o traduzem, necessariamente, a opini�o da aplica��o. O SisCoor Web - 1.0 tampouco � respons�vel pela viola��o de direitos autorais decorrente de informa��es, documentos e materiais publicados neste
Projeto, comprometendo-se a retir�-los do ar assim que notificado da infra��o.


2-) Informa��es enviadas pelos usu�rios e colaboradores

 Qualquer material, informa��o, artigos ou outras comunica��es que forem transmitidas, enviadas ou publicadas neste projeto ser�o considerados informa��o n�o confidencial, e qualquer viola��o aos direitos dos seus criadores n�o ser� de responsabilidade do SisCoor Web - 1.0 � terminantemente proibido transmitir, trocar ou publicar, atrav�s desta aplica��o, qualquer material de cunho obsceno, difamat�rio ou ilegal, bem como textos ou cria��es de terceiros sem a autoriza��o do autor. O SisCoor Web - 1.0 reserva-se o direito de restringir o acesso �s informa��es enviadas por terceiros aos seus usu�rios. 
  
O SisCoor Web - 1.0 poder�, mas n�o � obrigado, a monitorar, revistar e restringir o acesso a qualquer �rea no site onde usu�rios transmitem e trocam informa��es entre si, incluindo, mas n�o limitado a salas de chat, centro de mensagens ou outros f�runs de debates, podendo retirar do ar ou retirar o acesso a qualquer destas informa��es ou comunica��es.  Por�m, o SisCoor Web - 1.0 n�o � respons�vel pelo conte�do de qualquer uma das informa��es trocadas entre os usu�rios, sejam elas l�citas ou il�citas.

3-) Links para sites de terceiros

Os sites apontados n�o est�o sob o controle do SisCoor Web - 1.0 que n�o � respons�vel pelo conte�do de qualquer outro website indicado ou acessado por meio do SisCoor Web - 1.0 reserva-se o direito de eliminar qualquer link ou direcionamento a outros sites ou servi�os a qualquer momento. O SisCoor Web - 1.0 n�o endossa firmas ou produtos indicados, acessados ou divulgados atrav�s deste website, tampouco pelos an�ncios aqui publicados, reservando-se o direito de publicar este alerta em suas p�ginas eletr�nicas sempre que considerar necess�rio.

4-) Direitos autorais e propriedade intelectual

Os documentos, conte�dos e cria��es contidos neste website pertencem aos seus criadores e colaboradores. A autoria dos conte�do, material e imagens exibidos no SisCoor Web - 1.0 � protegida por leis nacionais e internacionais. N�o podem ser copiados, reproduzidos, modificados, publicados, atualizados, postados, transmitidos ou distribu�dos de qualquer maneira sem autoriza��o pr�via e por escrito do SisCoor Web - 1.0. As imagens contidas neste website s�o aqui incorporadas apenas para fins de visualiza��o, e, salvo autoriza��o expressa por escrito, n�o podem ser gravadas ou baixadas via download. A reprodu��o ou armazenamento de materiais recuperados a partir deste servi�o sujeitar� os infratores �s penas da lei. O nome do projeto SisCoor Web - 1.0, seu logotipo, bem como todos os elementos caracter�sticos da tecnologia desenvolvida e aqui apresentada, sob a forma da articula��o de bases de dados, constitui marcas registradas e propriedades intelectuais privadas e todos os direitos decorrentes de seu registro s�o assegurados por lei.

 Alguns direitos de uso podem ser cedidos por SisCoor Web - 1.0 em contrato ou licen�a especial, que pode ser cancelada a qualquer momento se n�o cumpridos os seus termos. As marcas registradas do SisCoor Web - 1.0 s� podem ser usadas publicamente com autoriza��o expressa. O uso destas marcas registradas em publicidade e promo��o de produtos deve ser adequadamente informado.

5-) Reclama��es sobre viola��o de direitos autorais

O SisCoor Web - 1.0 respeita a propriedade intelectual de outras pessoas ou empresas e solicitamos aos nossos membros que fa�am o mesmo. Toda e qualquer viola��o de direitos autorais dever� ser notificada a SisCoor Web - 1.0 e acompanhada dos documentos e informa��es que confirmam a autoria. A notifica��o poder� ser enviada pelos e-mails constantes do site.

6-) Leis aplic�veis

Este site � controlado e operado pelo SisCoor Web - 1.0 a partir de seu escrit�rio na cidade de Urutai estado de Goi�s e n�o garante que o conte�do ou materiais estejam dispon�veis para uso em outras localidades. Seu acesso � proibido em territ�rios onde o conte�do seja considerado ilegal. Aqueles que optarem por acessar este site a partir de outras localidades o far�o por iniciativa pr�pria e ser�o respons�veis pelo cumprimento das leis locais aplic�veis. Os materiais n�o dever�o ser usados ou exportados em descumprimento das leis brasileiras sobre exporta��o. 
Qualquer pend�ncia com rela��o aos materiais ser� dirimida pelas leis brasileiras.

O acesso ao SisCoor Web - 1.0 representa a aceita��o expressa e irrestrita dos termos de uso acima descritos.

                        </textarea>
                    </div>
                </div>
                                <div class="row"></div>
                        <div class="row"></div>
                        <div class="row"></div>
                        <div class="row"></div><br>
                        <div class="form-group mbn">
                            <div class="col-lg-1"></div>
                            <div class="checkbox">
                                <label>
                                    <strong>*</strong><input tabindex="5" type="checkbox" value="aceito" name="aceito"/>&nbsp; Aceita os Termos e Condi��es de Uso do SisCoor Web.</label></div>
                        </div>
                        <!-- Bot�o Cadastrar Disciplina -->
                        
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Cadastrar" name="bt_cad"/>
                        </div>
                        
                    </div>
                </div>
            </div>
           
        </form>
    </div>

</div>
<tag:close_coluna/>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:conteudoFim/>
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Diego F. Pereira" versao="1.0"/>
