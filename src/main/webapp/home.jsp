<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Home</title>
</head>
<body>
<c:if test="${not empty sessionScope.userobj}">
    <h1>Welcome, ${sessionScope.userobj.name}!</h1>
    <p>Email: ${sessionScope.userobj.email}</p>
    
</c:if>
<c:if test="${empty sessionScope.userobj}">
    <h1>Please <a href="login.jsp">login</a> first!</h1>
</c:if>
</body>
</html>