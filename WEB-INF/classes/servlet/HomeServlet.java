package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controllers.Home;

@SuppressWarnings("serial")
public class HomeServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setAttribute("topics", Home.getTopics());
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/index.jsp").forward(request, response);
		
    }
}
