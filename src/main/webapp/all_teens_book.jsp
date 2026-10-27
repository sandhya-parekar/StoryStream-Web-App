<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDts"%>
<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Teens Books</title>
<%@ include file="all_component/allCss.jsp" %>
<style>
    .crd-ho:hover {
        background: #fcf7f7;
    }
</style>
</head>
<body>

<%
User u=(User)session.getAttribute("userobj"); 
%>

<%@ include file="all_component/navbar.jsp" %>

<div class="container-fluid mt-3">
    <div class="row">
        <%
            // Create DAO instance
            BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
            List<BookDts> teensBooks = dao.getAllTeensBook();

            for (BookDts b : teensBooks) {
        %>
        <div class="col-md-3">
            <div class="card crd-ho mt-2">
                <div class="card-body text-center">
                    <img alt="" src="book/Teens/<%=b.getPhoto()%>" style="width:150px; height:200px" class="img-thumblin">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Categories: <%=b.getBookCategory()%></p>
                    <div class="row justify-content-center mt-1">
                        <% if(b.getBookCategory().equalsIgnoreCase("old")) { %>
                         <% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
                            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                        <% } else { %>
                           
                           <% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
							
                            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
</div>

</body>
</html>
