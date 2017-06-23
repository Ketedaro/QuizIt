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
		case "BlindTest":
			newQuestion=new Blindtest(listAnw,entitled,id,topic,submitter,mp3Link);
			break;
		default:
			throw new Exception("Le type "+type+" n'est pas connu");
		}
		return newQuestion;
	}
	
	public static Question getQuestion(String type,String topic,String entitled,String mp3Link, int submitter,boolean valid) throws Exception{
		Question newQuestion=null;
		switch(type){
		case "MCQ":
			newQuestion=new MCQ(entitled,topic,submitter);
			break;
		case "BlindTest":
			newQuestion=new Blindtest(entitled,topic,submitter,mp3Link);
			break;
		default:
			throw new Exception("Le type "+type+" n'est pas connu");
		}
		return newQuestion;
	}

	public static Answer getAnswer(int id_answer, String answerEnti, String typeAns, boolean correct) throws Exception {
		Answer newAnswer = null;
		switch(typeAns){
		case "SimpleAnswer":
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
		case "SimpleAnswer":
			newAnswer=new SimpleAnswer(id_answer,answerEnti,correct,desc);
			break;
		default:
			throw new Exception("Le type "+typeAns+" n'est pas connu");
		
		}
		return newAnswer;
	}

	public static User getUser(int id, String login, String password, String email, int score, boolean isAdmin) {
		//Possibilit� de faire un traitement sur le password ici
		return new User(id,login,password,email,score,isAdmin);
	}

	public static Game getGame(int nbQ, Class<?> classe, String topic) {
		return new Game(nbQ,classe,topic);
	}

	public static Topic getTopic(String name, String url, String desc) {
		return new Topic(name,url,desc);
	}

	public static Answer getAnswer(String answerEnti, String typeAns,String desc, boolean correct) throws Exception {
		Answer newAnswer = null;
		switch(typeAns){
		case "SimpleAnswer":
			newAnswer=new SimpleAnswer(answerEnti,correct,desc);
			break;
		default:
			throw new Exception("Le type "+typeAns+" n'est pas connu");
		
		}
		return newAnswer;
	}

}
