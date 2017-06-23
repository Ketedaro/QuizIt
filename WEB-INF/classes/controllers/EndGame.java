package controllers;

import javax.servlet.http.HttpServletRequest;

import data.DataBase;
import quizIT.Game;
import quizIT.User;

public class EndGame {

	public static void ScoreManagement(HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("utilisateur");
		Game game=(Game) request.getSession().getAttribute("game");
		int score=0;
		for(int i=0;i<game.getCpt();i++){
			if(game.getAnswers().get(i).isCorrect())
				score++;
			
		}
		score+= DataBase.getDataBase().getUser(user.getLogin()).getScore();
		DataBase.getDataBase().playGame(score,user.getId());
	}
}
