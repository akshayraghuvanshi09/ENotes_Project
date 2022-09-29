package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;


@WebServlet("/NoteEditServlet")
public class NoteEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try {
			
			
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PostDAO dao = new PostDAO(DBConnect.getConn());
			boolean f = dao.postUpdate(noteid, title, content);
			
			if(f)
			{
				System.out.println("data update successfully"); 
				HttpSession session = request.getSession();
				session.setAttribute("updateMsg", "Notes Update Successfully");
				response.sendRedirect("showNotes.jsp");
			}
			else
			{
				System.out.println("data note upadated");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
