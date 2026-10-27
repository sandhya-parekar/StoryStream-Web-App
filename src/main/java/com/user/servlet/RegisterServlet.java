package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Forward GET request to register.jsp
        req.getRequestDispatcher("register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String password = req.getParameter("password");
            String check = req.getParameter("check");

            if (check == null) {
                session.setAttribute("failedMsg", "You must agree to Terms & Conditions");
                resp.sendRedirect("register.jsp");
                return;
            }

            Connection conn = DBConnect.getConn();
            if (conn == null) {
                session.setAttribute("failedMsg", "Database connection failed!");
                resp.sendRedirect("register.jsp");
                return;
            }

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhno(phno);
            user.setPassword(password);

            UserDAOImpl dao = new UserDAOImpl(conn);
           
            
            boolean f2=dao.checkUser(email);
            if(f2) {
            	 boolean inserted = dao.userRegister(user);

                 if (inserted) {
                     session.setAttribute("succMsg", "Registration successful!");
                     resp.sendRedirect("register.jsp");
                 } else {
                     session.setAttribute("failedMsg","Something Wrong on Server");
                     resp.sendRedirect("register.jsp");
                 }

            }
            else {
            	session.setAttribute("failedMsg", "User Alredy Exist Try Another Email Id");
                resp.sendRedirect("register.jsp");
            }
            
           

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("failedMsg", "Server error: " + e.getMessage());
            resp.sendRedirect("register.jsp");
        }
    }
}
