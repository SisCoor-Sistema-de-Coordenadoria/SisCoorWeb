/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao;
import br.edu.ifgoiano.siscoorweb.utilitarios.UploadPTC;
import br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jehymeson Gil
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        UploadPTC up = new UploadPTC();
        up.setFolderUpload("uploadsPTC");

        uploadArquivo(request, response, up);

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    /**
     * Método responsável pela chamada do upload do arquivo. Verificador de qual
     * botão foi precionado na tela de upload.
     *
     * @param request
     * @param response
     * @param up
     * @throws ServletException
     * @throws IOException
     */
    public void uploadArquivo(HttpServletRequest request, HttpServletResponse response, UploadPTC up)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + up.getFolderUpload();
        //System.out.println(savePath);

        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        if (up.formProcess(getServletContext(), request)) {
            if (String.valueOf(up.getForm().get("btn")).equals("Voltar")) {
                String tentar_pegar = null;
                try {
                    tentar_pegar = up.getFiles().get(0);
                } catch (IndexOutOfBoundsException ex) {
                    tentar_pegar = "";
                }
                if (!tentar_pegar.isEmpty()) {
                    try {
                        File fileApaga = new File(savePath + File.separator + up.getFiles().get(0));
                        fileApaga.delete();
                    } catch (Exception e) {
                        System.out.println(e);
                    } finally {
                        btnVoltar(request, response);
                    }
                } else if (tentar_pegar.isEmpty()) {
                    btnVoltar(request, response);
                }
            } else {
                String tentar_pegar = null;
                try {
                    tentar_pegar = up.getFiles().get(0);
                } catch (IndexOutOfBoundsException ex) {
                    tentar_pegar = "";
                }
                session.setAttribute("msg", null);
                session.setAttribute("tipo_msg", null);
                if (tentar_pegar.isEmpty()
                        || String.valueOf(up.getForm().get("tituloPTC")).isEmpty()
                        || String.valueOf(up.getForm().get("idAluno01")).isEmpty()
                        || String.valueOf(up.getForm().get("idOrientador")).isEmpty()) {

                    try {
                        File fileApaga = new File(savePath + File.separator + up.getFiles().get(0));
                        fileApaga.delete();
                    } catch (Exception e) {
                        System.out.println(e);
                    } finally {
                        //Erro
                        session.setAttribute("msg", "Por favor, preencha todos os campos obrigatórios.");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("proposta_de_tc/proposta_trabalho_curso.jsp");
                    }
                } else if (getTipoArquivo(up) == 0) {
                    try {
                        File fileApaga = new File(savePath + File.separator + up.getFiles().get(0));
                        fileApaga.delete();
                    } catch (Exception e) {
                        System.out.println(e);
                    } finally {
                        //Erro
                        session.setAttribute("msg", "Por favor, o arquivo para "
                                + "submissão deve ser do tipo Adobe Acrobat Document (pdf).");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("proposta_de_tc/proposta_trabalho_curso.jsp");
                    }
                } else {
                    //Enviar para o BD
                    String caminho = savePath + File.separator + up.getFiles().get(0);
                    PropostaTrabalho novaProposta = new PropostaTrabalho();
                    PropostaDAO enviarProposta = new PropostaDAO();

                    novaProposta = setProposta(novaProposta, up, caminho, session);

                    if (enviarProposta.insereDados(novaProposta)) {
                        session.setAttribute("msg", "Trabalho submetido com sucesso");
                        session.setAttribute("tipo_msg", "success");
                        response.sendRedirect("proposta_de_tc/proposta_trabalho_curso.jsp");
                    } else {
                        session.setAttribute("msg", "Erro ao inserir no banco de dados");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("proposta_de_tc/proposta_trabalho_curso.jsp");
                    }
                }
            }
        } else {
            //out.println(caminho + "<br>");
        }
    }

    /**
     * Método responsável pela função do botão voltar.
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void btnVoltar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("proposta_de_tc/menu_ptc.jsp");
    }

    /**
     * Método responsável pela inserção de dados do objeto Proposta
     *
     * @param proposta
     * @param up
     * @param caminho
     * @return
     */
    public PropostaTrabalho setProposta(PropostaTrabalho proposta, UploadPTC up, String caminho, HttpSession session) throws UnsupportedEncodingException {
        String[] pegaDataHora;
        pegaDataHora = getDataHora(1);

        AlunoDao aluno = new AlunoDao();
        ArrayList<Aluno> alunosProposta = aluno.getLista();

        ServidorDao servidor = new ServidorDao();
        ArrayList<Servidor> servidorProposta = servidor.getLista();

        Aluno novoAluno1 = new Aluno();
        Aluno novoAluno2 = new Aluno();
        Servidor orientador = new Servidor();
        Servidor coorientador = new Servidor();

        if (String.valueOf(up.getForm().get("idAluno02")).equals("0")) {
            novoAluno2.setIdAluno(0);
            proposta.setAluno2(novoAluno2);
        } else {
            for (int i = 0; i < alunosProposta.size(); i++) {
                if (alunosProposta.get(i).getIdAluno() == Integer.parseInt(String.valueOf(up.getForm().get("idAluno02")))) {
                    novoAluno2.setNome(alunosProposta.get(i).getNome());
                    novoAluno2.setIdAluno(alunosProposta.get(i).getIdAluno());
                    novoAluno2.setCpf(alunosProposta.get(i).getCpf());
                    novoAluno2.setDataNascimento(alunosProposta.get(i).getDataNascimento());
                    novoAluno2.setEmail(alunosProposta.get(i).getEmail());
                    novoAluno2.setMatricula(alunosProposta.get(i).getMatricula());
                    novoAluno2.setTipo(alunosProposta.get(i).getTipo());
                    novoAluno2.setTelefone(alunosProposta.get(i).getTelefone());
                    novoAluno2.setSenha(alunosProposta.get(i).getSenha());
                }
            }
            //System.out.println("Inseriu novoAluno2");
            proposta.setAluno2(novoAluno2);
        }

        if (String.valueOf(up.getForm().get("idCoorientador")).equals("0")) {
            coorientador.setIdServidor(0);
            proposta.setCoorientador(coorientador);
        } else {
            for (int i = 0; i < servidorProposta.size(); i++) {
                if (servidorProposta.get(i).getIdServidor() == Integer.parseInt(String.valueOf(up.getForm().get("idCoorientador")))) {
                    coorientador.setNome(servidorProposta.get(i).getNome());
                    coorientador.setIdServidor(servidorProposta.get(i).getIdServidor());
                    coorientador.setCpf(servidorProposta.get(i).getCpf());
                    coorientador.setDataNascimento(servidorProposta.get(i).getDataNascimento());
                    coorientador.setEmail(servidorProposta.get(i).getEmail());
                    coorientador.setSiape(servidorProposta.get(i).getSiape());
                    coorientador.setTipo(servidorProposta.get(i).getTipo());
                    coorientador.setTelefone(servidorProposta.get(i).getTelefone());
                    coorientador.setSenha(servidorProposta.get(i).getSenha());
                }
            }
            //System.out.println("Inseriu Coorien.");
            proposta.setCoorientador(coorientador);
        }

        for (int i = 0; i < alunosProposta.size(); i++) {
            if (alunosProposta.get(i).getIdAluno() == Integer.parseInt(String.valueOf(up.getForm().get("idAluno01")))) {
                novoAluno1.setNome(alunosProposta.get(i).getNome());
                novoAluno1.setIdAluno(alunosProposta.get(i).getIdAluno());
                novoAluno1.setCpf(alunosProposta.get(i).getCpf());
                novoAluno1.setDataNascimento(alunosProposta.get(i).getDataNascimento());
                novoAluno1.setEmail(alunosProposta.get(i).getEmail());
                novoAluno1.setMatricula(alunosProposta.get(i).getMatricula());
                novoAluno1.setTipo(alunosProposta.get(i).getTipo());
                novoAluno1.setTelefone(alunosProposta.get(i).getTelefone());
                novoAluno1.setSenha(alunosProposta.get(i).getSenha());
            }
        }
        proposta.setAluno1(novoAluno1);

        for (int i = 0; i < servidorProposta.size(); i++) {
            if (servidorProposta.get(i).getIdServidor() == Integer.parseInt(String.valueOf(up.getForm().get("idOrientador")))) {
                orientador.setNome(servidorProposta.get(i).getNome());
                orientador.setIdServidor(servidorProposta.get(i).getIdServidor());
                orientador.setCpf(servidorProposta.get(i).getCpf());
                orientador.setDataNascimento(servidorProposta.get(i).getDataNascimento());
                orientador.setEmail(servidorProposta.get(i).getEmail());
                orientador.setSiape(servidorProposta.get(i).getSiape());
                orientador.setTipo(servidorProposta.get(i).getTipo());
                orientador.setTelefone(servidorProposta.get(i).getTelefone());
                orientador.setSenha(servidorProposta.get(i).getSenha());
            }
        }
        proposta.setOrientador(orientador);
        
        proposta.setTitulo(convertString(String.valueOf(up.getForm().get("tituloPTC"))));
        proposta.setCaminhoArquivo(caminho);
        proposta.setDataEnvio(pegaDataHora[0]);
        proposta.setHoraEnvio(pegaDataHora[1]);

        return proposta;
    }

    /**
     * Método responsável pela manipulação da data para inserção no banco de
     * dados. Utilize: 1 para datas no formato Ano-Mês-Dia 0 para datas no
     * formato Dia-Mês-Ano
     *
     * @param tipo
     * @return
     */
    public static String[] getDataHora(int tipo) {

        if (tipo == 1) {
            Date agora = new Date();
            SimpleDateFormat dF = new SimpleDateFormat("yyyy-MM-dd");

            String dataHoraSistema;
            dataHoraSistema = dF.format(agora) + ";" + agora.getHours() + ":"
                    + "" + agora.getMinutes() + ":" + agora.getSeconds();

            String[] horaData = dataHoraSistema.split(";|;\\s");
            return horaData;
        } else {
            Date agora = new Date();
            SimpleDateFormat dF = new SimpleDateFormat("dd-MM-yyyy");

            String dataHoraSistema;
            dataHoraSistema = dF.format(agora) + ";" + agora.getHours() + ":"
                    + "" + agora.getMinutes() + ":" + agora.getSeconds();

            String[] horaData = dataHoraSistema.split(";|;\\s");
            return horaData;
        }
    }

    /**
     * Método responsável pela verificação da tipagem do arquivo
     *
     * @param up
     * @return
     */
    public static int getTipoArquivo(UploadPTC up) {
        String arquivo = up.getFiles().get(0);
        if (arquivo.endsWith(".pdf")) {
            return 1;
        }
        return 0;
    }

        /**
     * Retorna String do tipo UTF-8
     *
     * @param texto
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String convertString(String texto) throws UnsupportedEncodingException {
        byte[] valor = texto.getBytes();
        String nTexto = new String(valor, "UTF-8");
        return nTexto;
    }
    
}
