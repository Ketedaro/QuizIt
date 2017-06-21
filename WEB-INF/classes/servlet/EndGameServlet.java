package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.EndGame;
import quizIT.Game;
import quizIT.User;

public class EndGameServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		EndGame.ScoreManagement((User) request.getAttribute("user"), (Game) request.getAttribute("game"));
		try {
			this.getServletContext().getRequestDispatcher("/WEB-INF/JSP/accueil.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
