<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDts"%>
<%@ page import="com.entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>StoryStream: Index</title>
<%@ include file="all_component/allCss.jsp"%>
<style>
.back-img {
	background: url("img/book.jpg") no-repeat center center;
	background-size: cover;
	height: 80vh;
	width: 100%;
}
.crd-ho:hover {
	background: #fcf7f7;
}


</style>
</head>
<body style="background-color: #f7f7f7;">

<%
User u=(User)session.getAttribute("userobj"); 
%>

<!-- Toast Notification -->


<%@ include file="all_component/navbar.jsp"%>

<div class="container-fluid back-img">
	<h2 class="text-center text-white">Story Stream Web App</h2>
</div>

<% BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn()); %>

<!--------- Children Books ---------->

<div class="container">
	<h3 class="text-center">Children Books</h3>
	<div class="row">
	<%
	List<BookDts> childrenBooks = dao.getChildrenBook();
	for (BookDts b : childrenBooks) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					
					 <img alt=""   src="book/Childrens/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
					
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
							<div class="row">
							
							<% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
							<a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
							</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	<% } %>
	</div>
	<div class="text-center mt-1">
		<a href="all_childrens_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>
<hr>

<!--------- Teens Books ---------->
<div class="container">
	<h3 class="text-center">Teens Books</h3>
	<div class="row">
	<%
	List<BookDts> teensBooks = dao.getTeensBooks();
	for (BookDts b : teensBooks) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/Teens/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
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
							<div class="row">
							
							<% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
							<a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
							</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	<% } %>
	</div>
	<div class="text-center mt-1">
		<a href="all_teens_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>
<hr>

<!--------- Elders Books ---------->
<div class="container">
	<h3 class="text-center">Elders Books</h3>
	<div class="row">
	<%
	List<BookDts> eldersBooks = dao.getEldersBooks();
	for (BookDts b : eldersBooks) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/Elders/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
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
							<div class="row">
							
							
							<% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
							
							
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mr-1">View Details</a>
							<a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
							</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	<% } %>
	</div>
	<div class="text-center mt-1">
		<a href="all_elders_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>

<!--------- Author Books ---------->
<div class="container">
	<h3 class="text-center">Author Books</h3>
	<div class="row">
	<%
	List<BookDts> author = dao.getAuthorBook();
	for (BookDts b : author) {
	%>
		<div class="col-md-3">
			<div class="card crd-ho">
				<div class="card-body text-center">
					<img alt="" src="book/Author/<%=b.getPhoto()%>" style="width: 150px; height: 200px" class="img-thumblin">
					<p><%=b.getBookName()%></p>
					<p><%=b.getAuthor()%></p>
					<p>Categories: <%=b.getBookCategory()%></p>
					<div class="row justify-content-center mt-1">
						<% if(b.getBookCategory().equalsIgnoreCase("old")) { %>
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
							<a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
						<% } else { %>
							<div class="row">
							
							
							<% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
							
							
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm mr-1">View Details</a>
							<a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
							</div>
						<% } %>
					</div>
				</div>
			</div>
		</div>
	<% } %>
	</div>
	<div class="text-center mt-1">
		<a href="author_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>
	</div>
</div>

<%@ include file="all_component/footer.jsp"%>







</body>
</html>
