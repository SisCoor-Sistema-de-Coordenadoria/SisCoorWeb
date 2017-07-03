<%-- 
    Document   : cadastro_aluno
    Created on : 27/05/2017, 17:09:38
    Author     : Tarcísio e Joesio
--%>

<%@page import="br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Curso"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%if (session.getAttribute("usuario") != null) {
        response.sendRedirect("../logado.jsp");
    }%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib tagdir="/WEB-INF/tags/" prefix="tag"%>
<tag:headerHome_inicio title="SisCoor Web - Aluno" titlePage="SisCoor Web | Aluno" caminho="../resources" paramVolta="../SisCoorWeb" alunoAtivo="active"/>

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
    <br>-> Há campos obrigatórios não preenchidos!
    <%session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("senha_peq")) {%>
    <br>-> Sua senha deve ter pelo menos 6 dígitos!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("matricula_inv")) {%>
    <br>-> O campo "Núm. do Matricula" deve conter apenas números!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("cpf_inv")) {%>
    <br>-> Digite um CPF válido! Dica: digite apenas números.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("email_inv")) {%>
    <br>-> Digite um e-mail válido!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("telefone_inv")) {%>
    <br>-> Digite um telefone válido! Dica: digite apenas números.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("senhas_dif")) {%>
    <br>-> Senhas digitadas não conferem.
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("termos_uso")) {%>
    <br>-> Para se cadastrar no sistema, você deverá aceitar os termos de uso!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("cpf_existe")) {%>
    <br>-> CPF já cadastrado no sistema!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("email_existe")) {%>
    <br>-> E-mail já cadastrado no sistema!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("matricula_existe")) {%>
    <br>-> Matricula já cadastrado no sistema!
    <%
            session.setAttribute("erro_cadastro", null);
        }
        if (erros.contains("data_inv")) {%>
    <br>-> Digite uma data de nascimento válida!
    <%
            session.setAttribute("erro_cadastro", null);
        }
    %>
</div>
<%}
    }%>
<tag:open_coluna tamanho="12"/>

<div class="col-lg-2"></div>
<div class="col-lg-8">
    <div class="panel panel-grey">
        <div class="panel-heading">
            Cadastro de Aluno</div>
        <div class="panel-body pan">
            <form action="../CadastroAlunoServlet" method="post">
                <div class="form-body pal">
                    <div class="form-group" style="padding:5px">
                        <label><strong>Todos os itens marcados com * são obrigatórios:</strong></label><br><br><br>
                        <label for="inputNome" class="col-md-3 control-label">
                            * Nome Completo: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="nome" id="inputNome" type="text" placeholder="Escreva aqui seu nome completo" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group"  style="padding:5px">
                        <label for="inputCpf" class="col-md-3 control-label">
                            * CPF: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-credit-card"></i>
                                <input name="cpf" id="inputCpf" type="text" placeholder="Somente números" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group"  style="padding:5px">
                        <label for="inputCpf" class="col-md-3 control-label">
                            * Curso: : </label>
                        <%ArrayList<Curso> cursos = new CursoDAO().getLista();%>
                        <div class="col-md-9">
                            <select name="curso"class="form-control">
                                <option value="00">Escolha...</option>
                                <%for (int i = 0; i < cursos.size(); i++) {%>
                                <option value="<%=cursos.get(i).getIdCurso()%>"><%=cursos.get(i).getNome()%></option>
                                <%}%>
                            </select>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputEmail" class="col-md-3 control-label">
                            * E-mail: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-envelope"></i>
                                <input name="email" id="inputEmail" type="text" placeholder="Formato: email@dominio.com" class="form-control" /></div>
                        </div>
                        <br>
                    </div>

                    <div class="form-group" style="padding:5px">
                        <label class="col-md-3 control-label">
                            * Telefone:</label>
                        <div class="col-md-2">
                            <input name="ddd" type="text" placeholder="DDD" class="form-control" maxlength="2"/>
                        </div>
                        <div class="col-md-7">
                            <div class="input-icon right">
                                <i class="fa fa-phone"></i>
                                <input name="telefone" type="text" placeholder="Telefone (Apenas números)" class="form-control" />
                            </div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label class="col-md-3 control-label">
                            * Data de Nascimento (Dia/Mês/Ano): </label>
                        <div class="col-md-3 ">
                            <select name="dataDia"class="form-control">
                                <option value="00">Escolha...</option>
                                <%for (int i = 1; i <= 31; i++) {%>
                                <option value="<%=i%>"><%=i%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <select name="dataMes"class="form-control">
                                <option value="00">Escolha...</option>
                                <option value="01">Janeiro</option>
                                <option value="02">Fevereiro</option>
                                <option value="03">Março</option>
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

                        <div class="col-md-3 ">
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
                    </div>

                    <div class="form-group">
                        <div class="row"></div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputMatricula" class="col-md-3 control-label">
                            * Núm. da Matricula: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-user"></i>
                                <input name="matricula" id="inputMatricula" type="text" placeholder="Somente números" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputPassword" class="col-md-3 control-label">
                            * Senha: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input name="senha" id="inputPassword" type="password" placeholder="Mínimo de 6 caracteres" class="form-control" /></div>
                        </div>
                        <br>
                    </div>
                    <div class="form-group" style="padding:5px">
                        <label for="inputCPassword" class="col-md-3 control-label">
                            * Confirme sua senha: </label>
                        <div class="col-md-9">
                            <div class="input-icon right">
                                <i class="fa fa-lock"></i>
                                <input name="confirm_senha" id="inputCPassword" type="password" placeholder="Mínimo de 6 caracteres" class="form-control" /></div>
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>
                    </div>

                    <div class="row"></div>
                    <div class="row"></div>

                    <!-- Checkbox para enviar notícias por e-mail.
                    <div class="form-group">
                        <div class="col-lg-1"></div>
                        <div class="checkbox">
                            <label>
                                <input tabindex="5" type="checkbox" />&nbsp; Aceito receber notícias e novidades do sistema.</label></div>
                    </div>
                    -->

                    <div class="row">
                        <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1"></div>
                        <textarea rows="7" cols="65" readonly class="col-lg-8 col-md-8 col-sm-8 col-xs-8" style="text-align: justify">Os documentos, informações, imagens e gráficos publicados neste projeto podem conter imprecisões técnicas ou erros tipográficos. Em nenhuma hipótese o SisCoor Web - 1.0 e/ou seus respectivos fornecedores serão responsáveis por qualquer dano direto ou indireto decorrente da impossibilidade de uso, perda de dados ou lucros, resultante do acesso e desempenho do site, dos serviços oferecidos ou de informações disponíveis neste projeto. O acesso aos serviços, materiais, informações e facilidades contidas neste projeto não garante a sua qualidade.

1-) Limitação da responsabilidade

