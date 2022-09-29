<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
	UserDetails user2=(UserDetails)session.getAttribute("userD");
	if(user2 == null){
		
		response.sendRedirect("login.jsp");
		session.setAttribute("Login-error", "Please Login..");
	}	
	%>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

<%@include file="all_component/navbar.jsp"%>
<div class="container-fluid" >
<div class="card mt-5 py-5 mb-3 ">
<div class="class-body text-center">
<img alt="" src="img/notesimg.png" class="img-fluid mx-auto" style="max-width : 400px;">
<h1>START TAKING YOUT NOTES</h1>
<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here </a>


</div>
</div>


</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>