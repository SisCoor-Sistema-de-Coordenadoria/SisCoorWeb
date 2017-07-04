/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Banca;
import br.edu.ifgoiano.siscoorweb.modelos.DefesaTC;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.DefesaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Naiane
 */
@WebServlet(name = "DefesaTCServlet", urlPatterns = {"/DefesaTCServlet"})
public class DefesaTCServlet extends HttpServlet {

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
        DefesaTC def = new DefesaTC();
        DefesaDAO dao = new DefesaDAO();
        String botao = request.getParameter("botao");
        HttpSession session = request.getSession();
        
        //Faz a busca dos dados da proposta e leva os dados para o coordenador
        if(botao.equals("Buscar dados")){
            if(request.getParameter("idTrabalho")==null){
                session.setAttribute("msg", "Escolha uma proposta.");
                session.setAttribute("tipo_msg", "danger");
                //retorna msg de erro
                response.sendRedirect("defesa_de_tc/agendar_defesa_tc.jsp");
            }else{
                def.setId(Integer.parseInt(request.getParameter("idTrabalho")));
                def = dao.buscar(def);
                if(def!=null){
                    session.setAttribute("aluno1", def.getProposta().getAluno1().getNome());
                    session.setAttribute("aluno2", def.getProposta().getAluno2().getNome());
                    session.setAttribute("orientador", def.getProposta().getOrientador().getNome());
                    session.setAttribute("coorientador", def.getProposta().getCoorientador().getNome());
                    session.setAttribute("banca1",  def.getBanca().getLista().get(0));
                    session.setAttribute("banca2", def.getBanca().getLista().get(1));
                    session.setAttribute("banca3", def.getBanca().getLista().get(2));
                    response.sendRedirect("defesa_de_tc/agendar_defesa_tc.jsp");
                }
            }
        }
        
        //Guarda os dados da defesa no BD
        else if(botao.equals("Agendar Defesa")){
            //Verifica se algum campo obrigatório está vazio
            if(request.getParameter("idTrabalho")==null || request.getParameter("aluno1").isEmpty() ||
                    request.getParameter("orientador").isEmpty() || request.getParameter("banca1").isEmpty()
                    || request.getParameter("banca2").isEmpty() || request.getParameter("banca3").isEmpty()){
                session.setAttribute("msg", "Preencha todos os campos.");
                session.setAttribute("tipo_msg", "danger");
                //retorna msg de erro
                response.sendRedirect("defesa_de_tc/agendar_defesa_tc.jsp");
            }
            
            //Persiste os dados
            else{
                //Cria lista de servidores que compoem a banca
                Banca banca = new Banca();
                Servidor serv = new Servidor();
                ArrayList<Servidor> listaServ = new ArrayList();
                
            }
        }
        //Gera iText e salva onde o usuario desejar
        else if(botao.equals("Exportar como PDF")){
            
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
