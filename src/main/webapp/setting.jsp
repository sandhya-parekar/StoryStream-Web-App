<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>


	<%@ include file="all_component/navbar.jsp"%>
	<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
}
</style>


	<div class="container">
		
		<h3 class="text-center ">Hello, ${userobj.name}</h3>
<div class="row p-5">
            <div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">


								<i class="fas fa-book-open fa-3x"></i>
								<h3>Sell Old Book</h3>

							</div>
						</div>
					</div>
				</a>

			</div>

		
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">


								<i class="fas fa-book-open fa-3x"></i>
								<h3> Old Book</h3>

							</div>
						</div>
					</div>
				</a>

			</div>
			
			 
			  



			<div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">


								<i class="fas fa-edit  fa-3x"></i>
								<h4>Edit Profile</h4>

							</div>
						</div>
					</div>
				</a>

			</div>

		

			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body  text-center">
							<div class="text-primary text-danger">


								<i class="fas fa-box-open  fa-3x"></i>
								<h4>My Order</h4>
								<p>Tract Your Order</p>
							</div>
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body  text-center">
							<div class="text-primary ">


								<i class="fas fa-user-circle  fa-3x"></i>
								<h4>Help Center</h4>
								<p>24*7 Service</p>
							</div>
						</div>
					</div>
				</a>

			</div>
		</div>

	</div>



	<%@ include file="all_component/footer.jsp"%>
</body>
</html>