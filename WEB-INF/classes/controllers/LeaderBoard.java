package controllers;

import java.util.List;

import data.DataBase;
import quizIT.User;

public class LeaderBoard {
	
	public static List<User> getTopUser(){
		return DataBase.getDataBase().getTopUser();
	}
}
