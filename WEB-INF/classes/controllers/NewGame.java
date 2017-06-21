package controllers;

import javax.servlet.http.HttpServletRequest;

import quizIT.Factory;
import quizIT.Game;

public class NewGame {
	
	public static Game createNewGame(HttpServletRequest request){
		  String type=request.getParameter("type");
          String topic=request.getParameter("topic");
          int nbQ=Integer.valueOf(request.getParameter("NbQuest"));
          Class<?> classe = null;
		try {
			classe = Class.forName("quizIT."+type);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
          return Factory.getGame(nbQ,classe,topic);            
	}
}
