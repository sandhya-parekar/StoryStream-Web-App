<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Story Stream : Register </title>
<%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@ include file="all_component/navbar.jsp" %>

<div class="container p-2">
    <div class="row">
        <div class="col-md-4 offset-md-4"> 
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center">Registration Page</h4>

                    <!-- Success Message -->
                    <c:if test="${not empty sessionScope.succMsg}">
                        <div class="alert alert-success">${sessionScope.succMsg}</div>
                        <c:remove var="succMsg" scope="session" />
                    </c:if>

                    <!-- Failure Message -->
                    <c:if test="${not empty sessionScope.failedMsg}">
                        <div class="alert alert-danger">${sessionScope.failedMsg}</div>
                        <c:remove var="failedMsg" scope="session" />
                    </c:if>

                    <!-- Registration Form -->
                    <form action="${pageContext.request.contextPath}/register" method="post">
                        <div class="form-group">
                            <label>Enter Full Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>
                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>
                        <div class="form-group">
                            <label>Phone No</label>
                            <input type="number" class="form-control" name="phno" required>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" required>
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" name="check" id="termsCheck" required>
                            <label class="form-check-label" for="termsCheck">I agree to Terms & Conditions</label>
                        </div>
                        <button type="submit" class="btn btn-primary mt-2">Register</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="all_component/footer.jsp" %>
</body>
</html>
