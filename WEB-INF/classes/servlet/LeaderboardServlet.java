package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataBase;

@SuppressWarnings("serial")
public class LeaderboardServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/leaderboard.jsp").forward(request, response);
		
    }
}
