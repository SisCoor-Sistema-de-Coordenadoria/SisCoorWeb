/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Curso;
import br.edu.ifgoiano.siscoorweb.modelos.Disciplina;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO;
import br.edu.ifgoiano.siscoorweb.persistencia.DisciplinaDAO;
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
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
 * @author Diego
 */
@WebServlet(name = "CursoServlet", urlPatterns = {"/CursoServlet"})
public class CursoServlet extends HttpServlet {

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
        String botao_editar = request.getParameter("botao_editar");
        Curso curso = new Curso();
        Curso cursoRetorno = new Curso();
        CursoDAO cursoDAO = new CursoDAO();
        ServidorDao servidorDAO = new ServidorDao();
        Servidor servidorRetorno = new Servidor();
        Servidor servidor = new Servidor();
        
        HttpSession session = request.getSession();
        
        if(botao!=null && botao.equals("Cadastrar"))
        {
            try
            {
                if(request.getParameter("nomeCurso").isEmpty() || request.getParameter("nomeTurno").isEmpty() || request.getParameter("numeroDePeriodos").isEmpty() || request.getParameter("nomeCoordenador").isEmpty())
                {
                    session.setAttribute("msg", "Preencha todos os campos com *.");
                    session.setAttribute("tipo_msg", "danger");
                    response.sendRedirect("gerenciar_conteudo/adicionar_curso.jsp");
                }

                else
                {
                    curso.setNome(request.getParameter("nomeCurso"));
                    curso.setTurno(request.getParameter("nomeTurno"));
                    curso.setNumDePeriodos(Integer.parseInt((String)request.getParameter("numeroDePeriodos")));
                    servidor.setNome(request.getParameter("nomeCoordenador"));
                    servidorRetorno=servidorDAO.buscaPorNome(servidor);
                    curso.setIdProfessorCoordenador(servidorRetorno.getIdServidor());
                    cursoRetorno=cursoDAO.jaExiste(curso);
                    
                    if(curso.getNome().equalsIgnoreCase(cursoRetorno.getNome()) && curso.getTurno().equals(cursoRetorno.getTurno()) && curso.getIdProfessorCoordenador()==cursoRetorno.getIdProfessorCoordenador() && curso.getNumDePeriodos()==cursoRetorno.getNumDePeriodos())
                    {
                        session.setAttribute("msg", "Este curso ja está cadastrado.");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("gerenciar_conteudo/adicionar_curso.jsp");
                    }
                    else
                    {
                        cursoDAO.adicionar(curso);
                        session.setAttribute("msg", "Curso cadastrado com sucesso.");
                        session.setAttribute("tipo_msg", "success");
                        response.sendRedirect("gerenciar_conteudo/adicionar_curso.jsp");
                    }   
                } 
            }
            catch(NumberFormatException e)
            {
                session.setAttribute("msg", "Preencha corretamente os campos.");
                session.setAttribute("tipo_msg", "danger");
                response.sendRedirect("gerenciar_conteudo/adicionar_curso.jsp");
            }
        }
        
       if(botao!=null && botao.equals("Buscar dados"))
        {
            curso=cursoDAO.buscarPorId(Integer.parseInt(String.valueOf(request.getParameter("idCurso"))));
            servidorRetorno=servidorDAO.buscaPorId(curso.getIdProfessorCoordenador());
            curso.setNomeCoordenador(servidorRetorno.getNome());
            session.setAttribute("msg", "Dados encontrados com sucesso.");
            session.setAttribute("tipo_msg", "success");
            session.setAttribute("Dados_excluir_curso", curso);
            response.sendRedirect("gerenciar_conteudo/excluir_curso.jsp");      
        }
        
        if(botao!=null && botao.equals("Excluir"))
        {
            boolean Verificacao=cursoDAO.removerPorId(Integer.parseInt(String.valueOf(request.getParameter("idCurso"))));
            
            if(Verificacao==true)
            {
                session.setAttribute("msg", "Curso excluido com sucesso.");
                session.setAttribute("tipo_msg", "success");
                response.sendRedirect("gerenciar_conteudo/excluir_curso.jsp");
            }
            else
            {
                session.setAttribute("msg", "Não foi possivel remover este curso.");
                session.setAttribute("tipo_msg", "danger");
                response.sendRedirect("gerenciar_conteudo/excluir_curso.jsp");
            }
        }
        
        if(botao_editar!=null && botao_editar.equals("Buscar dados"))
        {
            curso=cursoDAO.buscarPorId(Integer.parseInt(String.valueOf(request.getParameter("idCurso"))));
            servidor=servidorDAO.buscaPorId(curso.getIdProfessorCoordenador());
            curso.setNomeCoordenador(servidor.getNome());
            session.setAttribute("msg", "Dados encontrados com sucesso.");
            session.setAttribute("tipo_msg", "success");
            session.setAttribute("Dados_editar_curso", curso);
            response.sendRedirect("gerenciar_conteudo/editar_curso.jsp");      
        }
        
        if(botao_editar!=null && botao_editar.equals("Salvar"))
        {
            try
            {
                if(request.getParameter("nomeCurso").isEmpty() || request.getParameter("nomeTurno").isEmpty() || request.getParameter("numeroDePeriodos").isEmpty() || request.getParameter("nomeCoordenador").isEmpty())
                {
                    session.setAttribute("msg", "Preencha todos os campos com *.");
                    session.setAttribute("tipo_msg", "danger");
                    response.sendRedirect("gerenciar_conteudo/editar_curso.jsp");
                }

                else
                {
                    curso.setNome(request.getParameter("nomeCurso"));
                    curso.setTurno(request.getParameter("nomeTurno"));
                    curso.setIdCurso(Integer.parseInt(String.valueOf(request.getParameter("codigo"))));
                    curso.setNumDePeriodos(Integer.parseInt((String)request.getParameter("numeroDePeriodos")));
                    servidor.setIdServidor(Integer.parseInt(String.valueOf(request.getParameter("nomeCoordenador"))));
                    servidorRetorno=servidorDAO.buscaPorId(servidor.getIdServidor());
                    curso.setIdProfessorCoordenador(servidorRetorno.getIdServidor());
                    curso.setNomeCoordenador(servidorRetorno.getNome());
                    cursoRetorno=cursoDAO.jaExiste(curso);

                    if(curso.getNome().equalsIgnoreCase(cursoRetorno.getNome()) && curso.getTurno().equals(cursoRetorno.getTurno()) && curso.getIdProfessorCoordenador()==cursoRetorno.getIdProfessorCoordenador() && curso.getNumDePeriodos()==cursoRetorno.getNumDePeriodos())
                    {
                        session.setAttribute("msg", "Este curso ja está cadastrado.");
                        session.setAttribute("tipo_msg", "danger");
                        response.sendRedirect("gerenciar_conteudo/editar_curso.jsp");
                    }
                    else
                    {
                        System.out.println(curso.getNome());
                        System.out.println(curso.getIdCurso());
                        System.out.println(curso.getIdProfessorCoordenador());
                        System.out.println(curso.getNumDePeriodos());
                        System.out.println(curso.getTurno());
                        
                        cursoDAO.alterarPorId(curso);
                        session.setAttribute("msg", "Curso alterado com sucesso.");
                        session.setAttribute("tipo_msg", "success");
                        response.sendRedirect("gerenciar_conteudo/editar_curso.jsp");
                    }   
                } 
            }
            catch(NumberFormatException e)
            {
                session.setAttribute("msg", "Preencha corretamente os campos.");
                session.setAttribute("tipo_msg", "danger");
                response.sendRedirect("gerenciar_conteudo/editar_curso.jsp");
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
