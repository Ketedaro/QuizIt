package servlet;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.EndGame;

@SuppressWarnings("serial")
public class EndGameServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		if(request.getSession().getAttribute("utilisateur") != null) {
			
			EndGame.ScoreManagement(request);
		}
		try {
			// Fin de partie
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/end-game.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
