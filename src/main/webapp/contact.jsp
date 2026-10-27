<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>

    <!-- Bootstrap (already used in your project) -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .contact-card {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
        }

        .contact-card h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        .btn-send {
            width: 100%;
        }
    </style>
</head>

<body>
<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

<div class="contact-card">
    <h2>Contact Us</h2>

    <!-- Success / Error message -->
    <%
        String message = (String) request.getAttribute("message");
        String error = (String) request.getAttribute("error");
        if (message != null) {
    %>
        <div class="alert alert-success text-center">
            <%= message %>
        </div>
    <% } else if (error != null) { %>
        <div class="alert alert-danger text-center">
            <%= error %>
        </div>
    <% } %>

    <form action="contact" method="post">

        <div class="form-group">
            <label>Name</label>
            <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
        </div>

        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
        </div>

        <div class="form-group">
            <label>Message</label>
            <textarea name="message" class="form-control" rows="4"
                      placeholder="Write your message here..." required></textarea>
        </div>



			<button type="submit" class="btn btn-primary btn-send">Send
				Message</button>

			<!-- Back to Home button -->
			<div class="text-center mt-3">
				<a href="index.jsp" class="btn btn-secondary"> Back to Home </a>
			</div>


		</form>
</div>

</body>
</html>
