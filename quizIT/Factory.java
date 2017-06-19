package quizIT;

import java.util.List;

public class Factory {

	public static Question getQuestion(int id, String type, String topic, String entitled, String mp3Link,
			int submitter, boolean valid, List<Answer> listAnw) {
		Question newQuestion=null;
		switch(type){
		case "MCQ":
			newQuestion=new MCQ(listAnw,entitled,id,topic,submitter);
			break;
		case "Blindtest":
			newQuestion=new Blindtest(listAnw,entitled,id,topic,submitter,mp3Link);
			break;
		}
		return newQuestion;
	}

	public static Answer getAnswer(String answerEnti, String typeAns, boolean correct) {
		Answer newAnswer = null;
		switch(typeAns){
		case "simple":
			newAnswer=new SimpleAnswer(answerEnti,correct);
			break;
		}
		return newAnswer;
	}

	public static User getUser(int id, String login, String password, String email, int score, boolean isAdmin) {
		//Possibilité de faire un traitement sur le password ici
		return new User(id,login,password,email,score,isAdmin);
	}

}
