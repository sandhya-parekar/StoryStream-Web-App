package com.admin.servlet;

import java.io.IOException;
import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDts;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/edit_books")
@MultipartConfig
public class EditBookServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String bookName = req.getParameter("bname");
            String author = req.getParameter("author");
            String price = req.getParameter("price");
            String status = req.getParameter("status");
            String ageGroup = req.getParameter("ageGroup");

            BookDts b = new BookDts();
            b.setBookId(id);
            b.setBookName(bookName);
            b.setAuthor(author);
            b.setPrice(price);
            b.setStatus(status);
            b.setAgeGroup(ageGroup);

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            boolean updated = dao.updateEditBooks(b);

            if (updated) {
                session.setAttribute("succMsg", "Book updated successfully!");
            } else {
                session.setAttribute("failedMsg", "Something went wrong on server.");
            }

            resp.sendRedirect("admin/all_books.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "Exception: " + e.getMessage());
            resp.sendRedirect("admin/all_books.jsp");
        }
    }
}
