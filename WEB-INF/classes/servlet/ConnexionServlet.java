package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

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
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		ConnexionForm connexion_utilisateur = new ConnexionForm();

		connexion_utilisateur.valider(request);

		try {
			if (!connexion_utilisateur.isCorrect()) {

				request.setAttribute("form_connexion", connexion_utilisateur);
				this.getServletContext().getRequestDispatcher("/WEB-INF/views/connexion.jsp").forward(request, response);

			} else {

				request = connexion_utilisateur.creerSession(request);
				response.sendRedirect(request.getContextPath()+"/home");
			}

		} catch (Exception e) {
			
			try {
				
				this.getServletContext().getRequestDispatcher("/WEB-INF/views/erreur.jsp").forward(request, response);
				
			} catch (ServletException | IOException e1) {
				
				e1.printStackTrace();
			}
			
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/connexion.jsp").forward(request, response);
		
	}
}
