/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Disciplina;
import br.edu.ifgoiano.siscoorweb.persistencia.DisciplinaDAO;
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
 * @author Diego
 */
@WebServlet(name = "DisciplinaServlet", urlPatterns = {"/DisciplinaServlet"})
public class DisciplinaServlet extends HttpServlet {

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
        String botao = request.getParameter("botao");
        Disciplina disciplina = new Disciplina();
        Disciplina disciplinaRetorno = new Disciplina();
        DisciplinaDAO disciplinaDAO = new DisciplinaDAO();
        
        HttpSession session = request.getSession();
        
        if(botao.equals("Cadastrar"))
        {
            try
            {
                if(request.getParameter("nomeDisciplina").isEmpty() || request.getParameter("cargaHorariaDisciplina").isEmpty())
                {
                    session.setAttribute("msg", "Preencha todos os campos com *.");
                    session.setAttribute("tipo_msg", "danger");
                    response.sendRedirect("gerenciar_conteudo/adicionar_disciplina.jsp");
                }

                else
                {
                    disciplina.setNome(request.getParameter("nomeDisciplina"));
                    disciplina.setCargaHora(Integer.parseInt((String)request.getParameter("cargaHorariaDisciplina")));
                    disciplinaRetorno=disciplinaDAO.jaExiste(disciplina);

                    if(disciplina.getNome().equalsIgnoreCase(disciplinaRetorno.getNome()) && disciplina.getCargaHora()==disciplinaRetorno.getCargaHora())
                    {
                        session.setAttribute("msg", "Esta disciplina ja está cadastrada.");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("gerenciar_conteudo/adicionar_disciplina.jsp");
                    }
                    else
                    {
                        disciplinaDAO.adicionar(disciplina);
                        session.setAttribute("msg", "Disciplina cadastrada com sucesso.");
                        session.setAttribute("tipo_msg", "success");
                        response.sendRedirect("gerenciar_conteudo/adicionar_disciplina.jsp");
                    }   
                } 
            }
            catch(NumberFormatException e)
            {
                session.setAttribute("msg", "Preencha corretamente os campos.");
                session.setAttribute("tipo_msg", "danger");
                response.sendRedirect("gerenciar_conteudo/adicionar_disciplina.jsp");
            }
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

}
