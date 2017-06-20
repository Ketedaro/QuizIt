package quizIT;

import java.util.List;

public abstract class Question {
	protected List<Answer> answer;
	protected String entitled;
	protected int id;
	protected String topic;
	protected int submitter;
	protected boolean validate;
	
	public Question(List<Answer> listAwnser, String entit,int ID,String topic,int Submitter){
		this.answer=listAwnser;
		this.entitled=entit;
		this.id=ID;
		this.validate=false;
	}
	
	public void valid(User u) throws Exception{
		if(u.isAdmin())
			this.validate=true;
		else
			throw new Exception("Vous n'avez pas les droits admin pour faire ça");
	}
	
	public boolean getValidate(){
		return this.validate;
	}
	
	public String getTopic(){
		return this.topic;
	}
	
	public int getSubmitter(){
		return this.submitter;
	}
	
	public String getEntitled(){
		return this.entitled;
	}
	
	public boolean isCorrect(int i){
		return this.answer.get(i).isCorrect();
	}
		
	public int getId(){
		return this.id;
	}
	
	public List<Answer> getAnswers(){
		return this.answer;
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
