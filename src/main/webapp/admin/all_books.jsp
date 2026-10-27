<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.List" %>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDts" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Book</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"/>
</c:if>

<h3 class="text-center"> Hello Admin</h3>
<c:if test="${not empty succMsg}">
    <div class="alert alert-success">${succMsg}</div>
</c:if>
<c:if test="${not empty failedMsg}">
    <div class="alert alert-danger">${failedMsg}</div>
</c:if>

<table class="table">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author Name</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Age Group</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDts> list = dao.getAllBooks();
    for(BookDts b : list) {
  %>
    <tr>
      <td><%= b.getBookId() %></td>
      <td>
        <img src="../book/<%= b.getAgeGroup() %>/<%= b.getPhoto() %>" style="width:50px; height:50px;">
      </td>
      <td><%= b.getBookName() %></td>
      <td><%= b.getAuthor() %></td>
      <td><%= b.getPrice() %></td>
      <td><%= b.getBookCategory() %></td>
      <td><%= b.getAgeGroup() %></td>
      <td><%= b.getStatus() %></td>
      <td>
        <!-- Fixed Update link -->
        <a href="${pageContext.request.contextPath}/admin/edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-success"><i class="fas fa-edit"></i>Edit</a>
        <!-- Fixed Delete link -->
        <a href="${pageContext.request.contextPath}/delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fas fa-trash-alt"></i>"Delete</a>
      </td>
    </tr>
  <%
    }
  %>
  </tbody>
</table>

<div style="margin-top: 180px;">
<%@include file="footer.jsp" %>
</div>
</body>
</html>
