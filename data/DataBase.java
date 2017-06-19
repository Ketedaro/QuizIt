package data;

import java.util.List;

import quizIT.Question;

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
	
	public int sizeQuestion(String[] type) {
		int size=0;
		for(int i=0;i<type.length;i++){
			size=this.sizeQuestion(type[i]);
		}
		return size;
	}

	public int sizeQuestion(String type) {
		return this.getQuestions(type).size();
	}

	public Question getQuestion(int id) {
		return dataBConnect.getQuestion(id);
	}
	
	//Récupère une question alétoire d'un type choisi aléatoirement dans un tableau de type
	public Question getQuestion(int id, String[]type) {
		int numType=(int)(Math.random()*type.length);
		return this.getRandQuestion(type[numType]);
	}
	//Récupère une question alétoire d'un certain type
	public Question getRandQuestion(String type) {
		return dataBConnect.getRandQuestion(type);
	}
	
}
