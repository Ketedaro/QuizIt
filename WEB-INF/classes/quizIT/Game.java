package quizIT;

import java.util.ArrayList;
import java.util.List;

import data.DataBase;

public class Game {
	private List<Question> questions;
	private List<Answer> answers;
	private int cpt;

	// Evolution possible ?GENRE?

	// Partie avec un seul type de question
	public Game(int nbQ, Class<? extends Question> type) {
		cpt = 0;
		this.answers = new ArrayList<Answer>();
		this.questions = new ArrayList<Question>();
		DataBase db = DataBase.getDataBase();
		Question tmp;
		for (int i = 0; i < nbQ; i++) {
			tmp = db.getRandQuestion(type.getSimpleName());
			if (!questions.contains(tmp))
				this.questions.add(tmp);
			else
				i--;
		}
	}

	public Game(int nbQ, Class<?> type, String topic) {
		DataBase db = DataBase.getDataBase();
		Question tmp;
		this.answers = new ArrayList<Answer>();
		this.questions = new ArrayList<Question>();
		for (int i = 0; i < nbQ; i++) {
			tmp = db.getRandQuestion(type.getSimpleName(), topic);
			if (!questions.contains(tmp))
				this.questions.add(tmp);
			else
			i--;
		}
	}

	public Question getQuestion(int num) {
		return this.questions.get(num);
	}

	public boolean play(int ans) {
		Question quest = this.questions.get(this.cpt);
		this.answers.add(quest.getAnswers().get(ans - 1));
		this.cpt++;
		if (cpt >= this.questions.size())
			return true;
		return false;
	}
	
	public List<Answer> getAnswers(){
		return this.answers;
	}

	public int getCpt() {
		return cpt;
	}

	public Question getCurrentQuestion() {
		return this.questions.get(cpt);
	}
}
/*
 * 
 * //Partie avec un seul type de question public Game(int nbQ,String type){
 * score=0; DataBase db=DataBase.getDataBase(); int max=db.sizeQuestion(type);
 * int rdm; Question tmp; for(int i=0;i<nbQ;i++){
 * rdm=(int)(Math.random()*(max)); tmp=db.getQuestion(rdm,type);
 * if(questions.contains(tmp)) this.questions.add(tmp); } }
 * 
 * //Partie avec différent type de question public Game(int nbQ,String type[]){
 * score=0; DataBase db=DataBase.getDataBase(); int max=db.sizeQuestion(type);
 * int rdm; Question tmp; for(int i=0;i<nbQ;i++){
 * rdm=(int)(Math.random()*(max)); tmp=db.getQuestion(rdm,type);
 * if(questions.contains(tmp)) this.questions.add(tmp); } }
 */
