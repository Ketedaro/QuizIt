package controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import data.DataBase;
import quizIT.Question;
import quizIT.User;

public class Validate {

	public static void validateQ(HttpServletRequest request){
		int id= Integer.valueOf(request.getParameter("id_quest"));
		User user=(User) request.getSession().getAttribute("utilisateur");
		if(user.isAdmin())
			DataBase.getDataBase().validateQuestion(id);
	}
	
	public static List<Question> getQuestionUnvalidate(HttpServletRequest request){
		return DataBase.getDataBase().getQuestionUnvalidate();
		
	}
}
