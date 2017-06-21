package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controllers.ConnexionForm;

public class DeconnexionServlet {
	private String message;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		HttpSession session = request.getSession(false);
		
		if (session == null) {
			message = "Vous n'êtes pas connecté.";
			request.setAttribute("/*TODO*/", message);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			message = "Vous êtes déconnecté.";
			session.invalidate();
			request.setAttribute("/*TODO*/", message);
			response.sendRedirect("index.jsp");
		}
	}
}
