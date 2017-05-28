/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Curso;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tarcisio
 */
@WebServlet(name = "VerifCursoServlet", urlPatterns = {"/VerifCursoServlet"})
public class VerifCursoServlet extends HttpServlet {

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
        
        List<Curso> cursos = new ArrayList();
        cursos.add(new Curso("TADS", "matutino"));
        cursos.add(new Curso("Alimentos", "vespertino"));
        cursos.add(new Curso("GTI", "noturno"));
        cursos.add(new Curso("Teste VN", "integral_ves_not"));
        cursos.add(new Curso("Teste MV", "integral_mat_ves"));
        
        PrintWriter out = response.getWriter();
        try {
            if (!cursos.isEmpty()) {
                for (int i = 0; i < cursos.size(); i++) {
                    if (request.getParameter("curso").equals(cursos.get(i).getNome())) {
                        session.setAttribute("curso_horario", cursos.get(i));
                        response.sendRedirect("horario_de_aulas/menu_horario_aula.jsp");
                        break;
                    }
                }
            }
        } finally {
            out.close();
        }
    }
//response.sendRedirect("horario_de_aulas/horario_"+cursos.get(i).getTurno()+".jsp");
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

}
