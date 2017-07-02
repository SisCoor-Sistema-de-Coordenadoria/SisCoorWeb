/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;


import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
import br.edu.ifgoiano.siscoorweb.utilitarios.Criptografia;
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
       HttpSession session = request.getSession();
        
            ServidorDao sdao = new ServidorDao();
            Servidor s = new Servidor();
            
           
          String ssiape=request.getParameter("siape");
          String ssenha=Criptografia.criptografar(request.getParameter("senha")).toLowerCase();
          
          
          s.setSiape(ssiape);
          s.setSenha(ssenha);
          
          Servidor sautenticado = sdao.auntenticacao(s);
          if(sautenticado != null){
              session.removeAttribute("erro_login");
              session.setAttribute("nomeUsuario", sautenticado.getNome());
              response.sendRedirect("logado.jsp");
          }else{
              if(request.getParameter("siape").isEmpty()||request.getParameter("senha").isEmpty()){
                  session.setAttribute("erro_login", "vazio");
              }else{
                  session.setAttribute("erro_login", "validacao");
              }
              response.sendRedirect("tela_login/login_servidor.jsp");
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
