<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body  style="background-color: #f7f7f7;">
<%@ include file="all_component/navbar.jsp"%>

<div class="container">
<div class="row p-3">
<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">
<h3 class="text-center text-success">Add Address</h3>
<form action="">
<div class="form-row">
                            
                            <div class="form-group col-md-6">
                                <label>Address</label>
                                <input type="text" class="form-control">
                            </div>
                             <div class="form-group col-md-6">
                                <label>Landmark</label>
                                <input type="text" class="form-control">
                            </div>
                        </div>


                        <div class="form-row">
                            
                            <div class="form-group col-md-4">
                                <label>City</label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="form-group col-md-4">
                                <label>State</label>
                                <input type="text" class="form-control">
                            </div>
                            <div class="form-group col-md-4">
                                <label>Pin</label>
                                <input type="text" class="form-control">
                            </div>
                        </div>
<div class="text-center">
<button class="btn btn-warning  text-white">
Add Address
</button>

</div>



</form>


</div>

</div>

</div>

</div>



</div>


</body>
</html>