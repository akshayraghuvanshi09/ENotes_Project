<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	UserDetails user3 = (UserDetails) session.getAttribute("userD");
	if (user3 == null) {

		response.sendRedirect("login.jsp");
		session.setAttribute("Login-error", "Please Login..");
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>


	<div class="container show_page">
		
		<%
	String updateMsg=(String)session.getAttribute("updateMsg");
	if(updateMsg!=null)
	{%>
		
		
		<div class="alert alert-success" role="alert"><%=updateMsg %></div> 
		
	<%
	session.removeAttribute("updateMsg");
	
	}
	
	%>
	
	
	
		<%
	String wrongMsg=(String)session.getAttribute("wrongMsg");
	if(wrongMsg!=null)
	{%>
		
		
		<div class="alert alert-danger" role="alert"><%=wrongMsg %></div> 
		
	<%
	session.removeAttribute("wrongMsg");
	
	}
	
	%>
		
		
		
		<h2 class="text-center">All Notes:</h2>
		
		<div class="row mt-2 mb-5 ">
			<div class="col-md-12">
				<%
					if (user3 != null) {
						PostDAO ob = new PostDAO(DBConnect.getConn());
						List<Post> post = ob.getData(user3.getId());
						for (Post po : post) {
				%>
				<div class="card mt-3 ">
				
					<img alt="" src="img/notesimg.png"
						class="card-img-top mt-2 mx-auto" style="max-width: 100px;">


					<div class="card-bodyp-4 ml-1 mb-1">
						<h5 class="card-title "><%=po.getTitle() %></h5>
						<p><%=po.getContent() %>.</p>


						<p>
							<b class="text-success">Published By: <%=user3.getName() %></b></br> <b class="text-primary"></b>
						</p>
						
						<p>
							<b class="text-success">Published Date: <%=po.getPdate() %></b></br> <b class="text-success"></b>
						</p>

						<div class="container text-center mt-2">
							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete </a>
							
							 <a href="edit.jsp?note_id=<%=po.getId() %>"
							 class="btn btn-primary"> Edit </a>
						</div>
					</div>
				</div>




				<%
					}
						
					}
				%>

			</div>

		</div>
	</div>
<%@include file="all_component/footer.jsp"%>
</body>
</html>