Os materiais são fornecidos neste projeto sem nenhuma garantia explícita ou implícita de comercialização ou adequação a qualquer objetivo específico.
Em nenhum caso o SisCoor Web - 1.0 ou os seus colaboradores serão responsabilizados por quaisquer danos, incluindo lucros cessantes, interrupção de negócio, ou perda de informação que resultem do uso ou da incapacidade de usar os materiais. 
O SisCoor Web - 1.0 não garante a precisão ou integridade das informações, textos, gráficos, links e outros itens dos materiais. O SisCoor Web - 1.0 não se responsabiliza pelo conteúdo dos artigos e informações aqui publicadas, uma vez que os textos são de autoria de terceiros e não traduzem, necessariamente, a opinião da aplicação. O SisCoor Web - 1.0 tampouco é responsável pela violação de direitos autorais decorrente de informações, documentos e materiais publicados neste
Projeto, comprometendo-se a retirá-los do ar assim que notificado da infração.


2-) Informações enviadas pelos usuários e colaboradores

 Qualquer material, informação, artigos ou outras comunicações que forem transmitidas, enviadas ou publicadas neste projeto serão considerados informação não confidencial, e qualquer violação aos direitos dos seus criadores não será de responsabilidade do SisCoor Web - 1.0 É terminantemente proibido transmitir, trocar ou publicar, através desta aplicação, qualquer material de cunho obsceno, difamatório ou ilegal, bem como textos ou criações de terceiros sem a autorização do autor. O SisCoor Web - 1.0 reserva-se o direito de restringir o acesso às informações enviadas por terceiros aos seus usuários. 
  
O SisCoor Web - 1.0 poderá, mas não é obrigado, a monitorar, revistar e restringir o acesso a qualquer área no site onde usuários transmitem e trocam informações entre si, incluindo, mas não limitado a salas de chat, centro de mensagens ou outros fóruns de debates, podendo retirar do ar ou retirar o acesso a qualquer destas informações ou comunicações.  Porém, o SisCoor Web - 1.0 não é responsável pelo conteúdo de qualquer uma das informações trocadas entre os usuários, sejam elas lícitas ou ilícitas.

