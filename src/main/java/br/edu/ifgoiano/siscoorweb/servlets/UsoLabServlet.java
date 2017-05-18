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

/**
 *
 * @author Jonathan
 */
@WebServlet(name = "UsoLabServlet", urlPatterns = {"/UsoLabServlet"})
public class UsoLabServlet extends HttpServlet {

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
        
        if(request.getParameter("segunda1lab").equals("Em branco")){
            request.setAttribute("segunda1lab", "");
        }else{
            request.setAttribute("segunda1lab", request.getParameter("segunda1lab"));
        }
        
        if(request.getParameter("segunda2lab").equals("Em branco")){
            request.setAttribute("segunda2lab", "");
        }else{
            request.setAttribute("segunda2lab", request.getParameter("segunda2lab"));
        }
        
        if(request.getParameter("segunda3lab").equals("Em branco")){
            request.setAttribute("segunda3lab", "");
        }else{
            request.setAttribute("segunda3lab", request.getParameter("segunda3lab"));
        }
        
        if(request.getParameter("segunda4lab").equals("Em branco")){
            request.setAttribute("segunda4lab", "");
        }else{
            request.setAttribute("segunda4lab", request.getParameter("segunda4lab"));
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
        
        if(request.getParameter("terca1lab").equals("Em branco")){
            request.setAttribute("terca1lab", "");
        }else{
            request.setAttribute("terca1lab", request.getParameter("terca1lab"));
        }
        
        if(request.getParameter("terca2lab").equals("Em branco")){
            request.setAttribute("terca2lab", "");
        }else{
            request.setAttribute("terca2lab", request.getParameter("terca2lab"));
        }
        
        if(request.getParameter("terca3lab").equals("Em branco")){
            request.setAttribute("terca3lab", "");
        }else{
            request.setAttribute("terca3lab", request.getParameter("terca3lab"));
        }
        
        if(request.getParameter("terca4lab").equals("Em branco")){
            request.setAttribute("terca4lab", "");
        }else{
            request.setAttribute("terca4lab", request.getParameter("terca4lab"));
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
        
        if(request.getParameter("quarta1lab").equals("Em branco")){
            request.setAttribute("quarta1lab", "");
        }else{
            request.setAttribute("quarta1lab", request.getParameter("quarta1lab"));
        }
        
        if(request.getParameter("quarta2lab").equals("Em branco")){
            request.setAttribute("quarta2lab", "");
        }else{
            request.setAttribute("quarta2lab", request.getParameter("quarta2lab"));
        }
        
        if(request.getParameter("quarta3lab").equals("Em branco")){
            request.setAttribute("quarta3lab", "");
        }else{
            request.setAttribute("quarta3lab", request.getParameter("quarta3lab"));
        }
        
        if(request.getParameter("quarta4lab").equals("Em branco")){
            request.setAttribute("quarta4lab", "");
        }else{
            request.setAttribute("quarta4lab", request.getParameter("quarta4lab"));
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
        
        if(request.getParameter("quinta1lab").equals("Em branco")){
            request.setAttribute("quinta1lab", "");
        }else{
            request.setAttribute("quinta1lab", request.getParameter("quinta1lab"));
        }
        
        if(request.getParameter("quinta2lab").equals("Em branco")){
            request.setAttribute("quinta2lab", "");
        }else{
            request.setAttribute("quinta2lab", request.getParameter("quinta2lab"));
        }
        
        if(request.getParameter("quinta3lab").equals("Em branco")){
            request.setAttribute("quinta3lab", "");
        }else{
            request.setAttribute("quinta3lab", request.getParameter("quinta3lab"));
        }
        
        if(request.getParameter("quinta4lab").equals("Em branco")){
            request.setAttribute("quinta4lab", "");
        }else{
            request.setAttribute("quinta4lab", request.getParameter("quinta4lab"));
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
        
        if(request.getParameter("sexta1lab").equals("Em branco")){
            request.setAttribute("sexta1lab", "");
        }else{
            request.setAttribute("sexta1lab", request.getParameter("sexta1lab"));
        }
        
        if(request.getParameter("sexta2lab").equals("Em branco")){
            request.setAttribute("sexta2lab", "");
        }else{
            request.setAttribute("sexta2lab", request.getParameter("sexta2lab"));
        }
        
        if(request.getParameter("sexta3lab").equals("Em branco")){
            request.setAttribute("sexta3lab", "");
        }else{
            request.setAttribute("sexta3lab", request.getParameter("sexta3lab"));
        }
        
        if(request.getParameter("sexta4lab").equals("Em branco")){
            request.setAttribute("sexta4lab", "");
        }else{
            request.setAttribute("sexta4lab", request.getParameter("sexta4lab"));
        }
        
        //--------------------------------------------------------------------------------------------------
        
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("uso_laboratorio/uso_laboratorio_visualizar.jsp");
        
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
