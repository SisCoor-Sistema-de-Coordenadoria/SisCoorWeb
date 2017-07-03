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
import br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
import static br.edu.ifgoiano.siscoorweb.servlets.UploadServlet.getDataHora;
import br.edu.ifgoiano.siscoorweb.utilitarios.UploadPTC;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
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
@WebServlet(name = "PTCServlet", urlPatterns = {"/PTCServlet"})
public class PTCServlet extends HttpServlet {

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

        try {
            String[] valores = separaValores(request, response);

            if (request.getParameter("btn").equals("download")) {
                System.out.println("Fazer Download");
            }
            if (request.getParameter("btn").equals("Voltar")) {
                btnVoltar(request, response);
            }
            if (valores[0].equals("excluir")) {
                btnExcluir(request, response, Integer.parseInt(valores[1]));
            }
        } catch (Exception e) {
            UploadPTC up = new UploadPTC();
            up.setFolderUpload("uploadsPTC");

            editarProposta(request, response, up);
        }
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
     * Método Responsável pelo Download do Arquivo.
     *
     * @param request
     * @param response
     * @throws IOException
     */
    public static void downloadArquivo(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PropostaDAO download = new PropostaDAO();
        ArrayList<PropostaTrabalho> arquivos = download.getLista();

        File arquivo = new File(arquivos.get(Integer.valueOf(String.valueOf(request.getAttribute("idProposta")))).getCaminhoArquivo());
        Path path = arquivo.toPath();
        String nome = arquivo.getName();
        int tamanho = (int) arquivo.length();

        response.setContentType("Adobe_Acrobat_Document/pdf");
        response.setContentLength(tamanho);
        response.setHeader("Content-Disposition", "attachament; filename=\"" + nome + "\"");
        OutputStream output = response.getOutputStream();
        Files.copy(path, output);
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
     * Chamada para o método de exclusão de dados de proposta
     *
     * @param request
     * @param response
     * @throws java.io.IOException
     */
    public void btnExcluir(HttpServletRequest request, HttpServletResponse response, int idProposta) throws IOException {
        HttpSession session = request.getSession();
        PropostaDAO ptxLixo = new PropostaDAO();
        PropostaTrabalho propostaArquivo = ptxLixo.getProposta(idProposta);

        if (apagarArquivo(propostaArquivo.getCaminhoArquivo(), request, response, idProposta)) {
            if (ptxLixo.deletaDados(idProposta) == true) {
                session.setAttribute("msg", "Proposta apagada com sucesso.");
                session.setAttribute("tipo_msg", "sucess");
                response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
            } else {
                session.setAttribute("msg", "Falha ao apagar proposta da pasta. Entre em contato com o Administrador.");
                session.setAttribute("tipo_msg", "sucess");
                response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
            }
        } else {
            session.setAttribute("msg", "Falha ao apagar proposta do banco de dados. Entre em contato com o Administrador.");
            session.setAttribute("tipo_msg", "sucess");
            response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
        }

    }

    /**
     * Apaga arquivo da pasta
     *
     * @param ptxLixo
     * @param request
     * @param response
     * @return
     */
    public static boolean apagarArquivo(String caminho, HttpServletRequest request, HttpServletResponse response, int idProposta) {
        //System.out.println(caminho);
        File up = new File(caminho);
        boolean tentar_pegar = false;
        try {
            tentar_pegar = up.isFile();
        } catch (IndexOutOfBoundsException ex) {
            tentar_pegar = false;
        }
        if (tentar_pegar) {
            try {
                up.delete();
                return true;
            } catch (Exception e) {
                System.out.println(e);
                return false;
            }
        } else {
            return false;
        }
    }

    public static String[] separaValores(HttpServletRequest request, HttpServletResponse response) {
        String captura = request.getParameter("btn");
        String[] valores = captura.split("_|_\\s");
        return valores;
    }

    public boolean editarProposta(HttpServletRequest request, HttpServletResponse response, UploadPTC up) throws IOException {
        HttpSession session = request.getSession();
        if (up.formProcess(getServletContext(), request)) {
            PropostaTrabalho propostaUpdate = new PropostaTrabalho();
            try {
                String.valueOf(up.getFiles().get(0));
                //System.out.println("Editar alterando arquivo");

                String appPath = request.getServletContext().getRealPath("");
                // constructs path of the directory to save uploaded file
                String savePath = appPath + File.separator + up.getFolderUpload();
                //System.out.println(savePath);

                String caminhoNovo = savePath + File.separator + up.getFiles().get(0);
                propostaUpdate = new PropostaDAO().getProposta(Integer.parseInt(String.valueOf(up.getForm().get("idProposta"))));
                apagarArquivo(propostaUpdate.getCaminhoArquivo(), request, response, 0);
                propostaUpdate = setProposta(propostaUpdate, up, caminhoNovo, session);
                boolean update = new PropostaDAO().atualizaDados(propostaUpdate);
                
                if(update){
                    response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
                }else{
                    response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
                }
                
            } catch (IndexOutOfBoundsException e) {
                System.out.println("Editar sem alterar arquivo");
                String appPath = request.getServletContext().getRealPath("");
                // constructs path of the directory to save uploaded file
                String savePath = appPath + File.separator + up.getFolderUpload();
                //System.out.println(savePath);
                propostaUpdate = new PropostaDAO().getProposta(Integer.parseInt(String.valueOf(up.getForm().get("idProposta"))));
                propostaUpdate = setProposta(propostaUpdate, up, propostaUpdate.getCaminhoArquivo(), session);
                boolean update = new PropostaDAO().atualizaDados(propostaUpdate);
                
                if(update){
                    response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
                }else{
                    response.sendRedirect("proposta_de_tc/crud_ptc.jsp");
                }
            }
        } else {

        }

        return false;
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

        proposta.setTitulo(String.valueOf(up.getForm().get("tituloPTC")));
        proposta.setCaminhoArquivo(caminho);
        proposta.setDataEnvio(pegaDataHora[0]);
        proposta.setHoraEnvio(pegaDataHora[1]);

        return proposta;
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
