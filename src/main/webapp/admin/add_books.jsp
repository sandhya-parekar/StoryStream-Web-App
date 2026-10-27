<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Books</title>
<%@ include file="allCss.jsp" %>
</head>

<body style="background-color: #f0f2f2">
<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="../login.jsp"/>
</c:if>
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<div class="container">
    <div class="col-md-4 offset-md-4">
        <div class="card">
            <div class="card-body">
                <h4 class="text-center">Add Books</h4>

                <!-- Success Message -->
                <c:if test="${not empty succMsg}">
                    <p class="text-center text-success">${succMsg}</p>
                    <c:remove var="succMsg" scope="session"/>
                </c:if>

                <!-- Failure Message -->
                <c:if test="${not empty failedMsg}">
                    <p class="text-center text-danger">${failedMsg}</p>
                    <c:remove var="failedMsg" scope="session"/>
                </c:if>

                <form action="${pageContext.request.contextPath}/add_books" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="bookName">Book Name</label>
                        <input type="text" class="form-control" id="bookName" name="bname" required>
                    </div>

                    <div class="form-group">
                        <label for="authorName">Author Name</label>
                        <input type="text" class="form-control" id="authorName" name="author" required>
                    </div>

                    <div class="form-group">
                        <label for="price">Price</label>
                        <input type="number" class="form-control" id="price" name="price" required>
                    </div>

                    <div class="form-group">
                        <label for="ageGroup">Group</label>
                        <select class="form-control" id="ageGroup" name="ageGroup" required>
                            <option value="">--Select  Group--</option>
                            <option value="Childrens">Childrens</option>
                            <option value="Teens">Teens</option>
                            <option value="Elders">Elders</option>
                            <option value="Author">Author</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="category">Book Category</label>
                        <select class="form-control" id="category" name="bcategories" required>
                            <option value="">--Select Category--</option>
                            <option value="New">New</option>
                            <option value="Old">Old</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="status">Book Status</label>
                        <select class="form-control" id="status" name="status" required>
                            <option value="">--Select Status--</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
    <label for="description">Book Description</label>
    <textarea class="form-control" id="description" name="description" rows="5" 
              placeholder="Enter book description here..." required></textarea>
</div>
                    

                    <div class="form-group">
                        <label for="photo">Upload Photo</label>
                        <input type="file" class="form-control-file" id="photo" name="bimg" accept="image/*" required>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">Add Book</button>
                    
                    <!-- Back to Home button -->
<div class="text-center mt-3">
    <a href="${pageContext.request.contextPath}/admin/home.jsp" class="btn btn-secondary">
        Back to Home
    </a>
</div>
                </form>

            </div>
        </div>
    </div>
</div>

<div style="margin-top: 40px;">
    <%@ include file="footer.jsp" %>
</div>

</body>
</html>
