package quizIT;

public abstract class Answer {
	protected String answer;
	protected boolean correct;
	
	
	public Answer(String answ, boolean corre){
		this.answer=answ;
		this.correct=corre;
	}
	
	@Override
	public String toString(){
		return answer;
	}
	
	public boolean isCorrect(){
		return this.correct;
	}
	
}
