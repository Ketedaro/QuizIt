package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.NewGame;

public class InitializeGameServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) { 


		request.getSession().setAttribute("game", NewGame.createNewGame(request));
		try {
			//Redirection
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/question-simple.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	
			
		}
}
