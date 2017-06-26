package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.CurrentGame;

@SuppressWarnings("serial")
public class GameServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().setAttribute("game", CurrentGame.gameManager(request));

		if (CurrentGame.isEnd(request)) {
			try {
				// Partie terminé .
				response.sendRedirect(request.getContextPath()+"/end-game");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			// Partie en cours
			try {
				this.getServletContext().getRequestDispatcher("/WEB-INF/views/question-simple.jsp").forward(request,response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);
		
	}

}
