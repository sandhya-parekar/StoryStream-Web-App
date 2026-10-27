package com.user.servlet;

import java.io.File;
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
import jakarta.servlet.http.Part;

@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBook  extends HttpServlet{
	 @Override
	    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	        try {
	            String bookName = req.getParameter("bname");
	            String author = req.getParameter("author");
	            String price = req.getParameter("price");
	            String bookCategory ="Old";
	            String status = "Active";
	            String ageGroup = req.getParameter("ageGroup");
	            String description = req.getParameter("description");
	            Part part = req.getPart("bimg");
	            String fileName = part.getSubmittedFileName();
	            
	            String user_email=req.getParameter("user");
	            // Create Book object
	            BookDts b = new BookDts(bookName, author, price, bookCategory, status, fileName, user_email, ageGroup,description);

	            // Insert into DB
	            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	            boolean f = dao.addBooks(b);

	            HttpSession session = req.getSession();

	            if (f) {
	                // Save image to folder based on ageGroup
	                String basePath = getServletContext().getRealPath("") + "book";
	                String uploadPath = basePath + File.separator + ageGroup;

	                File uploadDir = new File(uploadPath);
	                if (!uploadDir.exists()) {
	                    uploadDir.mkdirs();
	                }

	                part.write(uploadPath + File.separator + fileName);

	                session.setAttribute("succMsg", "Book Added Successfully!");
	            } else {
	                session.setAttribute("failedMsg", "Something went wrong on server");
	            }

	            resp.sendRedirect("sell_book.jsp");

	        } catch (Exception e) {
	            e.printStackTrace(); // Important: check server console for actual errors
	            HttpSession session = req.getSession();
	            session.setAttribute("failedMsg", "Exception: " + e.getMessage());
	            resp.sendRedirect("sell_book.jsp");
	        }
	    }
	
}
