<%@page import="com.User.Post"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
		<%
	UserDetails user1=(UserDetails)session.getAttribute("userD");
	if(user1 == null){
		
		response.sendRedirect("login.jsp");
		session.setAttribute("Login-error", "Please Login..");
	}	
	%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Note</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%
	Integer noteid=Integer.parseInt(request.getParameter("note_id"));
	 
	PostDAO post = new PostDAO(DBConnect.getConn());
	Post p = post.getDataById(noteid);
	
	
	%>
	

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid">

		<h1 class="text-center">Edit Your Notes</h1>


		<div class="container mt-5 mb-3">

			<div class="row">
				<div class="col-md-12">

					<form action="NoteEditServlet" method="post">
					
					<input type="hidden" value="<%=noteid %>" name="noteid">
					
						<div class="form-group">

							<label for="exampleInputEmail1">Note Title</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>" >
						</div>
 
						<div class="form-group">
							<label for="exampleInputEmail1">Note Content</label>
							<textarea rows="15" cols="" class="form-control" name="content"
								required="required "><%=p.getContent() %></textarea>
						</div>



						<div class="conatiner text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>
					</form>

				</div>

			</div>
		</div>

	</div>
	<%@include file="all_component/footer.jsp"%>

</body>
</html>