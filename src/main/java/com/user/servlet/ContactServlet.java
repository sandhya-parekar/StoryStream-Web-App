package com.user.servlet;

import com.DAO.ContactDAOImpl;
import com.entity.ContactMessage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/contact")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ContactDAOImpl dao;

    @Override
    public void init() throws ServletException {
        dao = new ContactDAOImpl(); // make sure DAOImpl exists
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String messageText = request.getParameter("message");

        ContactMessage cm = new ContactMessage(name, email, messageText);

        boolean saved = dao.saveMessage(cm);

        if(saved) {
            request.setAttribute("message", "Message sent successfully!");
        } else {
            request.setAttribute("error", "Something went wrong. Please try again.");
        }

        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
}
