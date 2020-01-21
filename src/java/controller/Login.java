/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import Model.DAO_User;
import Entity.User;
import etc.Alert;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Melón
 */
public class Login extends HttpServlet {
    static User u;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String user = request.getParameter("txt_user");
            String pass = request.getParameter("txt_pass");
            
            u = new User(user,pass);
            DAO_User dao_user = new DAO_User(u);

        if(!dao_user.Exist()){
           request.setAttribute("log",Alert.getAlert("alert alert-danger alert-dismissible fade show","Usuario o contaseña Incorrectos"));        
           request.getRequestDispatcher("index.jsp").forward(request,response);
        }else{
           HttpSession session = request.getSession();
           u= dao_user.getUser();
           request.setAttribute("name",u.getEmployee().getName() + " " + u.getEmployee().getLastname());
           request.setAttribute("userName",u.getUser());           
           session.setAttribute("user", u);
           request.getRequestDispatcher("ServletBienvenida").forward(request, response);

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
