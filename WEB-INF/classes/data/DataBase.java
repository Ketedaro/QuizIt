package data;

import quizIT.Question;

public class DataBase {
		
	private static DataBase INSTANCE=null;
	private DBConnect dataBConnect;
	
	private DataBase(){
		
	}
	
	public static DataBase getDataBase(){
		if(INSTANCE==null)
			INSTANCE=new DataBase();
		return INSTANCE;
	}

	public int sizeQuestion(String string) {
		return dataBConnect.getSizeQuestion(string);		
	}
	
	public int sizeQuestion(String[] type) {
		int size=0;
		for(int i=0;i<type.length;i++){
			size=this.sizeQuestion(type[i]);
		}
		return size;
	}

	public Question getQuestion(int id, String type) {
		return dataBConnect.getSizeQuestion(id,type);
	}
	
	public Question getQuestion(int id, String[]type) {
		int numType=(int)(Math.random()*type.length);
		return this.getQuestion(id,type[numType]);
	}

	

	
}
