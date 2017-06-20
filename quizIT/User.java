package quizIT;

import data.DataBase;

public class User {
	private int id;
	private int score;
	private String email;
	private String login;
	private String password;
	private boolean isAdmin;
	
	public User(int ID,String log,String pass,String mail,int scor,boolean admin){
		this.id=ID;
		this.login=log;
		this.password=pass;
		this.email=mail;
		this.score=scor;
		this.isAdmin=admin;
	}
	
	public int getScore(){
		return this.score;
	}
	
	public String getLogin(){
		return this.login;
	}
	
	public boolean isAdmin(){
		return this.isAdmin;
	}
	
	public String getEmail(){
		return this.email;
	}
		
	public int getId(){
		return this.id;
	}
	
	public String getPassword(){
		return this.password;
	}
	
	public void playGame(int s){
		this.score+=s;
		DataBase.getDataBase().playGame(this);
	}
}

