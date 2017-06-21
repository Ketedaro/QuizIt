package controllers;

import javax.servlet.http.HttpServletRequest;

import quizIT.Game;

public class CurrentGame {
	
	public static boolean gameManager(HttpServletRequest request){
		Game game=(Game) request.getAttribute("game");
		int answer= (int) request.getAttribute("answer");
		return game.play(answer);
	}
}
