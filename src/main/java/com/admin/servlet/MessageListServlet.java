package com.admin.servlet;

import com.DAO.ContactDAOImpl;
import com.entity.ContactMessage;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/messages")
public class MessageListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Fetch all messages from DAO
        ContactDAOImpl dao = new ContactDAOImpl();
        List<ContactMessage> messages = dao.getAllMessages();

        // 2. Add messages to request
        request.setAttribute("messages", messages);

        // 3. Forward to JSP
        request.getRequestDispatcher("/admin/messages.jsp").forward(request, response);
    }
}
