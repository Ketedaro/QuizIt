package data;

import java.util.List;

import quizIT.Question;
import quizIT.Topic;
import quizIT.User;

public class DataBase {
		
	private static DataBase INSTANCE=null;
	private DBConnect dataBConnect;
	
	private DataBase(){
		this.dataBConnect=new DBConnect();
	}
	
	public static DataBase getDataBase(){
		if(INSTANCE==null)
			INSTANCE=new DataBase();
		return INSTANCE;
	}

	public List<Question> getQuestions(String type) {
		return dataBConnect.getQuestion(type);		
	}
	
	public int sizeQuestion(String type) {
		return this.getQuestions(type).size();
	}

	public Question getQuestion(int id) {
		return dataBConnect.getQuestion(id);
	}
	
	public List<Topic> getTopics() {
		return dataBConnect.getTopics();
	}
	
	//R�cup�re une question al�toire d'un certain type
	public Question getRandQuestion(String type) {
		return dataBConnect.getRandQuestion(type);
	}

	//Changement des donn�es de l'utilisateur apr�s une partie
	public void playGame(User user, int scoreGame) {
		dataBConnect.playGame(user, scoreGame);
	}
	
	public void addQuestion(Question q){
		try {
			dataBConnect.addQuestion(q);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public boolean existLogin(String login){
		return this.dataBConnect.existLogin(login);
	}
	
	public boolean existUser(String login, String pass){
		return this.dataBConnect.existUser(login, pass);
	}
	

	public void createNewUser(String formPseudo, String formPwd, String formMail) {
		this.dataBConnect.createUser(formPseudo,formPwd,formMail);
	}

	public User getUser(String formPseudo) {
		return this.dataBConnect.getUser(formPseudo);
	}

	public Question getRandQuestion(String type, String topic) {
		return dataBConnect.getRandQuestion(type,topic);
	}

	public List<User> getTopUser() {
		return dataBConnect.getTopUser();
	}

	public List<String> getListNameType() {
		return dataBConnect.getListNameType();
	}

	public List<Topic> getTopicByType(String type) {
		return dataBConnect.getTopicByType(type);
	}

	public String getTypeByNameTopic(String name) {
		return dataBConnect.getTypeByNameTopic(name);
	}

	public Topic getTopicByName(String name) {
		return dataBConnect.getTopicbyName(name);
	}
	
	public void changePassword(String login, String password){
		dataBConnect.changePassword(login, password);
	}
	
}
