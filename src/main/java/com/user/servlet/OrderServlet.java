package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session=req.getSession();
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			String fullAdd=address+","+landmark+","+city+","+ state+","+pincode;  
			
			/*System.out.println(name+""+email+""+phno+""+fullAdd+""+paymentType); */
			
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			
			List<cart> blist=dao.getBookByUser(id);
			
			if(blist.isEmpty())
			{
				session.setAttribute("failedMsg", "Add Item");
				resp.sendRedirect("cart.jsp");
			}
			else {
				BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());
				int i = dao2.getOrderNo();
				
				Book_Order o=null;
				
				ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
				for(cart c:blist) {
					o=new Book_Order();
					i++;
					o.setOrderId("BOOK-ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFulladd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(paymentType);
					
					orderList.add(o);
				
					
				}
				
				
				if("noselect".equals(paymentType)) {
					session.setAttribute("failedMsg", "Choose  Payment Method");
					resp.sendRedirect("cart.jsp");
					return;
				}
				else {
					boolean f=dao2.saveOrder(orderList);
					if(f) {
						resp.sendRedirect("order_success.jsp");
					
					}
					else {
						session.setAttribute("failedMsg", "Your Order Failed");
						resp.sendRedirect("order_success.jsp");
						
					}
					
				}
				
				
			}
			
					}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
      
	      
	
	
	
}
