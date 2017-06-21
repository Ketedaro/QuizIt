package quizIT;

public abstract class Answer {
	protected String answer;
	protected int id;
	protected boolean correct;
	
	
	public Answer(int id,String answ, boolean corre){
		this.id=id;
		this.answer=answ;
		this.correct=corre;
	}
	
	public String getAnswer(){
		return answer;
	}
	
	public int getId(){
		return this.id;
	}
	
	public boolean isCorrect(){
		return this.correct;
	}
	
}
