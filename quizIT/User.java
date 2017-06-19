package quizIT;

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
	
	
}
