/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.hotel.utilitarios.ValidaData;
import br.edu.ifgoiano.siscoorweb.modelos.Aluno;
import br.edu.ifgoiano.siscoorweb.modelos.Servidor;
import br.edu.ifgoiano.siscoorweb.persistencia.AlunoDao;
import br.edu.ifgoiano.siscoorweb.persistencia.CursoDAO;
import br.edu.ifgoiano.siscoorweb.utilitarios.Criptografia;
import br.edu.ifgoiano.siscoorweb.utilitarios.ValidaEmail;
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
        } else if(request.getParameter("bt_cad").equals("cad"))
        {
            boolean erroCpf = false;
            boolean erroEmail = false;
            boolean erroTelefone = false;
            boolean erroDataNasc = false;
            boolean erroMatricula = false;
            boolean erroSenha = false;
            boolean erroCSenha = false;
            boolean erroVazio = false;
            boolean erroCpfCad = false;
            boolean erroEmailCad = false;
            boolean erroMatriculaCad = false;
            boolean erroAceite = false;
        
            String snome = request.getParameter("nome");
            String scpf = request.getParameter("cpf");
            String semail = request.getParameter("email");
            String ssenha = request.getParameter("senha");
            String sconfirmsenha = request.getParameter("confirm_senha");
            String sddd = request.getParameter("ddd");
            String stelefone = request.getParameter("telefone");
            String smatricula = request.getParameter("matricula");
            String sdia = request.getParameter("dataDia");
            String smes = request.getParameter("dataMes");
            String sano = request.getParameter("dataAno");
            String scurso = request.getParameter("curso");

            
            if (scurso.equals("00") || snome.isEmpty() || scpf.isEmpty() || semail.isEmpty() || stelefone.isEmpty() || sddd.isEmpty() || sdia.equals("00") || smes.equals("00") || sano.equals("00") || smatricula.isEmpty() || ssenha.isEmpty() || sconfirmsenha.isEmpty()) {
                erroVazio = true;
            }

            String aceite = String.valueOf(request.getParameter("aceito"));
            if (aceite.equals("null")) {
                erroAceite = true;
            }

            Date sdata = new Date(1);
            try {
                long cpf = Long.parseLong(scpf);

                if (scpf.length() != 11) {
                    erroCpf = true;
                }
            } catch (NumberFormatException nfe) {
                if (scpf.length() != 11 && !scpf.isEmpty()) {
                    erroCpf = true;
                } else if (scpf.isEmpty());
            } finally {
                if (ValidaEmail.validaEmail(semail) && !semail.isEmpty()) {
                    erroEmail = true;
                } else if (semail.isEmpty());
                try {
                    if (sddd.isEmpty() || stelefone.isEmpty()); else {
                        int telDdd = Integer.parseInt(sddd);
                        long tel = Long.parseLong(stelefone);
                    }
                } catch (NumberFormatException nfe) {
                    erroTelefone = true;
                } finally {
                    try {
                        if (ValidaData.validaData(Integer.parseInt((String) request.getParameter("dataDia")), Integer.parseInt((String) request.getParameter("dataMes")), Integer.parseInt((String) request.getParameter("dataAno"))) && !sdia.equals("00") && !smes.equals("00") && !sano.equals("00")) {
                            sdata = Date.valueOf(request.getParameter("dataAno") + "-" + request.getParameter("dataMes") + "-" + request.getParameter("dataDia"));
                        } else if (sdia.equals("00") || smes.equals("00") || sano.equals("00")); else {
                            erroDataNasc = true;
                        }
                    } catch (IllegalArgumentException iae) {
                        erroDataNasc = true;
                    } finally {
                        try {
                            if (!smatricula.isEmpty()) {
                                long matricula = Long.parseLong(smatricula);
                            } else;
                        } catch (NumberFormatException nfe) {
                            erroMatricula = true;
                        } finally {
                            if (ssenha.length() < 6 && !ssenha.isEmpty()) {
                                erroSenha = true;
                            } else {
                                if (!ssenha.equals(sconfirmsenha) && !ssenha.isEmpty() && !sconfirmsenha.isEmpty()) {
                                    erroCSenha = true;
                                }
                            }
                            
                            if (!erroCpf && !erroDataNasc && !erroEmail && !erroMatricula && !erroSenha && !erroTelefone && !erroCSenha && !erroAceite) {

                                if (!erroVazio) {
                                    AlunoDao adao = new AlunoDao();

                                    erroCpfCad = adao.cpfJaCadastrado(scpf);
                                    erroEmailCad = adao.emailJaCadastrado(semail);
                                    erroMatriculaCad = adao.matriculaJaCadastrado(smatricula);

                                    if (!erroCpfCad && !erroEmailCad && !erroMatriculaCad) {
                                        boolean adicionar = adicionarAluno(Integer.parseInt(scurso), snome, scpf, semail, ssenha, sddd, stelefone, smatricula, sdata);
                                        if (adicionar) {
                                            session.setAttribute("erro_cadastro", "false");
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

            }
            setaErrosSessao(session, erroEmail, erroTelefone, erroDataNasc, erroMatricula, erroSenha, erroCSenha, erroVazio, erroCpf, erroAceite, erroEmailCad, erroMatriculaCad, erroCpfCad);

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

    public static boolean adicionarAluno(int idCurso, String snome, String scpf, String semail, String ssenha, String sddd, String stelefone, String smatricula, Date sdata) {
        Aluno a = new Aluno();
        AlunoDao adao = new AlunoDao();
        CursoDAO cdao = new CursoDAO();

        a.setNome(snome);
        a.setCpf(scpf);
        a.setEmail(semail);
        a.setSenha(ssenha);
        a.setTelefone(sddd + stelefone);
        a.setCurso(cdao.buscarPorId(idCurso));
        a.setMatricula(smatricula);
        a.setDataNascimento(sdata);

        a.setSenha(Criptografia.criptografar(a.getSenha()).toLowerCase());
        adao.adiciona(a);
        return true;
    }
    
    /**
     * Método responsável por setar os erros na sessão, para exibir a mensagem
     * adequada na tela de cadastro.
     *
     * @param session
     * @param erroEmail
     * @param erroTelefone
     * @param erroDataNasc
     * @param erroMatricula
     * @param erroSenha
     * @param erroCSenha
     * @param erroVazio
     * @param erroCpf
     * @param erroAceite
     * @param erroEmailCad
     * @param erroMatriculaCad
     * @param erroCpfCad
     */
    public static void setaErrosSessao(HttpSession session, boolean erroEmail, boolean erroTelefone, boolean erroDataNasc, boolean erroMatricula, boolean erroSenha, boolean erroCSenha, boolean erroVazio, boolean erroCpf, boolean erroAceite, boolean erroEmailCad, boolean erroMatriculaCad, boolean erroCpfCad) {
        if (erroVazio) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "vazio" : (session.getAttribute("erro_cadastro") + "|" + "vazio"));
        }

        if (erroSenha) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "senha_peq" : (session.getAttribute("erro_cadastro") + "|" + "senha_peq"));
        }

        if (erroMatricula) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "matricula_inv" : (session.getAttribute("erro_cadastro") + "|" + "matricula_inv"));
        }

        if (erroCpf) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "cpf_inv" : (session.getAttribute("erro_cadastro") + "|" + "cpf_inv"));
        }

        if (erroEmail) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "email_inv" : (session.getAttribute("erro_cadastro") + "|" + "email_inv"));
        }

        if (erroTelefone) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "telefone_inv" : (session.getAttribute("erro_cadastro") + "|" + "telefone_inv"));
        }

        if (erroCSenha) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "senhas_dif" : (session.getAttribute("erro_cadastro") + "|" + "senhas_dif"));
        }

        if (erroAceite) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "termos_uso" : (session.getAttribute("erro_cadastro") + "|" + "termos_uso"));
        }

        if (erroCpfCad) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "cpf_existe" : (session.getAttribute("erro_cadastro") + "|" + "cpf_existe"));
        }

        if (erroMatriculaCad) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "matricula_existe" : (session.getAttribute("erro_cadastro") + "|" + "matricula_existe"));
        }

        if (erroEmailCad) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "email_existe" : (session.getAttribute("erro_cadastro") + "|" + "email_existe"));
        }

        if (erroDataNasc) {
            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "data_inv" : (session.getAttribute("erro_cadastro") + "|" + "data_inv"));
        }
    }
}
