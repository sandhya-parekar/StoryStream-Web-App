<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDts"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp" %>
</head>

<body style="background-color: #f0f1f2;">

<%@ include file="all_component/navbar.jsp" %>

<%
    int bid = Integer.parseInt(request.getParameter("bid"));
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    BookDts b = dao.getBookById(bid);
%>

<div class="container">
<div class="row ">

    <div class="col-md-6 text-center p-5 border bg-white">
        <img src="book/<%=b.getAgeGroup()%>/<%= b.getPhoto() %>" style="height:150px; width:150px">

        <h4 class="mt-3">Book Name: <span class="text-success"><%= b.getBookName() %></span></h4>
        <h4>Author Name: <span class="text-success"><%= b.getAuthor() %></span></h4>
        <h4>Category: <span class="text-success"><%= b.getBookCategory() %></span></h4>
    </div>

    <div class="col-md-6 text-center p-5 border bg-white">

        <h2><%= b.getBookName() %></h2>

        <% if ("old".equalsIgnoreCase(b.getBookCategory())) { %>
            <h5 class="text-primary">Contact to Seller</h5>
            <h5 class="text-primary">
                <i class="far fa-envelope"></i>
                Email: <%= b.getUserEmail() %>
            </h5>
        <% } %>
        
   <!-- Description Box -->
<div class="mt-3 border p-3" 
     style="height: 200px; overflow-y: scroll; background-color: #f8f9fa; text-align: left;">
    <h5>Description</h5>
    <div style="min-height: 250px;"> <!-- force content taller than div -->
        <p class="text-muted" style="text-align: justify;">
            <% if (b.getDescription() != null && !b.getDescription().trim().isEmpty()) { %>
                <%= b.getDescription() %>
            <% } else { %>
                <span style="color: red;">No description available for this book.</span>
            <% } %>
        </p>
    </div>
</div>



    
     
       

        <div class="row">
            <div class="col-md-4 text-danger text-center p-2">
                <i class="fas fa-money-bill-wave fa-2x"></i>
                <p>Cash on Delivery</p>
            </div>
            <div class="col-md-4 text-danger text-center p-2">
                <i class="fas fa-undo-alt fa-2x"></i>
                <p>Return Available</p>
            </div>
            <div class="col-md-4 text-danger text-center p-2">
                <i class="fas fa-truck-moving fa-2x"></i>
                <p>Free Shipping</p>
            </div>
        </div>

        <% if ("old".equalsIgnoreCase(b.getBookCategory())) { %>
            <div class="text-center p-3">
                <a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a>
                <a href="#" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
            </div>
        <% } else { %>
            <div class="text-center p-3">
                <a href="#" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add Cart</a>
                <a href="#" class="btn btn-danger"><i class="fas fa-rupee-sign"></i>200</a>
            </div>
        <% } %>

    </div>

</div>
</div>

</body>
</html>
