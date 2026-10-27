<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
<%@ include file="all_component/navbar.jsp"%>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center  text-primary"> Edit Profile</h4>


 <!-- Show failed login message -->
                    <c:if test="${not empty failedMsg}">
                        <h5 class="text-center text-danger">${failedMsg}</h5>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>


 <form action="update_profile" method="post">
  <input type="hidden" value="${userobj.id }" name="id">
                        <div class="form-group">
                            <label>Enter Full Name</label>
                            <input type="text" class="form-control" name="name"  value="${userobj.name }" required>
                        </div>
                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" class="form-control" name="email" value="${userobj.email}" required>
                        </div>
                        <div class="form-group">
                            <label>Phone No</label>
                            <input type="number" class="form-control" name="phno" value="${userobj.phno}" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                       
                        <button type="submit" class="btn btn-primary mt-2">Update</button>
                    </form>


</div>

</div>

</div>
<div>

</div>
</div>
</div>


</body>
</html>