<%-- 
    Document   : agendar_defesa_tc
    Created on : 27/05/2017, 16:52:41
    Author     : IFgoiano
--%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.Aluno"%>
<%@page import="br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="tag" tagdir="/WEB-INF/tags/"%>
<tag:header caminho="../resources" paramVolta="../../SisCoorWeb" title="SisCoor | Defesa de TC" titlePage="Defesa de Trabalho de Curso" usuario="Naiane"/>

<!-- Escondendo Mensagem Danger-->
<script language="JavaScript">
    function fecha_banner_danger()
    {
        var banner_obj = document.getElementById('alert_danger');
        banner_obj.style.display = 'none';
    }
    setTimeout('fecha_banner_danger()', 5000000);
</script>
<!-- Fim do JavaScript -->

<tag:conteudoInicio/>
<tag:open_coluna tamanho="2"/>
<tag:close_coluna/>
<tag:open_coluna tamanho="8"/>
<!-- Inicializando Lista de Trabalhos -->
<% ArrayList<PropostaTrabalho> lista = new ArrayList();%>
<% /*lista = (ArrayList<PropostaTrabalho>) request.getAttribute("lista");*/%>
<% PropostaTrabalho ptc = new PropostaTrabalho();
    Aluno aluno = new Aluno();
    aluno.setNome("naiane Maria de OSus");
    ptc.setIdProposta(1);
    ptc.setAluno1(aluno);
    ptc.setAluno2(aluno);
    ptc.setTitulo("Nome");
    lista.add(ptc);%>
    <div class="panel panel-green" onpageshow="center">
    <div class="panel-heading">
        Agendar Defesa de Trabalho de Curso
    </div>
    <div class="panel-body pan">
        <form action="../DefesaServlet" method="POST">
            <div class="form-body pal">
                <div class="row">
                       
                    <div class="col-md-12">
                        <!-- Conteudo do formulário -->
                        
                        <!-- Titulo do Trabalho -->
                        <div class="col-md-12">
                            <div class="form-group">
                                <label for="titulo" class="control-label">
                                    <strong>*</strong>Título do Trabalho
                                </label>
                                <div class="input-icon right">
                                    <select id="titulo" class="form-control" name="idTrabalho">
                                        <option> </option>
                                        <%for (int i = 0; i < lista.size(); i++) {%>
                                        <option value=<%=lista.get(i).getIdProposta()%>><%= lista.get(i).getTituloPTC()%></option>
                                        <% }%>
                                    </select> 
                                </div>
                            </div>
                        </div>
                        <!-- Botão Buscar -->            
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Buscar dados" name="botao"/>
                        </div>

                        <!-- Aluno 01 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno01" class="control-label">
                                    <strong>*</strong>Aluno 01
                                </label>
                                <div class="input-icon right">
                                    
                                    <input class="form-control" type="text" value="<%=ptc.getAluno1().getNome()%>" name="aluno1" disabled/>
                                </div>
                            </div>
                        </div>

                        <!-- Aluno 02 -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputAluno02" class="control-label">
                                    Aluno 02
                                </label>
                                <div class="input-icon right">
                                    
                                    <input class="form-control" type="text" value="<%=ptc.getAluno1().getNome()%>" name="aluno2" disabled/>
                                </div>
                            </div>
                        </div>

                        <!-- Orientador -->
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="inputOrientador" class="control-label">
                                    <strong>*</strong>Orientador
                                </label>
                                <div class="input-icon right">
                                    
                                    <input class="form-control" type="text" value="" name="orientador" disabled/>
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
                                    <input class="form-control" type="text" value="" name="coorientador" disabled/>
                                </div>
                            </div>
                        </div>

                        <!-- Data da Defesa -->
                        <div class="col-md-3">
                        <div class="form-group">
                            <label for="data" class="col-2 col-form-label">Data da Defesa</label>
                            <input class="form-control" type="date" value="28/05/2017" name="data">
                            </div>
                        </div>
                        <!-- Horario da Defesa -->
                        <div class="col-md-3">
                        <div class="form-group">
                            <label for="horario" class="col-2 col-form-label">Horário de Início</label>
                                <input class="form-control" type="time" value="09:00:00" name="horario">
                            </div>
                        </div>
                        <!-- Local da Defesa -->
                        <div class="col-md-6">
                        <div class="form-group">
                            <label for="local" class="col-2 col-form-label">Local</label>
                                <input class="form-control" type="text" value="" name="local">
                            </div>
                        </div>
                        <!-- Botão Agendar Defesa -->
                        
                        <div class="col-md-12" style="text-align: right">
                            <input type="submit" class="btn btn-blue" value="Agendar Defesa"/>
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
<tag:footer ano="2017" caminho="../resources" desenvolvedores="Naiane" versao="1.0"/>