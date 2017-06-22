package quizIT;

public class SimpleAnswer extends Answer{

	public SimpleAnswer(int id,String answ, boolean corre) {
		super(id,answ, corre);
	}

	public SimpleAnswer(int id_answer, String answerEnti,  boolean correct,String desc) {
		super(id_answer, answerEnti,correct,desc);
	}

}
