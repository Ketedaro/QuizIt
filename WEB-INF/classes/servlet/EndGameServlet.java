package servlet;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.EndGame;
import quizIT.*;

public class EndGameServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		EndGame.ScoreManagement((User) request.getAttribute("user"), (Game) request.getAttribute("game"));
		try {
			// Fin de partie
			response.sendRedirect("/home");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
