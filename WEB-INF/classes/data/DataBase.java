package data;


import java.util.HashMap;
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

	public int sizeQuestion(String type) {
		return dataBConnect.getSizeQuestion(type);		
	}
	
	public int sizeQuestion(String[] type) {
		int size=0;
		for(int i=0;i<type.length;i++){
			size=this.sizeQuestion(type[i]);
		}
		return size;
	}

	public Question getQuestion(int id, String type) {
		return this.getTypeQuestion(dataBConnect.getQuestion(id,type),type);
	}
	
	public Question getQuestion(int id, String[]type) {
		int numType=(int)(Math.random()*type.length);
		return this.getQuestion(id,type[numType]);
	}
  
	private Question getTypeQuestion(HashMap<String, String> question,String type) {
		return null;
	}	
}
