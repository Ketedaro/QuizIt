package quizIT;

import java.util.List;

import data.DataBase;

public class Game {
	private List<Question> questions;
	private int score;
	
	//Evolution possible ?GENRE?
	
	
	
	//Partie avec un seul type de question
		public Game(int nbQ,Class<? extends Question> type){
			score=0;
			DataBase db=DataBase.getDataBase();
			int max=db.sizeQuestion(type.getSimpleName());
			int rdm;
			Question tmp;
			for(int i=0;i<nbQ;i++){
				rdm=(int)(Math.random()*(max));
				tmp=db.getQuestion(rdm,type.getSimpleName());
				if(questions.contains(tmp))
					this.questions.add(tmp);
			}
		}
	
	public Game(int nbQ,Class<? extends Question> type[]){
		score=0;
		DataBase db=DataBase.getDataBase();
		String[] typeS=new String[type.length];
		for(int i=0;i<type.length;i++){
			typeS[i]=type[i].getSimpleName();
		}
		int max=db.sizeQuestion(typeS);
		int rdm;
		Question tmp;
		for(int i=0;i<nbQ;i++){
			rdm=(int)(Math.random()*(max));
			tmp=db.getQuestion(rdm,typeS);
			if(questions.contains(tmp))
				this.questions.add(tmp);
		}
	}
	
	public Question getQuestion(int num){
		return this.questions.get(num);
	}
	
	public int getScore(){
		return score;
	}
	
	public void goodAnswer(){
		++score;
	}
}
/*
 * 	
	//Partie avec un seul type de question
	public Game(int nbQ,String type){
		score=0;
		DataBase db=DataBase.getDataBase();
		int max=db.sizeQuestion(type);
		int rdm;
		Question tmp;
		for(int i=0;i<nbQ;i++){
			rdm=(int)(Math.random()*(max));
			tmp=db.getQuestion(rdm,type);
			if(questions.contains(tmp))
				this.questions.add(tmp);
		}
	}
	
	//Partie avec différent type de question
		public Game(int nbQ,String type[]){
			score=0;
			DataBase db=DataBase.getDataBase();
			int max=db.sizeQuestion(type);
			int rdm;
			Question tmp;
			for(int i=0;i<nbQ;i++){
				rdm=(int)(Math.random()*(max));
				tmp=db.getQuestion(rdm,type);
				if(questions.contains(tmp))
					this.questions.add(tmp);
				}
			}
*/
