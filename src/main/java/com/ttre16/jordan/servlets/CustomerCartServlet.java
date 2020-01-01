package com.ttre16.jordan.servlets;

import com.ttre16.jordan.logic.Cart;
import com.ttre16.jordan.logic.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/jordan")
public class CustomerCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        response.setContentType("text/html");
        Customer customer = (Customer) session.getAttribute("customer");
        if(customer!=null && customer.isLogin()) {
            if (request.getParameter("name").equals("removeAll"))
                customer.getCart().removeAll();
            else {
                if ((Boolean) session.getAttribute("add")) {
                    customer.getCart().addProduct(request.getParameter("name"));
                } else {
                    customer.getCart().removeProduct(request.getParameter("name"));
                }
            }
        }
        response.sendRedirect("/head/cart.jsp");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customer customer = (Customer) session.getAttribute("customer");
        Cart cart = new Cart();
        customer.setCart(cart);
        cart.setCustomerName(customer.getName());
        cart.load();
        response.sendRedirect("/head/cart.jsp");
    }

}
