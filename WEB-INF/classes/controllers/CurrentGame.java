package controllers;

import javax.servlet.http.HttpServletRequest;

import quizIT.Game;

public class CurrentGame {
	
	public static Game gameManager(HttpServletRequest request){
		Game game=(Game) request.getSession().getAttribute("game");
		int answer= Integer.parseInt(request.getParameter("answer"));
		Game gameR=null;
		try {
			gameR= game.play(answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return gameR;
	}

	public static boolean isEnd(HttpServletRequest request) {
		Game game=(Game) request.getSession().getAttribute("game");
		return game.isFinish();
	}
}

