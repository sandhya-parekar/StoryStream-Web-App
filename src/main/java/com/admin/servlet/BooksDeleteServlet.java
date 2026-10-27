package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // 1️⃣ Get 'id' parameter from request
            int id = Integer.parseInt(req.getParameter("id")); // You forgot "id" here

            // 2️⃣ Call DAO to delete book
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean f = dao.deleteBooks(id); // Method name should match your DAO

            // 3️⃣ Set session messages
            HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("succMsg", "Book deleted successfully");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on server");
            }

            // 4️⃣ Redirect to all_books page
            resp.sendRedirect("admin/all_books.jsp"); // fix typo .ksp → .jsp

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
