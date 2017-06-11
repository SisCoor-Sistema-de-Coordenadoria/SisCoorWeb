/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.PropostaTrabalho;
import br.edu.ifgoiano.siscoorweb.persistencia.PropostaDAO;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
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
        PrintWriter out = response.getWriter();

        if (request.getParameter("btn").equals("download")) {
            //out.println("<h1>"+request.getParameter("idProposta")+"</h1>");
            downloadArquivo(request, response);
        }
        if (request.getParameter("btn").equals("Voltar")) {
            btnVoltar(request, response);
        }
        if (request.getParameter("btn").equals("excluir")) {
            btnExcluir(request, response);
        }
        //downloadArquivo(request, response);
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
     * @param request
     * @param response
     * @throws java.io.IOException
     */
    public void btnExcluir(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        PropostaDAO ptxLixo = new PropostaDAO();
        System.out.println(request.getParameter("idProposta"));
        if (ptxLixo.deletaDados(Integer.valueOf(request.getParameter("idProposta")))) {
            if (apagarArquivo(ptxLixo, request, response)) {
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
     * @param ptxLixo
     * @param request
     * @param response
     * @return 
     */
    public static boolean apagarArquivo(PropostaDAO ptxLixo, HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.valueOf(request.getParameter("idProposta"));
        File up = new File(ptxLixo.getLista().get(id).getCaminhoArquivo());

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
}
