<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<%@ include file="all_component/navbar.jsp"%>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"/>

</c:if>


<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<h5 class="text-center text-primary p-1">Sell Old Book</h5>

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



  <form action="add_old_book" method="post" enctype="multipart/form-data">

   <input type="hidden" value="${userobj.email}" name="user">

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
                        <label for="ageGroup">Age Group</label>
                        <select class="form-control" id="ageGroup" name="ageGroup" required>
                            <option value="">--Select Age Group--</option>
                            <option value="Childrens">Childrens</option>
                            <option value="Teens">Teens</option>
                            <option value="Elders">Elders</option>
                        </select>
                    </div>

                  

                    

                    <div class="form-group">
                        <label for="photo">Upload Photo</label>
                        <input type="file" class="form-control-file" id="photo" name="bimg" accept="image/*" required>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">Sell Book</button>
                </form>


</div>

</div>


</div>

</div>

</div>

</body>
</html>