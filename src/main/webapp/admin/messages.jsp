<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page import="java.util.List" %>
<%@ page import="com.entity.ContactMessage" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : Contact Messages</title>

<%@include file="allCss.jsp" %>
</head>

<body style="background-color:#f0f1f2">

<!-- 🔐 Admin login check -->
<c:if test="${empty userobj}">
    <c:redirect url="../login.jsp"/>
</c:if>

<!-- Navbar -->
<%@include file="navbar.jsp" %>

<div class="container mt-4">
    <h3 class="text-center text-primary mb-4">Contact Messages</h3>

    <div class="card">
        <div class="card-body">

            <table class="table table-bordered table-hover text-center">
                <thead class="bg-primary text-white">
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Message</th>
                        <th>Date</th>
                    </tr>
                </thead>

                <tbody>
                <%
                    List<ContactMessage> list =
                        (List<ContactMessage>) request.getAttribute("messages");

                    int count = 1;

                    if(list == null || list.isEmpty()){
                %>
                    <tr>
                        <td colspan="5" class="text-danger text-center">
                            No messages found
                        </td>
                    </tr>
                <%
                    } else {
                        for(ContactMessage cm : list){
                %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= cm.getName() %></td>
                        <td><%= cm.getEmail() %></td>
                        <td><%= cm.getMessage() %></td>
                        <td><%= cm.getCreatedAt() %></td>
                    </tr>
                <%
                        }
                    }
                %>
                </tbody>

            </table>

        </div>
    </div>
</div>

<div style="margin-top:180px;">
    <%@include file="footer.jsp" %>
</div>

</body>
</html>
