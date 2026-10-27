<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDts"%>
<%@ page import="com.entity.cart"%>
<%@ page import="com.entity.User"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>

<%@ include file="all_component/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2;">
<%@ include file="all_component/navbar.jsp" %>

<c:if test="${ empty userobj }">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty succMsg}">
  <div class="alert alert-success text-center">${succMsg}</div>
  <c:remove var="succMsg" scope="session"/>
</c:if>

<c:if test="${not empty failedMsg}">
  <div class="alert alert-danger text-center">${failedMsg}</div>
  <c:remove var="failedMsg" scope="session"/>
</c:if>


<div class="container">
    <div class="row p-2">

        <!-- Cart Items -->
        <div class="col-md-6">
            <div class="card bg-white">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Selected Item</h3>

						




						<table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Book Name</th>
                                <th scope="col">Author</th>
                                <th scope="col">Price</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            User u = (User) session.getAttribute("userobj");
                            CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
                            Double totalPrice = 0.0;
                            List<cart> ca = dao.getBookByUser(u.getId());
                            
                            for(cart c : ca) {
                                totalPrice += c.getTotalPrice();
                        %>
                            <tr>
                                <th scope="row"><%=c.getBookName() %></th>
                                <td><%=c.getAuthor() %></td>
                                <td><%=c.getPrice() %></td>
                                <td>
                 <a href="remove_book?bid=<%=c.getBid() %>&uid=<%=c.getUserId()%>&cid=<%=c.getCid() %>" 
   class="btn btn-sm btn-danger">Remove</a>
                                    
                                    
                                </td>
                            </tr>
                        <% } %>
                            <tr>
                                <td><b>Total Price</b></td>
                                <td></td>
                                <td></td>
                                <td><b><%=totalPrice %></b></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Order Details -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <h3 class="text-center text-success">Your Details for Order</h3>
                    <form  action="order" method="post">
                    
                    <input type="hidden" value="${userobj.id }" name="id"> 

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Name</label>
                                <input type="text" name="username" class="form-control" value="${userobj.name }" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Email</label>
                                <input type="email"  name="email" class="form-control" value="${userobj.email }" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Phone Number</label>
                                <input type="number" name="phno" class="form-control" value="${userobj.phno }" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Address</label>
                                <input type="text"  name="address" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>Landmark</label>
                                <input type="text"  name="landmark" class="form-control" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>City</label>
                                <input type="text"  name="city" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label>State</label>
                                <input type="text" name="state" class="form-control" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label>Pin Code</label>
                                <input type="text" name="pincode" class="form-control" required>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Payment Method</label>
                            <select class="form-control" name="payment">
                                <option value="noselect">---select---</option>
                                <option value="COD">Cash on Delivery</option>
                            </select>
                        </div>

                        <div class="text-center">
                            <button class="btn btn-warning">Order Now</button>
                            <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </div>
</div>

</body>
</html>
