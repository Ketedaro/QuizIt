package controllers;

import javax.servlet.http.HttpServletRequest;

import data.DataBase;
import quizIT.Factory;
import quizIT.Game;

public class NewGame {
	
	public static Game createNewGame(HttpServletRequest request){
		  String topic=request.getParameter("topic");
		  System.out.println("New Game"+topic);
          String type=DataBase.getDataBase().getTopicByName(request.getParameter("topic")).getType();
          int nbQ=3;
          Class<?> classe = null;
		try {
			classe = Class.forName("quizIT."+type);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
          return Factory.getGame(nbQ,classe,topic);            
	}
}
