/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.utilitarios.UploadPTC;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UploadServletPTC", urlPatterns = {"/UploadServletPTC"})
public class UploadServletPTC extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
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

    public void uploadArquivo(HttpServletRequest request, HttpServletResponse response, UploadPTC up)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + up.getFolderUpload();

        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        if (up.formProcess(getServletContext(), request)) {
            if (String.valueOf(up.getForm().get("btn_propostaSubmit")).equals("Voltar")) {
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
                        || String.valueOf(up.getForm().get("aluno01")).isEmpty()
                        || String.valueOf(up.getForm().get("idOrientador")).isEmpty()) {

                    try {
                        File fileApaga = new File(savePath + File.separator + up.getFiles().get(0));
                        fileApaga.delete();
                    } catch (Exception e) {
                        System.out.println(e);
                    } finally {
                        session.setAttribute("msg", "Por favor, preencha todos os campos obrigatórios.");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("proposta_de_tc/proposta_trabalho_curso.jsp");
                    }
                } else {
                    session.setAttribute("msg", "Trabalho submetido com sucesso");
                    session.setAttribute("tipo_msg", "success");
                    response.sendRedirect("proposta_de_tc/proposta_trabalho_curso.jsp");
                }
            }
        } else {
            //out.println(caminho + "<br>");
        }
    }

    public void btnVoltar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("proposta_de_tc/menu_ptc.jsp");
    }
}
