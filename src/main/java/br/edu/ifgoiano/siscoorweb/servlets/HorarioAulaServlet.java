/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.edu.ifgoiano.siscoorweb.servlets;

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
        request.setCharacterEncoding("UTF-8");
        
        //--------------------------------------------------------------------------------------------------
        
        
        if(request.getParameter("segunda1prof").equals("Em branco")){
            request.setAttribute("segunda1prof", "");
        }else{
            request.setAttribute("segunda1prof", request.getParameter("segunda1prof"));
        }
        
        if(request.getParameter("segunda2prof").equals("Em branco")){
            request.setAttribute("segunda2prof", "");
        }else{
            request.setAttribute("segunda2prof", request.getParameter("segunda2prof"));
        }
        
        if(request.getParameter("segunda3prof").equals("Em branco")){
            request.setAttribute("segunda3prof", "");
        }else{
            request.setAttribute("segunda3prof", request.getParameter("segunda3prof"));
        }
        
        if(request.getParameter("segunda4prof").equals("Em branco")){
            request.setAttribute("segunda4prof", "");
        }else{
            request.setAttribute("segunda4prof", request.getParameter("segunda4prof"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("segunda1disc").equals("Em branco")){
            request.setAttribute("segunda1disc", "");
        }else{
            request.setAttribute("segunda1disc", request.getParameter("segunda1disc"));
        }
        
        if(request.getParameter("segunda2disc").equals("Em branco")){
            request.setAttribute("segunda2disc", "");
        }else{
            request.setAttribute("segunda2disc", request.getParameter("segunda2disc"));
        }
        
        if(request.getParameter("segunda3disc").equals("Em branco")){
            request.setAttribute("segunda3disc", "");
        }else{
            request.setAttribute("segunda3disc", request.getParameter("segunda3disc"));
        }
        
        if(request.getParameter("segunda4disc").equals("Em branco")){
            request.setAttribute("segunda4disc", "");
        }else{
            request.setAttribute("segunda4disc", request.getParameter("segunda4disc"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("terca1prof").equals("Em branco")){
            request.setAttribute("terca1prof", "");
        }else{
            request.setAttribute("terca1prof", request.getParameter("terca1prof"));
        }
        
        if(request.getParameter("terca2prof").equals("Em branco")){
            request.setAttribute("terca2prof", "");
        }else{
            request.setAttribute("terca2prof", request.getParameter("terca2prof"));
        }
        
        if(request.getParameter("terca3prof").equals("Em branco")){
            request.setAttribute("terca3prof", "");
        }else{
            request.setAttribute("terca3prof", request.getParameter("terca3prof"));
        }
        
        if(request.getParameter("terca4prof").equals("Em branco")){
            request.setAttribute("terca4prof", "");
        }else{
            request.setAttribute("terca4prof", request.getParameter("terca4prof"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("terca1disc").equals("Em branco")){
            request.setAttribute("terca1disc", "");
        }else{
            request.setAttribute("terca1disc", request.getParameter("terca1disc"));
        }
        
        if(request.getParameter("terca2disc").equals("Em branco")){
            request.setAttribute("terca2disc", "");
        }else{
            request.setAttribute("terca2disc", request.getParameter("terca2disc"));
        }
        
        if(request.getParameter("terca3disc").equals("Em branco")){
            request.setAttribute("terca3disc", "");
        }else{
            request.setAttribute("terca3disc", request.getParameter("terca3disc"));
        }
        
        if(request.getParameter("terca4disc").equals("Em branco")){
            request.setAttribute("terca4disc", "");
        }else{
            request.setAttribute("terca4disc", request.getParameter("terca4disc"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("quarta1prof").equals("Em branco")){
            request.setAttribute("quarta1prof", "");
        }else{
            request.setAttribute("quarta1prof", request.getParameter("quarta1prof"));
        }
        
        if(request.getParameter("quarta2prof").equals("Em branco")){
            request.setAttribute("quarta2prof", "");
        }else{
            request.setAttribute("quarta2prof", request.getParameter("quarta2prof"));
        }
        
        if(request.getParameter("quarta3prof").equals("Em branco")){
            request.setAttribute("quarta3prof", "");
        }else{
            request.setAttribute("quarta3prof", request.getParameter("quarta3prof"));
        }
        
        if(request.getParameter("quarta4prof").equals("Em branco")){
            request.setAttribute("quarta4prof", "");
        }else{
            request.setAttribute("quarta4prof", request.getParameter("quarta4prof"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("quarta1disc").equals("Em branco")){
            request.setAttribute("quarta1disc", "");
        }else{
            request.setAttribute("quarta1disc", request.getParameter("quarta1disc"));
        }
        
        if(request.getParameter("quarta2disc").equals("Em branco")){
            request.setAttribute("quarta2disc", "");
        }else{
            request.setAttribute("quarta2disc", request.getParameter("quarta2disc"));
        }
        
        if(request.getParameter("quarta3disc").equals("Em branco")){
            request.setAttribute("quarta3disc", "");
        }else{
            request.setAttribute("quarta3disc", request.getParameter("quarta3disc"));
        }
        
        if(request.getParameter("quarta4disc").equals("Em branco")){
            request.setAttribute("quarta4disc", "");
        }else{
            request.setAttribute("quarta4disc", request.getParameter("quarta4disc"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("quinta1prof").equals("Em branco")){
            request.setAttribute("quinta1prof", "");
        }else{
            request.setAttribute("quinta1prof", request.getParameter("quinta1prof"));
        }
        
        if(request.getParameter("quinta2prof").equals("Em branco")){
            request.setAttribute("quinta2prof", "");
        }else{
            request.setAttribute("quinta2prof", request.getParameter("quinta2prof"));
        }
        
        if(request.getParameter("quinta3prof").equals("Em branco")){
            request.setAttribute("quinta3prof", "");
        }else{
            request.setAttribute("quinta3prof", request.getParameter("quinta3prof"));
        }
        
        if(request.getParameter("quinta4prof").equals("Em branco")){
            request.setAttribute("quinta4prof", "");
        }else{
            request.setAttribute("quinta4prof", request.getParameter("quinta4prof"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("quinta1disc").equals("Em branco")){
            request.setAttribute("quinta1disc", "");
        }else{
            request.setAttribute("quinta1disc", request.getParameter("quinta1disc"));
        }
        
        if(request.getParameter("quinta2disc").equals("Em branco")){
            request.setAttribute("quinta2disc", "");
        }else{
            request.setAttribute("quinta2disc", request.getParameter("quinta2disc"));
        }
        
        if(request.getParameter("quinta3disc").equals("Em branco")){
            request.setAttribute("quinta3disc", "");
        }else{
            request.setAttribute("quinta3disc", request.getParameter("quinta3disc"));
        }
        
        if(request.getParameter("quinta4disc").equals("Em branco")){
            request.setAttribute("quinta4disc", "");
        }else{
            request.setAttribute("quinta4disc", request.getParameter("quinta4disc"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("sexta1prof").equals("Em branco")){
            request.setAttribute("sexta1prof", "");
        }else{
            request.setAttribute("sexta1prof", request.getParameter("sexta1prof"));
        }
        
        if(request.getParameter("sexta2prof").equals("Em branco")){
            request.setAttribute("sexta2prof", "");
        }else{
            request.setAttribute("sexta2prof", request.getParameter("sexta2prof"));
        }
        
        if(request.getParameter("sexta3prof").equals("Em branco")){
            request.setAttribute("sexta3prof", "");
        }else{
            request.setAttribute("sexta3prof", request.getParameter("sexta3prof"));
        }
        
        if(request.getParameter("sexta4prof").equals("Em branco")){
            request.setAttribute("sexta4prof", "");
        }else{
            request.setAttribute("sexta4prof", request.getParameter("sexta4prof"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        if(request.getParameter("sexta1disc").equals("Em branco")){
            request.setAttribute("sexta1disc", "");
        }else{
            request.setAttribute("sexta1disc", request.getParameter("sexta1disc"));
        }
        
        if(request.getParameter("sexta2disc").equals("Em branco")){
            request.setAttribute("sexta2disc", "");
        }else{
            request.setAttribute("sexta2disc", request.getParameter("sexta2disc"));
        }
        
        if(request.getParameter("sexta3disc").equals("Em branco")){
            request.setAttribute("sexta3disc", "");
        }else{
            request.setAttribute("sexta3disc", request.getParameter("sexta3disc"));
        }
        
        if(request.getParameter("sexta4disc").equals("Em branco")){
            request.setAttribute("sexta4disc", "");
        }else{
            request.setAttribute("sexta4disc", request.getParameter("sexta4disc"));
        }
        
        //--------------------------------------------------------------------------------------------------
       
        HttpSession session = request.getSession();
        session.setAttribute("caminho_servlet","resources");
        session.setAttribute("param_volta_servlet","../SisCoorWeb");
        session.setAttribute("olho_servlet_horario", "ok");
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("horario_de_aulas/horario_matutino.jsp");
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
