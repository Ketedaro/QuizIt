package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.Validate;

public class ValidateServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) {
		Validate.validateQ(request);
		try {
			response.sendRedirect(request.getContextPath()+"/validate-questions");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("UnvalidateQuestions", Validate.getQuestionUnvalidate(request));
		
		try {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/validate-questions.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
}
