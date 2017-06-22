package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.ChangePasswordForm;
import controllers.ConnexionForm;

public class ChangePasswordServlet extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		ChangePasswordForm changePasswordForm= new ChangePasswordForm();

		changePasswordForm.valider(request);
		
		request.setAttribute("changePasswordForm", changePasswordForm);

		try {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/change-password.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/change-password.jsp").forward(request, response);
		
	}
	


}
