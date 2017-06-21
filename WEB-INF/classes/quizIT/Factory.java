package quizIT;

import java.util.List;

public class Factory {

	public static Question getQuestion(int id, String type, String topic, String entitled, String mp3Link,
			int submitter, boolean valid, List<Answer> listAnw) throws Exception {
		Question newQuestion=null;
		switch(type){
		case "MCQ":
			newQuestion=new MCQ(listAnw,entitled,id,topic,submitter);
			break;
		case "Blindtest":
			newQuestion=new Blindtest(listAnw,entitled,id,topic,submitter,mp3Link);
			break;
		default:
			throw new Exception("Le type "+type+" n'est pas connu");
		}
		return newQuestion;
	}

	public static Answer getAnswer(int id_answer, String answerEnti, String typeAns, boolean correct) throws Exception {
		Answer newAnswer = null;
		switch(typeAns){
		case "simple":
			newAnswer=new SimpleAnswer(id_answer,answerEnti,correct);
			break;
		default:
			throw new Exception("Le type "+typeAns+" n'est pas connu");
		}
		return newAnswer;
	}
	public static Answer getAnswer(int id_answer, String answerEnti, String typeAns, boolean correct,String desc) throws Exception {
		Answer newAnswer = null;
		switch(typeAns){
		case "simple":
			newAnswer=new SimpleAnswer(id_answer,answerEnti,correct,desc);
			break;
		default:
			throw new Exception("Le type "+typeAns+" n'est pas connu");
		
		}
		return newAnswer;
	}

	public static User getUser(int id, String login, String password, String email, int score, boolean isAdmin) {
		//Possibilité de faire un traitement sur le password ici
		return new User(id,login,password,email,score,isAdmin);
	}

	public static Game getGame(int nbQ, Class<?> classe, String topic) {
		return new Game(nbQ,classe,topic);
	}

}
