package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ConnexionForm;

public class ConnexionServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		ConnexionForm connexion_utilisateur = new ConnexionForm();

		try {
			connexion_utilisateur.valider(request);

			if (!connexion_utilisateur.isCorrect()) {

				request.setAttribute("form_connexion", connexion_utilisateur);
				this.getServletContext().getRequestDispatcher("/WEB-INF/JSP/accueil.jsp").forward(request, response);

			} else {

				request = connexion_utilisateur.creerSession(request);
				this.getServletContext().getRequestDispatcher("/WEB-INF/JSP/accueil.jsp").forward(request, response);

			}
		} catch (Exception e) {
			try {
				this.getServletContext().getRequestDispatcher("/WEB-INF/JSP/erreur.jsp").forward(request, response);
			} catch (ServletException | IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();

		}
	}
}
