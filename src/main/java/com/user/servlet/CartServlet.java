package com.user.servlet;

import java.io.IOException;
import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDts;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid"));
           

            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            BookDts b = dao.getBookById(bid);

            cart c = new cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookName());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDAOImpl dao2 = new CartDAOImpl(DBConnect.getConn());
            boolean f = dao2.addCart(c);

            HttpSession session = req.getSession();

            if (f) {
                session.setAttribute("addCart", "Book added to cart successfully!");
                resp.sendRedirect("all_childrens_book.jsp");
            } else {
                session.setAttribute("failed", "Something went wrong on server!");
                resp.sendRedirect("all_childrens_book.jsp");
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}