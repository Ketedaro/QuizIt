package servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.NewQuestionForm;

public class NewQuestionServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response){
		NewQuestionForm NQ=new NewQuestionForm();
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		NQ.SetNewQuestion(request);
		request.setAttribute("message", "Votre question a bien été soumise.");
		try {
			
			response.sendRedirect(request.getContextPath()+"/home");
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("topics", NewQuestionForm.getTopics());
		request.setAttribute("types", NewQuestionForm.getTypeAnswer());
		try {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/new-question.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}
}
