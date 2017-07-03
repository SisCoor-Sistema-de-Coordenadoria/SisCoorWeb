/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import br.edu.ifgoiano.siscoorweb.modelos.Curso;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao;
import br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "CadastroAlunoServlet", urlPatterns = {"/CadastroAlunoServlet"})
public class CadastroAlunoServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        AlunoDao alunoDAO = new AlunoDao();
        Aluno aluno = new Aluno();
        Aluno alunoRetorno = new Aluno();
        CursoDAO cursoDAO = new CursoDAO();
        Curso curso = new Curso();
        
        String botao = request.getParameter("botao");
        
        if (request.getParameter("bt_cad")!=null && request.getParameter("bt_cad").equals("voltar")) 
        {
            response.sendRedirect("tela_login/login_aluno.jsp");
        } 
        if(request.getParameter("bt_cad")!=null && request.getParameter("bt_cad").equals("cad"))
        {
            String snome = request.getParameter("nome");
            String scpf = request.getParameter("cpf");
            String semail = request.getParameter("email");
            String ssenha = request.getParameter("senha");
            String stelefone = request.getParameter("telefone");
            String smatricula = request.getParameter("matricula");
            Date sdata = new Date(1);
            try {
                sdata = Date.valueOf(request.getParameter("data"));
            } catch (IllegalArgumentException iae) {
                session.setAttribute("erro_cadastro", "data");
            }
            Aluno a = new Aluno();

            a.setNome(snome);
            a.setCpf(scpf);
            a.setEmail(semail);
            a.setSenha(ssenha);
            a.setTelefone(stelefone);
            a.setMatricula(smatricula);
            a.setDataNascimento(sdata);
            
            if(!(a.getCpf().isEmpty()||a.getNome().isEmpty()||a.getEmail().isEmpty()||a.getSenha().isEmpty()||a.getTelefone().isEmpty()||a.getMatricula().isEmpty())){
                AlunoDao adao = new AlunoDao();
            adao.adiciona(a);
            
            session.setAttribute("erro_cadastro", "false");
            response.sendRedirect("tela_login/cadastro_aluno.jsp");
            } else{
                session.setAttribute("erro_cadastro","vazio");
                response.sendRedirect("tela_login/cadastro_aluno.jsp");
            }
        }
        
        if(request.getParameter("bt_cad")!=null && request.getParameter("bt_cad").equals("Cadastrar"))
        {
            String snome = request.getParameter("nome");
            String scpf = request.getParameter("cpf");
            String semail = request.getParameter("email");
            String ssenha = request.getParameter("senha");
            String stelefone = request.getParameter("telefone");
            String smatricula = request.getParameter("matricula");
            Date sdata = new Date(1);
            try {
                sdata = Date.valueOf(request.getParameter("data"));
            } catch (IllegalArgumentException iae) {
                session.setAttribute("erro_cadastro", "data");
            }
            Aluno a = new Aluno();

            a.setNome(snome);
            a.setCpf(scpf);
            a.setEmail(semail);
            a.setSenha(ssenha);
            a.setTelefone(stelefone);
            a.setMatricula(smatricula);
            a.setDataNascimento(sdata);
            
            if(!(a.getCpf().isEmpty()||a.getNome().isEmpty()||a.getEmail().isEmpty()||a.getSenha().isEmpty()||a.getTelefone().isEmpty()||a.getMatricula().isEmpty())){
                AlunoDao adao = new AlunoDao();
            adao.adiciona(a);
            
            session.setAttribute("erro_cadastro", "false");
            response.sendRedirect("gerenciar_conteudo/adicionar_aluno.jsp");
            } else{
                session.setAttribute("erro_cadastro","vazio");
                response.sendRedirect("gerenciar_conteudo/adicionar_aluno.jsp");
            }
        }
        
        if(botao!=null && botao.equals("Buscar dados"))
        {
            aluno=alunoDAO.buscarPorId(Integer.parseInt(String.valueOf(request.getParameter("idAluno"))));
            curso=cursoDAO.buscarPorId(aluno.getIdCurso());
            aluno.setNomeCurso(curso.getNome());
            session.setAttribute("msg", "Dados encontrados com sucesso.");
            session.setAttribute("tipo_msg", "success");
            session.setAttribute("Dados_excluir_aluno", aluno);
            response.sendRedirect("gerenciar_conteudo/excluir_aluno.jsp");      
        }
        
        if(botao!=null && botao.equals("Excluir"))
        {
            boolean Verificacao=alunoDAO.removerPorId(Integer.parseInt(String.valueOf(request.getParameter("idAluno"))));
            
            if(Verificacao==true)
            {
                session.setAttribute("msg", "Aluno excluido com sucesso.");
                session.setAttribute("tipo_msg", "success");
                response.sendRedirect("gerenciar_conteudo/excluir_aluno.jsp");
            }
            else
            {
                session.setAttribute("msg", "Não foi possivel remover este aluno.");
                session.setAttribute("tipo_msg", "danger");
                response.sendRedirect("gerenciar_conteudo/excluir_aluno.jsp");
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
