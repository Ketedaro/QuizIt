package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.EndGame;
import quizIT.*;

@SuppressWarnings("serial")
public class EndGameServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("user") != null) {
			EndGame.ScoreManagement((User) request.getSession().getAttribute("user"), (Game) request.getSession().getAttribute("game"));
		}
		try {
			// Fin de partie
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/end-game.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
