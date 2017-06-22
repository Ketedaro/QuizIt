package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.InscriptionForm;

public class InscriptionServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response){ 
		InscriptionForm form = new InscriptionForm();
	
		form.valider(request);
		
		request.setAttribute("form_inscription", form);
		try {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/sign_in.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
    }
	
}