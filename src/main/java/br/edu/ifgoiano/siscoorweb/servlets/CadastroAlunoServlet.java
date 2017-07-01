/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.hotel.utilitarios.ValidaData;
import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao;
import br.edu.ifgoiano.siscoorweb.utilitarios.Criptografia;
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

        if (request.getParameter("bt_cad").equals("voltar")) {
            response.sendRedirect("tela_login/login_aluno.jsp");
        } else {
            boolean erroCpf = false;
            boolean erroEmail = false;
            boolean erroTelefone = false;
            boolean erroDataNasc = false;
            boolean erroMatricula = false;
            boolean erroSenha = false;
            boolean erroVazio = false;

            String snome = request.getParameter("nome");
            String scpf = request.getParameter("cpf");
            String semail = request.getParameter("email");
            String ssenha = request.getParameter("senha");
            String sddd = request.getParameter("ddd");
            String stelefone = request.getParameter("telefone");
            String smatricula = request.getParameter("matricula");
            Date sdata = new Date(1);

            try {
                if (scpf.length() != 11) {
                    session.setAttribute("erro_cadastro", session.getAttribute("erro_cadastro")+"|"+"cpf_inv");
                    erroCpf = true;
                } else {
                    long cpf = Long.parseLong(scpf);
                }
            } catch (NumberFormatException nfe) {
                session.setAttribute("erro_cadastro", session.getAttribute("erro_cadastro")+"|"+"cpf_inv");
                erroCpf = true;
            } finally {
                if (semail.contains("@") && semail.contains(".")) {
                    if ((semail.indexOf("@") != semail.lastIndexOf("@")) || (semail.indexOf("@") >= semail.indexOf(".") || (semail.indexOf(".") - semail.indexOf("@") < 2) || (semail.indexOf("@") == 0 || semail.indexOf(".") == semail.length() - 1))) {
                        session.setAttribute("erro_cadastro", session.getAttribute("erro_cadastro")+"|"+"cpf_inv");
                        erroEmail = true;
                    } else {
                        char[] emailChar = semail.toCharArray();
                        for (int i = 0; i < emailChar.length - 1; i++) {
                            if (emailChar[i] == '.' && emailChar[i + 1] == '.') {
                                session.setAttribute("erro_cadastro", "email_inv");
                                erroEmail = true;
                                break;
                            }
                        }
                    }
                } else {
                    session.setAttribute("erro_cadastro", "email_inv");
                    erro = true;
                }
                if (!erro) {
                    if (sddd.isEmpty() || stelefone.isEmpty()) {
                        erro = true;
                        session.setAttribute("erro_cadastro", "vazio");
                    }
                    if (!erro) {
                        try {
                            int telDdd = Integer.parseInt(sddd);
                            long tel = Long.parseLong(stelefone);
                        } catch (NumberFormatException nfe) {
                            erro = true;
                            session.setAttribute("erro_cadastro", "telefone_inv");
                        } finally {
                            if (!erro) {
                                if (request.getParameter("dataDia").equals("00") || request.getParameter("dataMes").equals("00") || request.getParameter("dataAno").equals("00")) {
                                    session.setAttribute("erro_cadastro", "vazio");
                                    erro = true;
                                }
                                if (!erro) {
                                    try {
                                        if (ValidaData.validaData(Integer.parseInt((String) request.getParameter("dataDia")), Integer.parseInt((String) request.getParameter("dataMes")), Integer.parseInt((String) request.getParameter("dataAno")))) {
                                            sdata = Date.valueOf(request.getParameter("dataAno") + "-" + request.getParameter("dataMes") + "-" + request.getParameter("dataDia"));
                                        } else {
                                            session.setAttribute("erro_cadastro", "data");
                                            erro = true;
                                        }
                                    } catch (IllegalArgumentException iae) {
                                        session.setAttribute("erro_cadastro", "data");
                                        erro = true;
                                    }

                                    if (!erro) {
                                        try {
                                            long matricula = Long.parseLong(smatricula);
                                        } catch (NumberFormatException nfe) {
                                            session.setAttribute("erro_cadastro", "matricula_inv");
                                            erro = true;
                                        } finally {
                                            if (!erro) {
                                                if (ssenha.length() < 6) {
                                                    session.setAttribute("erro_cadastro", "senha_peq");
                                                    erro = true;
                                                }

                                                if (!erro) {
                                                    Aluno a = new Aluno();

                                                    a.setNome(snome);
                                                    a.setCpf(scpf);
                                                    a.setEmail(semail);
                                                    a.setSenha(ssenha);
                                                    a.setTelefone(sddd + stelefone);
                                                    a.setMatricula(smatricula);
                                                    a.setDataNascimento(sdata);

                                                    if (!(a.getCpf().isEmpty() || a.getNome().isEmpty() || a.getEmail().isEmpty() || a.getSenha().isEmpty() || a.getTelefone().isEmpty() || a.getMatricula().isEmpty() || sddd.isEmpty())) {
                                                        AlunoDao adao = new AlunoDao();
                                                        a.setSenha(Criptografia.criptografar(a.getSenha()).toLowerCase());
                                                        adao.adiciona(a);

                                                        session.setAttribute("erro_cadastro", "false");
                                                    } else {
                                                        session.setAttribute("erro_cadastro", "vazio");
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            response.sendRedirect("tela_login/cadastro_aluno.jsp");
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
