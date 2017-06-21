package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeconnexionServlet {
	private String message;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			message = "Vous n'�tes pas connect�.";
			request.setAttribute("/*TODO*/", message);
			request.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
		} else {
			message = "Vous �tes d�connect�.";
			session.invalidate();
			request.setAttribute("/*TODO*/", message);
			response.sendRedirect("/WEB-INF/views/index.jsp");
		}
	}
}
