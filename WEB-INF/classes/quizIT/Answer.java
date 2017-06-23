package quizIT;

public abstract class Answer {
	protected String answer;
	protected int id;
	protected boolean correct;
	protected String description;
	
	
	
	public Answer(int id,String answ, boolean corre){
		this.id=id;
		this.answer=answ;
		this.correct=corre;
		this.description="";
	}
	public Answer(int id,String answ,boolean corre,String desc){
		this(id,answ,corre);
		this.description=desc;
	}
	
	public Answer(String answerEnti, boolean correct2, String desc) {
		this.answer=answerEnti;
		this.correct=correct2;
		this.description=desc;
	}
	public String getAnswer(){
		return answer;
	}
	
	public String getDescription(){
		return this.description;
	}
	
	public int getId(){
		return this.id;
	}
	
	public boolean isCorrect(){
		return this.correct;
	}
	
}