3-) Links para sites de terceiros

Os sites apontados não estão sob o controle do SisCoor Web - 1.0 que não é responsável pelo conteúdo de qualquer outro website indicado ou acessado por meio do SisCoor Web - 1.0 reserva-se o direito de eliminar qualquer link ou direcionamento a outros sites ou serviços a qualquer momento. O SisCoor Web - 1.0 não endossa firmas ou produtos indicados, acessados ou divulgados através deste website, tampouco pelos anúncios aqui publicados, reservando-se o direito de publicar este alerta em suas páginas eletrônicas sempre que considerar necessário.

4-) Direitos autorais e propriedade intelectual

Os documentos, conteúdos e criações contidos neste website pertencem aos seus criadores e colaboradores. A autoria dos conteúdo, material e imagens exibidos no SisCoor Web - 1.0 é protegida por leis nacionais e internacionais. Não podem ser copiados, reproduzidos, modificados, publicados, atualizados, postados, transmitidos ou distribuídos de qualquer maneira sem autorização prévia e por escrito do SisCoor Web - 1.0. As imagens contidas neste website são aqui incorporadas apenas para fins de visualização, e, salvo autorização expressa por escrito, não podem ser gravadas ou baixadas via download. A reprodução ou armazenamento de materiais recuperados a partir deste serviço sujeitará os infratores às penas da lei. O nome do projeto SisCoor Web - 1.0, seu logotipo, bem como todos os elementos característicos da tecnologia desenvolvida e aqui apresentada, sob a forma da articulação de bases de dados, constitui marcas registradas e propriedades intelectuais privadas e todos os direitos decorrentes de seu registro são assegurados por lei.

 Alguns direitos de uso podem ser cedidos por SisCoor Web - 1.0 em contrato ou licença especial, que pode ser cancelada a qualquer momento se não cumpridos os seus termos. As marcas registradas do SisCoor Web - 1.0 só podem ser usadas publicamente com autorização expressa. O uso destas marcas registradas em publicidade e promoção de produtos deve ser adequadamente informado.

5-) Reclamações sobre violação de direitos autorais

O SisCoor Web - 1.0 respeita a propriedade intelectual de outras pessoas ou empresas e solicitamos aos nossos membros que façam o mesmo. Toda e qualquer violação de direitos autorais deverá ser notificada a SisCoor Web - 1.0 e acompanhada dos documentos e informações que confirmam a autoria. A notificação poderá ser enviada pelos e-mails constantes do site.

6-) Leis aplicáveis

Este site é controlado e operado pelo SisCoor Web - 1.0 a partir de seu escritório na cidade de Urutai estado de Goiás e não garante que o conteúdo ou materiais estejam disponíveis para uso em outras localidades. Seu acesso é proibido em territórios onde o conteúdo seja considerado ilegal. Aqueles que optarem por acessar este site a partir de outras localidades o farão por iniciativa própria e serão responsáveis pelo cumprimento das leis locais aplicáveis. Os materiais não deverão ser usados ou exportados em descumprimento das leis brasileiras sobre exportação. 
Qualquer pendência com relação aos materiais será dirimida pelas leis brasileiras.

O acesso ao SisCoor Web - 1.0 representa a aceitação expressa e irrestrita dos termos de uso acima descritos.

                        </textarea>
                    </div>
                </div>
                <div class="form-group mbn">
                    <div class="col-lg-1 col-sm-1 col-xs-1"></div>
                    <div class="checkbox">
                        <label>
                            * <input tabindex="5" type="checkbox" value="aceito" name="aceito" />&nbsp; <strong>Aceito os Termos e Condições de Uso do SisCoor Web.</strong></label></div>
                </div>
        </div>
        <div class="form-actions text-right pal">
            <center>
                <button type="submit" name="bt_cad" value="voltar" class="btn btn-primary">
                    Voltar</button>&nbsp;&nbsp; &nbsp;&nbsp;
                <button type="submit" name="bt_cad" value="cad" class="btn btn-primary">
                    Cadastrar-se</button>
            </center>
        </div>
        </form>
    </div>
</div>
</div>
<div class="col-lg-2"></div>
<tag:close_coluna/>
<tag:conteudoFim />
<tag:footer ano="2017" versao="1.0" caminho="resources" desenvolvedores="Alunos do 5º período do curso de Tecnologia em Análise e Desenvolvimento de Sistemas, do Instituto Federal Goiano - Campus Urutaí."/>
