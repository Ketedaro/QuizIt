package quizIT;

import java.util.List;

public abstract class Question {
	protected List<Answer> answer;
	protected String entitled;
	protected int id;
	
	public Question(List<Answer> listAwnser, String entit,int ID){
		this.answer=listAwnser;
		this.entitled=entit;
		this.id=ID;
	}
	
	
	public boolean isCorrect(int i){
		return this.answer.get(i).isCorrect();
	}
	
	@Override
	public String toString(){
		return this.entitled;
	}
	
	public int getId(){
		return this.id;
	}
	
	@Override
	public boolean equals(Object obj){
		if (obj == null) {
	        return false;
	    }
		if(!Question.class.isAssignableFrom(obj.getClass())){
			return false;
		}
		final Question other=(Question) obj;
		if ((this.id == 0) ? (other.getId() != 0) : !(this.getId()==other.getId())) {
	        return false;
	    }
		return true;
	}
}
