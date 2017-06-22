package controllers;

import data.DataBase;
import quizIT.Game;
import quizIT.User;

public class EndGame {

	public static void ScoreManagement(User user,Game game){
		int score=0;
		for(int i=0;i<game.getCpt();i++){
			if(game.getAnswers().get(i).isCorrect())
				score++;
			
		}
		DataBase.getDataBase().playGame(user,score);
	}
}
