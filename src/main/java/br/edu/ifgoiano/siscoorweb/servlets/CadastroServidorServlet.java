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
import br.edu.ifgoiano.siscoorweb.persistencia.ServidorDao;
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
@WebServlet(name = "CadastroServidorServlet", urlPatterns = {"/CadastroServidorServlet"})
public class CadastroServidorServlet extends HttpServlet {

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
            response.sendRedirect("tela_login/login_servidor.jsp");
        } else {
            boolean erroCpf = false;
            boolean erroEmail = false;
            boolean erroTelefone = false;
            boolean erroDataNasc = false;
            boolean erroSiape = false;
            boolean erroSenha = false;
            boolean erroCSenha = false;
            boolean erroVazio = false;
            boolean erroTermos = false;

            String snome = request.getParameter("nome");
            String scpf = request.getParameter("cpf");
            String semail = request.getParameter("email");
            String ssenha = request.getParameter("senha");
            String sconfirmsenha = request.getParameter("confirm_senha");
            String sddd = request.getParameter("ddd");
            String stelefone = request.getParameter("telefone");
            String ssiape = request.getParameter("siape");
            String sdia = request.getParameter("dataDia");
            String smes = request.getParameter("dataMes");
            String sano = request.getParameter("dataAno");

            if (snome.isEmpty() || scpf.isEmpty() || semail.isEmpty() || ssenha.isEmpty() || sddd.isEmpty() || stelefone.isEmpty() || ssiape.isEmpty() || sconfirmsenha.isEmpty() || sdia.isEmpty() || smes.isEmpty() || sano.isEmpty()) {
                session.setAttribute("erro_cadastro", "vazio");
                erroVazio = true;
            }

            Date sdata = new Date(1);
            try {
                if (scpf.length() != 11 && !scpf.isEmpty()) {
                    session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "cpf_inv" : (session.getAttribute("erro_cadastro") + "|" + "cpf_inv"));
                    erroCpf = true;
                } else if (scpf.isEmpty()); else {
                    long cpf = Long.parseLong(scpf);
                }
            } catch (NumberFormatException nfe) {
                session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "cpf_inv" : (session.getAttribute("erro_cadastro") + "|" + "cpf_inv"));
                erroCpf = true;
            } finally {
                if (semail.contains("@") && semail.contains(".") && !semail.isEmpty()) {
                    if ((semail.indexOf("@") != semail.lastIndexOf("@")) || (semail.indexOf("@") >= semail.indexOf(".") || (semail.indexOf(".") - semail.indexOf("@") < 2) || (semail.indexOf("@") == 0 || semail.indexOf(".") == semail.length() - 1))) {
                        session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "email_inv" : (session.getAttribute("erro_cadastro") + "|" + "email_inv"));
                        erroEmail = true;
                    } else {
                        char[] emailChar = semail.toCharArray();
                        for (int i = 0; i < emailChar.length - 1; i++) {
                            if (emailChar[i] == '.' && emailChar[i + 1] == '.') {
                                session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "email_inv" : (session.getAttribute("erro_cadastro") + "|" + "email_inv"));
                                erroEmail = true;
                                break;
                            }
                        }
                    }
                } else if (semail.isEmpty()); else {
                    session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "email_inv" : (session.getAttribute("erro_cadastro") + "|" + "email_inv"));
                    erroEmail = true;
                }

                try {
                    if (sddd.isEmpty() || stelefone.isEmpty()); else {
                        int telDdd = Integer.parseInt(sddd);
                        long tel = Long.parseLong(stelefone);
                    }
                } catch (NumberFormatException nfe) {
                    erroTelefone = true;
                    session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "telefone_inv" : (session.getAttribute("erro_cadastro") + "|" + "telefone_inv"));
                } finally {
                    try {

                        if (ValidaData.validaData(Integer.parseInt((String) request.getParameter("dataDia")), Integer.parseInt((String) request.getParameter("dataMes")), Integer.parseInt((String) request.getParameter("dataAno"))) && !sdia.equals("00") && !smes.equals("00") && !sano.equals("00")) {
                            sdata = Date.valueOf(request.getParameter("dataAno") + "-" + request.getParameter("dataMes") + "-" + request.getParameter("dataDia"));
                        } else if (sdia.equals("00") || smes.equals("00") || sano.equals("00")); else {
                            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "data" : (session.getAttribute("erro_cadastro") + "|" + "data"));
                            erroDataNasc = true;
                        }
                    } catch (IllegalArgumentException iae) {
                        session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "data" : (session.getAttribute("erro_cadastro") + "|" + "data"));
                        erroDataNasc = true;
                    } finally {
                        try {
                            if (!ssiape.isEmpty()) {
                                long siape = Long.parseLong(ssiape);
                            } else;
                        } catch (NumberFormatException nfe) {
                            session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "siape_inv" : (session.getAttribute("erro_cadastro") + "|" + "siape_inv"));
                            erroSiape = true;
                        } finally {
                            if (ssenha.length() < 6 && !ssenha.isEmpty()) {
                                session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "senha_peq" : (session.getAttribute("erro_cadastro") + "|" + "senha_peq"));
                                erroSenha = true;
                            } else {
                                if (!ssenha.equals(sconfirmsenha) && !ssenha.isEmpty() && !sconfirmsenha.isEmpty()) {
                                    erroCSenha = true;
                                    session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "senhas_dif" : (session.getAttribute("erro_cadastro") + "|" + "senhas_dif"));
                                }
                            }

                            if (!erroCpf && !erroDataNasc && !erroEmail && !erroSiape && !erroSenha && !erroTelefone && !erroCSenha) {
                                String aceite = String.valueOf(request.getParameter("aceito"));
                                if (aceite.equals("null")) {
                                    session.setAttribute("erro_cadastro", (session.getAttribute("erro_cadastro") == null) ? "termos_uso" : (session.getAttribute("erro_cadastro") + "|" + "termos_uso"));
                                } else {
                                    if (!erroVazio) {
                                        Servidor s = new Servidor();

                                        s.setNome(snome);
                                        s.setCpf(scpf);
                                        s.setEmail(semail);
                                        s.setSenha(ssenha);
                                        s.setTelefone(sddd + stelefone);
                                        s.setSiape(ssiape);
                                        s.setDataNascimento(sdata);

                                        ServidorDao sdao = new ServidorDao();
                                        s.setSenha(Criptografia.criptografar(s.getSenha()).toLowerCase());
                                        sdao.adiciona(s);

                                        session.setAttribute("erro_cadastro", "false");
                                    }
                                }
                            }
                        }
                    }
                }
            }
            response.sendRedirect("tela_login/cadastro_servidor.jsp");
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
