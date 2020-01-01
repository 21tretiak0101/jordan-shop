package com.ttre16.jordan.servlets;

import com.ttre16.jordan.logic.Customer;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/security")
public class SecurityServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession();
        response.setContentType("text/html");

        Customer customer = new Customer();
        customer.setName(request.getParameter("username"));
        customer.setPassword(request.getParameter("password"));
        customer.setEmail(request.getParameter("email"));
        customer.setPhone(request.getParameter("phone"));
        session.setAttribute("customer", customer);

        String message = customer.come();

        if (message.equals("log1") || message.equals("insert1")){
            customer.setLogin(true);
            response.sendRedirect("/sneakers/jordan");
        }
        else
            response.sendRedirect("/head/login.jsp");
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession();

        Customer customer = (Customer) session.getAttribute("customer");
        response.setContentType("text/html");

        if(request.getParameter("status").equals("logOut")){
            customer.setLogin(false);
            session.setAttribute("customer", customer);
            response.sendRedirect("/index.jsp");
        }
    }
}
