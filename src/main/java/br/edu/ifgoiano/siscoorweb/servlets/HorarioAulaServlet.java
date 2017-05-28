/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.ifgoiano.siscoorweb.servlets;

import br.edu.ifgoiano.siscoorweb.modelos.Curso;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "HorarioAulaServlet", urlPatterns = {"/HorarioAulaServlet"})
public class HorarioAulaServlet extends HttpServlet {

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

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("segunda1prof").equals("Em branco")) {
            request.setAttribute("segunda1prof", "");
        } else {
            request.setAttribute("segunda1prof", request.getParameter("segunda1prof"));
        }

        if (request.getParameter("segunda2prof").equals("Em branco")) {
            request.setAttribute("segunda2prof", "");
        } else {
            request.setAttribute("segunda2prof", request.getParameter("segunda2prof"));
        }

        if (request.getParameter("segunda3prof").equals("Em branco")) {
            request.setAttribute("segunda3prof", "");
        } else {
            request.setAttribute("segunda3prof", request.getParameter("segunda3prof"));
        }

        if (request.getParameter("segunda4prof").equals("Em branco")) {
            request.setAttribute("segunda4prof", "");
        } else {
            request.setAttribute("segunda4prof", request.getParameter("segunda4prof"));
        }

        if (!(request.getParameter("segunda5prof") == null || request.getParameter("segunda6prof") == null || request.getParameter("segunda7prof") == null || request.getParameter("segunda8prof") == null)) {
            if (request.getParameter("segunda5prof").equals("Em branco")) {
                request.setAttribute("segunda5prof", "");
            } else {
                request.setAttribute("segunda5prof", request.getParameter("segunda5prof"));
            }

            if (request.getParameter("segunda6prof").equals("Em branco")) {
                request.setAttribute("segunda6prof", "");
            } else {
                request.setAttribute("segunda6prof", request.getParameter("segunda6prof"));
            }

            if (request.getParameter("segunda7prof").equals("Em branco")) {
                request.setAttribute("segunda7prof", "");
            } else {
                request.setAttribute("segunda7prof", request.getParameter("segunda7prof"));
            }

            if (request.getParameter("segunda8prof").equals("Em branco")) {
                request.setAttribute("segunda8prof", "");
            } else {
                request.setAttribute("segunda8prof", request.getParameter("segunda8prof"));
            }
        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("segunda1disc").equals("Em branco")) {
            request.setAttribute("segunda1disc", "");
        } else {
            request.setAttribute("segunda1disc", request.getParameter("segunda1disc"));
        }

        if (request.getParameter("segunda2disc").equals("Em branco")) {
            request.setAttribute("segunda2disc", "");
        } else {
            request.setAttribute("segunda2disc", request.getParameter("segunda2disc"));
        }

        if (request.getParameter("segunda3disc").equals("Em branco")) {
            request.setAttribute("segunda3disc", "");
        } else {
            request.setAttribute("segunda3disc", request.getParameter("segunda3disc"));
        }

        if (request.getParameter("segunda4disc").equals("Em branco")) {
            request.setAttribute("segunda4disc", "");
        } else {
            request.setAttribute("segunda4disc", request.getParameter("segunda4disc"));
        }

        if (!(request.getParameter("segunda5disc") == null || request.getParameter("segunda6disc") == null || request.getParameter("segunda7disc") == null || request.getParameter("segunda8disc") == null)) {
            if (request.getParameter("segunda5disc").equals("Em branco")) {
                request.setAttribute("segunda5disc", "");
            } else {
                request.setAttribute("segunda5disc", request.getParameter("segunda5disc"));
            }

            if (request.getParameter("segunda6disc").equals("Em branco")) {
                request.setAttribute("segunda6disc", "");
            } else {
                request.setAttribute("segunda6disc", request.getParameter("segunda6disc"));
            }

            if (request.getParameter("segunda7disc").equals("Em branco")) {
                request.setAttribute("segunda7disc", "");
            } else {
                request.setAttribute("segunda7disc", request.getParameter("segunda7disc"));
            }

            if (request.getParameter("segunda8disc").equals("Em branco")) {
                request.setAttribute("segunda8disc", "");
            } else {
                request.setAttribute("segunda8disc", request.getParameter("segunda8disc"));
            }
        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("terca1prof").equals("Em branco")) {
            request.setAttribute("terca1prof", "");
        } else {
            request.setAttribute("terca1prof", request.getParameter("terca1prof"));
        }

        if (request.getParameter("terca2prof").equals("Em branco")) {
            request.setAttribute("terca2prof", "");
        } else {
            request.setAttribute("terca2prof", request.getParameter("terca2prof"));
        }

        if (request.getParameter("terca3prof").equals("Em branco")) {
            request.setAttribute("terca3prof", "");
        } else {
            request.setAttribute("terca3prof", request.getParameter("terca3prof"));
        }

        if (request.getParameter("terca4prof").equals("Em branco")) {
            request.setAttribute("terca4prof", "");
        } else {
            request.setAttribute("terca4prof", request.getParameter("terca4prof"));
        }

        if (!(request.getParameter("terca5prof") == null || request.getParameter("terca6prof") == null || request.getParameter("terca7prof") == null || request.getParameter("terca8prof") == null)) {

            if (request.getParameter("terca5prof").equals("Em branco")) {
                request.setAttribute("terca5prof", "");
            } else {
                request.setAttribute("terca5prof", request.getParameter("terca5prof"));
            }

            if (request.getParameter("terca6prof").equals("Em branco")) {
                request.setAttribute("terca6prof", "");
            } else {
                request.setAttribute("terca6prof", request.getParameter("terca6prof"));
            }

            if (request.getParameter("terca7prof").equals("Em branco")) {
                request.setAttribute("terca7prof", "");
            } else {
                request.setAttribute("terca7prof", request.getParameter("terca7prof"));
            }

            if (request.getParameter("terca8prof").equals("Em branco")) {
                request.setAttribute("terca8prof", "");
            } else {
                request.setAttribute("terca8prof", request.getParameter("terca8prof"));
            }

        }
        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("terca1disc").equals("Em branco")) {
            request.setAttribute("terca1disc", "");
        } else {
            request.setAttribute("terca1disc", request.getParameter("terca1disc"));
        }

        if (request.getParameter("terca2disc").equals("Em branco")) {
            request.setAttribute("terca2disc", "");
        } else {
            request.setAttribute("terca2disc", request.getParameter("terca2disc"));
        }

        if (request.getParameter("terca3disc").equals("Em branco")) {
            request.setAttribute("terca3disc", "");
        } else {
            request.setAttribute("terca3disc", request.getParameter("terca3disc"));
        }

        if (request.getParameter("terca4disc").equals("Em branco")) {
            request.setAttribute("terca4disc", "");
        } else {
            request.setAttribute("terca4disc", request.getParameter("terca4disc"));
        }

        if (!(request.getParameter("terca5disc") == null || request.getParameter("terca6disc") == null || request.getParameter("terca7disc") == null || request.getParameter("terca8disc") == null)) {

            if (request.getParameter("terca5disc").equals("Em branco")) {
                request.setAttribute("terca5disc", "");
            } else {
                request.setAttribute("terca5disc", request.getParameter("terca5disc"));
            }

            if (request.getParameter("terca6disc").equals("Em branco")) {
                request.setAttribute("terca6disc", "");
            } else {
                request.setAttribute("terca6disc", request.getParameter("terca6disc"));
            }

            if (request.getParameter("terca7disc").equals("Em branco")) {
                request.setAttribute("terca7disc", "");
            } else {
                request.setAttribute("terca7disc", request.getParameter("terca7disc"));
            }

            if (request.getParameter("terca8disc").equals("Em branco")) {
                request.setAttribute("terca8disc", "");
            } else {
                request.setAttribute("terca8disc", request.getParameter("terca8disc"));
            }

        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("quarta1prof").equals("Em branco")) {
            request.setAttribute("quarta1prof", "");
        } else {
            request.setAttribute("quarta1prof", request.getParameter("quarta1prof"));
        }

        if (request.getParameter("quarta2prof").equals("Em branco")) {
            request.setAttribute("quarta2prof", "");
        } else {
            request.setAttribute("quarta2prof", request.getParameter("quarta2prof"));
        }

        if (request.getParameter("quarta3prof").equals("Em branco")) {
            request.setAttribute("quarta3prof", "");
        } else {
            request.setAttribute("quarta3prof", request.getParameter("quarta3prof"));
        }

        if (request.getParameter("quarta4prof").equals("Em branco")) {
            request.setAttribute("quarta4prof", "");
        } else {
            request.setAttribute("quarta4prof", request.getParameter("quarta4prof"));
        }

        if (!(request.getParameter("quarta5prof") == null || request.getParameter("quarta6prof") == null || request.getParameter("quarta7prof") == null || request.getParameter("quarta8prof") == null)) {
            if (request.getParameter("quarta5prof").equals("Em branco")) {
                request.setAttribute("quarta5prof", "");
            } else {
                request.setAttribute("quarta5prof", request.getParameter("quarta5prof"));
            }

            if (request.getParameter("quarta6prof").equals("Em branco")) {
                request.setAttribute("quarta6prof", "");
            } else {
                request.setAttribute("quarta6prof", request.getParameter("quarta6prof"));
            }

            if (request.getParameter("quarta7prof").equals("Em branco")) {
                request.setAttribute("quarta7prof", "");
            } else {
                request.setAttribute("quarta7prof", request.getParameter("quarta7prof"));
            }

            if (request.getParameter("quarta8prof").equals("Em branco")) {
                request.setAttribute("quarta8prof", "");
            } else {
                request.setAttribute("quarta8prof", request.getParameter("quarta8prof"));
            }
        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("quarta1disc").equals("Em branco")) {
            request.setAttribute("quarta1disc", "");
        } else {
            request.setAttribute("quarta1disc", request.getParameter("quarta1disc"));
        }

        if (request.getParameter("quarta2disc").equals("Em branco")) {
            request.setAttribute("quarta2disc", "");
        } else {
            request.setAttribute("quarta2disc", request.getParameter("quarta2disc"));
        }

        if (request.getParameter("quarta3disc").equals("Em branco")) {
            request.setAttribute("quarta3disc", "");
        } else {
            request.setAttribute("quarta3disc", request.getParameter("quarta3disc"));
        }

        if (request.getParameter("quarta4disc").equals("Em branco")) {
            request.setAttribute("quarta4disc", "");
        } else {
            request.setAttribute("quarta4disc", request.getParameter("quarta4disc"));
        }

        if (!(request.getParameter("quarta5disc") == null || request.getParameter("quarta6disc") == null || request.getParameter("quarta7disc") == null || request.getParameter("quarta8disc") == null)) {
            if (request.getParameter("quarta5disc").equals("Em branco")) {
                request.setAttribute("quarta5disc", "");
            } else {
                request.setAttribute("quarta5disc", request.getParameter("quarta5disc"));
            }

            if (request.getParameter("quarta6disc").equals("Em branco")) {
                request.setAttribute("quarta6disc", "");
            } else {
                request.setAttribute("quarta6disc", request.getParameter("quarta6disc"));
            }

            if (request.getParameter("quarta7disc").equals("Em branco")) {
                request.setAttribute("quarta7disc", "");
            } else {
                request.setAttribute("quarta7disc", request.getParameter("quarta7disc"));
            }

            if (request.getParameter("quarta8disc").equals("Em branco")) {
                request.setAttribute("quarta8disc", "");
            } else {
                request.setAttribute("quarta8disc", request.getParameter("quarta8disc"));
            }
        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("quinta1prof").equals("Em branco")) {
            request.setAttribute("quinta1prof", "");
        } else {
            request.setAttribute("quinta1prof", request.getParameter("quinta1prof"));
        }

        if (request.getParameter("quinta2prof").equals("Em branco")) {
            request.setAttribute("quinta2prof", "");
        } else {
            request.setAttribute("quinta2prof", request.getParameter("quinta2prof"));
        }

        if (request.getParameter("quinta3prof").equals("Em branco")) {
            request.setAttribute("quinta3prof", "");
        } else {
            request.setAttribute("quinta3prof", request.getParameter("quinta3prof"));
        }

        if (request.getParameter("quinta4prof").equals("Em branco")) {
            request.setAttribute("quinta4prof", "");
        } else {
            request.setAttribute("quinta4prof", request.getParameter("quinta4prof"));
        }
        if (!(request.getParameter("quinta5prof") == null || request.getParameter("quinta6prof") == null || request.getParameter("quinta7prof") == null || request.getParameter("quinta8prof") == null)) {
            if (request.getParameter("quinta5prof").equals("Em branco")) {
                request.setAttribute("quinta5prof", "");
            } else {
                request.setAttribute("quinta5prof", request.getParameter("quinta5prof"));
            }

            if (request.getParameter("quinta6prof").equals("Em branco")) {
                request.setAttribute("quinta6prof", "");
            } else {
                request.setAttribute("quinta6prof", request.getParameter("quinta6prof"));
            }

            if (request.getParameter("quinta7prof").equals("Em branco")) {
                request.setAttribute("quinta7prof", "");
            } else {
                request.setAttribute("quinta7prof", request.getParameter("quinta7prof"));
            }

            if (request.getParameter("quinta8prof").equals("Em branco")) {
                request.setAttribute("quinta8prof", "");
            } else {
                request.setAttribute("quinta8prof", request.getParameter("quinta8prof"));
            }
        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("quinta1disc").equals("Em branco")) {
            request.setAttribute("quinta1disc", "");
        } else {
            request.setAttribute("quinta1disc", request.getParameter("quinta1disc"));
        }

        if (request.getParameter("quinta2disc").equals("Em branco")) {
            request.setAttribute("quinta2disc", "");
        } else {
            request.setAttribute("quinta2disc", request.getParameter("quinta2disc"));
        }

        if (request.getParameter("quinta3disc").equals("Em branco")) {
            request.setAttribute("quinta3disc", "");
        } else {
            request.setAttribute("quinta3disc", request.getParameter("quinta3disc"));
        }

        if (request.getParameter("quinta4disc").equals("Em branco")) {
            request.setAttribute("quinta4disc", "");
        } else {
            request.setAttribute("quinta4disc", request.getParameter("quinta4disc"));
        }

        if (!(request.getParameter("quinta5disc") == null || request.getParameter("quinta6disc") == null || request.getParameter("quinta7disc") == null || request.getParameter("quinta8disc") == null)) {

            if (request.getParameter("quinta5disc").equals("Em branco")) {
                request.setAttribute("quinta5disc", "");
            } else {
                request.setAttribute("quinta5disc", request.getParameter("quinta5disc"));
            }

            if (request.getParameter("quinta6disc").equals("Em branco")) {
                request.setAttribute("quinta6disc", "");
            } else {
                request.setAttribute("quinta6disc", request.getParameter("quinta6disc"));
            }

            if (request.getParameter("quinta7disc").equals("Em branco")) {
                request.setAttribute("quinta7disc", "");
            } else {
                request.setAttribute("quinta7disc", request.getParameter("quinta7disc"));
            }

            if (request.getParameter("quinta8disc").equals("Em branco")) {
                request.setAttribute("quinta8disc", "");
            } else {
                request.setAttribute("quinta8disc", request.getParameter("quinta8disc"));
            }
        }

        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("sexta1prof").equals("Em branco")) {
            request.setAttribute("sexta1prof", "");
        } else {
            request.setAttribute("sexta1prof", request.getParameter("sexta1prof"));
        }

        if (request.getParameter("sexta2prof").equals("Em branco")) {
            request.setAttribute("sexta2prof", "");
        } else {
            request.setAttribute("sexta2prof", request.getParameter("sexta2prof"));
        }

        if (request.getParameter("sexta3prof").equals("Em branco")) {
            request.setAttribute("sexta3prof", "");
        } else {
            request.setAttribute("sexta3prof", request.getParameter("sexta3prof"));
        }

        if (request.getParameter("sexta4prof").equals("Em branco")) {
            request.setAttribute("sexta4prof", "");
        } else {
            request.setAttribute("sexta4prof", request.getParameter("sexta4prof"));
        }

        if (!(request.getParameter("sexta5prof") == null || request.getParameter("sexta6prof") == null || request.getParameter("sexta7prof") == null || request.getParameter("sexta8prof") == null)) {
            if (request.getParameter("sexta5prof").equals("Em branco")) {
                request.setAttribute("sexta5prof", "");
            } else {
                request.setAttribute("sexta5prof", request.getParameter("sexta5prof"));
            }

            if (request.getParameter("sexta6prof").equals("Em branco")) {
                request.setAttribute("sexta6prof", "");
            } else {
                request.setAttribute("sexta6prof", request.getParameter("sexta6prof"));
            }

            if (request.getParameter("sexta7prof").equals("Em branco")) {
                request.setAttribute("sexta7prof", "");
            } else {
                request.setAttribute("sexta7prof", request.getParameter("sexta7prof"));
            }

            if (request.getParameter("sexta8prof").equals("Em branco")) {
                request.setAttribute("sexta8prof", "");
            } else {
                request.setAttribute("sexta8prof", request.getParameter("sexta8prof"));
            }
        }
        //--------------------------------------------------------------------------------------------------
        if (request.getParameter("sexta1disc").equals("Em branco")) {
            request.setAttribute("sexta1disc", "");
        } else {
            request.setAttribute("sexta1disc", request.getParameter("sexta1disc"));
        }

        if (request.getParameter("sexta2disc").equals("Em branco")) {
            request.setAttribute("sexta2disc", "");
        } else {
            request.setAttribute("sexta2disc", request.getParameter("sexta2disc"));
        }

        if (request.getParameter("sexta3disc").equals("Em branco")) {
            request.setAttribute("sexta3disc", "");
        } else {
            request.setAttribute("sexta3disc", request.getParameter("sexta3disc"));
        }

        if (request.getParameter("sexta4disc").equals("Em branco")) {
            request.setAttribute("sexta4disc", "");
        } else {
            request.setAttribute("sexta4disc", request.getParameter("sexta4disc"));
        }

        if (!(request.getParameter("sexta5disc") == null || request.getParameter("sexta6disc") == null || request.getParameter("sexta7disc") == null || request.getParameter("sexta8disc") == null)) {
            if (request.getParameter("sexta5disc").equals("Em branco")) {
                request.setAttribute("sexta5disc", "");
            } else {
                request.setAttribute("sexta5disc", request.getParameter("sexta5disc"));
            }

            if (request.getParameter("sexta6disc").equals("Em branco")) {
                request.setAttribute("sexta6disc", "");
            } else {
                request.setAttribute("sexta6disc", request.getParameter("sexta6disc"));
            }

            if (request.getParameter("sexta7disc").equals("Em branco")) {
                request.setAttribute("sexta7disc", "");
            } else {
                request.setAttribute("sexta7disc", request.getParameter("sexta7disc"));
            }

            if (request.getParameter("sexta8disc").equals("Em branco")) {
                request.setAttribute("sexta8disc", "");
            } else {
                request.setAttribute("sexta8disc", request.getParameter("sexta8disc"));
            }
        }
        //--------------------------------------------------------------------------------------------------
        HttpSession session = request.getSession();
        session.setAttribute("caminho_servlet", "resources");
        session.setAttribute("param_volta_servlet", "../SisCoorWeb");
        session.setAttribute("olho_servlet_horario", "ok");

        System.out.println(session.getAttribute("curso_horario"));
        
        Curso curso = (Curso)session.getAttribute("curso_horario");
        RequestDispatcher dispatcher = request.getRequestDispatcher("horario_de_aulas/horario_"+curso.getTurno()+".jsp");
        dispatcher.forward(request, response);

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
