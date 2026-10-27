<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.DAO.BookDAOImpl, com.DB.DBConnect, com.entity.BookDts" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Book</title>
<%@ include file="allCss.jsp" %>
</head>
<body style="background-color: #f0f2f2">
<%@ include file="navbar.jsp" %>

<div class="container mt-4">
    <div class="col-md-6 offset-md-3">
        <div class="card">
            <div class="card-body">
                <h4 class="text-center">Edit Book</h4>

                <%
                    // Check if 'id' parameter is present
                    String idParam = request.getParameter("id");
                    if(idParam != null && !idParam.isEmpty()) {
                        int id = Integer.parseInt(idParam);
                        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
                        BookDts b = dao.getBookById(id);
                        if(b != null) {
                %>

                <form action="${pageContext.request.contextPath}/edit_books" method="post">
                    <input type="hidden" name="id" value="<%=b.getBookId()%>">

                    <div class="form-group">
                        <label>Book Name</label>
                        <input type="text" class="form-control" name="bname" required value="<%=b.getBookName()%>">
                    </div>

                    <div class="form-group">
                        <label>Author Name</label>
                        <input type="text" class="form-control" name="author" required value="<%=b.getAuthor()%>">
                    </div>

                    <div class="form-group">
                        <label>Price</label>
                        <input type="number" class="form-control" name="price" required value="<%=b.getPrice()%>">
                    </div>

                    <div class="form-group">
                        <label>Age Group</label>
                        <select class="form-control" name="ageGroup" required>
                            <option value="Childrens" <%= "Childrens".equals(b.getAgeGroup()) ? "selected" : "" %>>Childrens</option>
                            <option value="Teens" <%= "Teens".equals(b.getAgeGroup()) ? "selected" : "" %>>Teens</option>
                            <option value="Elders" <%= "Elders".equals(b.getAgeGroup()) ? "selected" : "" %>>Elders</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <select class="form-control" name="status" required>
                            <option value="Active" <%= "Active".equals(b.getStatus()) ? "selected" : "" %>>Active</option>
                            <option value="Inactive" <%= "Inactive".equals(b.getStatus()) ? "selected" : "" %>>Inactive</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block mt-3">Update</button>
                </form>

                <%
                        } else {
                            out.println("<div class='alert alert-danger'>Book not found!</div>");
                        }
                    } else {
                        out.println("<div class='alert alert-danger'>Invalid Book ID!</div>");
                    }
                %>

            </div>
        </div>
    </div>
</div>

<div style="margin-top: 40px;">
    <%@ include file="footer.jsp" %>
</div>

</body>
</html>
