<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnect"%>
<%@ page import="com.entity.BookDts"%>
<%@ page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Children Books</title>

<%@ include file="all_component/allCss.jsp" %>

<!-- Toast CSS (does not change layout) -->
<style>
.crd-ho:hover {
        background: #fcf7f7;
    }
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>

</head>
<body>

<%
User u = (User) session.getAttribute("userobj");
%>

<!-- Toast -->
<c:if test="${not empty addCart}">
    <div id="toast">${addCart}</div>

<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
    <c:remove var="addCart" scope="session" />
</c:if>

<%@ include file="all_component/navbar.jsp" %>

<div class="container">
    <h3 class="text-center">Children Books</h3>
    <div class="row">
    <%
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
        List<BookDts> childrenBooks = dao.getAllChildrensBook();
        for (BookDts b : childrenBooks) {
    %>
        <div class="col-md-3">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img src="book/Childrens/<%=b.getPhoto()%>" style="width:150px; height:200px;">
                    <p><%=b.getBookName()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>Categories: <%=b.getBookCategory()%></p>
                    <div class="row justify-content-center mt-1">
                         <% if(b.getBookCategory().equalsIgnoreCase("old")) { %>
                          <% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
                            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                        <% } else { %>
                           
                           
                            <% if(u==null) { %>
								<a href="login.jsp" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } else { %>
								<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm mr-1">Add Cart</a>
							<% } %>
                          
                            <a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm mr-1">View Details</a>
                            <a href="#" class="btn btn-danger btn-sm"><%=b.getPrice()%> <i class="fas fa-rupee-sign"></i></a>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    <% } %>
    </div>
</div>

<%@ include file="all_component/footer.jsp"%>
</body>
</html>
