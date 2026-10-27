<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDts"%>
<%@ page import="com.entity.cart"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User : Old Book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>
	
	 <!-- Success Message -->
                    <c:if test="${not empty sessionScope.succMsg}">
                        <div class="alert alert-success text-center">${sessionScope.succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <!-- Failure Message -->
                    <c:if test="${not empty sessionScope.failedMsg}">
                        <div class="alert alert-danger">${sessionScope.failedMsg}</div>
                        <c:remove var="failedMsg" scope="session" />
                    </c:if>
                    
	<div class="container p-5">
		<table class="table">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
<%
User u = (User) session.getAttribute("userobj");

if (u == null) {
    response.sendRedirect("login.jsp");
    return;
}

String email = u.getEmail();
BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
List<BookDts> list = dao.getBookByOld(email, "Old");

for (BookDts b : list) {
%>
<tr>
    <td><%= b.getBookName() %></td>
    <td><%= b.getAuthor() %></td>
    <td><%= b.getPrice() %></td>
    <td><%= b.getBookCategory() %></td>
    <td>
        <a href="delete_old_book?em=<%=email %>&&id=<%=b.getBookId() %>" 
           class="btn btn-sm btn-danger">
           Delete
        </a>
    </td>
</tr>
<%
}
%>
</tbody>
			
		</table>
	</div>
</body>
</html>