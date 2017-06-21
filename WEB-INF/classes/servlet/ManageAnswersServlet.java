package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.CurrentGame;

@SuppressWarnings("serial")
public class ManageAnswersServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response){ 
		if(CurrentGame.gameManager(request)){
			try {
				//Partie termin�
				response.sendRedirect("/home");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		;
	}

}
