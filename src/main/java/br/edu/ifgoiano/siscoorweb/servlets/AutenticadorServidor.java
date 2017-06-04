/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;


import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
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
 * @author joesi
 */
@WebServlet(name = "AutenticadorServidor", urlPatterns = {"/AutenticadorServidor"})
public class AutenticadorServidor extends HttpServlet {

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
       
          String ssuap=request.getParameter("suap");
          String ssenha=request.getParameter("senha");
          
          Servidor a = new Servidor();
          a.setSiape(ssuap);
          a.setSenha(ssenha);
          ServidorDao adao = new ServidorDao();
          Servidor a_autenticado = adao.autenticacao(a);
          if(a_autenticado != null){
              HttpSession session = request.getSession();
              session.setAttribute("idUsuario", a_autenticado.getIdServidor());
              session.setAttribute("nomeUsuario", a_autenticado.getNome());
              session.setAttribute("senhaUsuario", a_autenticado.getSenha());
              session.setAttribute("emailUsuario", a_autenticado.getEmail());
              session.setAttribute("cpfUsuario", a_autenticado.getCpf());
              session.setAttribute("telefoneUsuario", a_autenticado.getTelefone());
              session.setAttribute("tipoUsuario", a_autenticado.getTipo());
              session.setAttribute("siapUsuario", a_autenticado.getSiape());
              session.setAttribute("dataNascimentoUsu", a_autenticado.getDataNascimento());
              response.sendRedirect("../SisCoorWeb/pag_principal.jsp");              
          }else{
              response.sendRedirect("login_siscoor/ErrorLoginServidor.jsp");
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
