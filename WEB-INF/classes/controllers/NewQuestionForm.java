package controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import data.DataBase;
import quizIT.Factory;
import quizIT.Question;
import quizIT.Topic;
import quizIT.User;

public class NewQuestionForm {

	String message="";
	
	public void SetNewQuestion(HttpServletRequest request){
		String topic=request.getParameter("topic");
		String type=request.getParameter("type");
		String questContent=request.getParameter("questContent");
		String mp3link=request.getParameter("mp3Link");
		if(mp3link.equals(""))
			mp3link=null;
		User user=(User) request.getSession().getAttribute("utilisateur");
		int idSubmitter=user.getId();
		Question q=null;
		try {
			q = Factory.getQuestion(type, topic, questContent, mp3link, idSubmitter, false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		DataBase.getDataBase().setNewQuestion(q);
		List<String> listAnswer=new ArrayList<String>();
		String line;
		int cpt=1;
		while(true){
			line=request.getParameter("Réponse"+cpt);
			if(line == null)
				break;
			listAnswer.add(line);
			++cpt;
		}
		String typeAns=request.getParameter("typeAns");
		String desc=request.getParameter("Description");
		int goodA=Integer.valueOf(request.getParameter("goodAnswer"));
		int idQ=DataBase.getDataBase().getIdQuestion(q);
		System.out.println(idQ);
		for(int i=0;i<listAnswer.size();++i){
			if(goodA-1==i)
				try {
					DataBase.getDataBase().setNewAnswer(Factory.getAnswer(listAnswer.get(i), typeAns, desc, true),idQ);
				} catch (Exception e) {
					e.printStackTrace();
				}
			else{
				try {
					DataBase.getDataBase().setNewAnswer(Factory.getAnswer(listAnswer.get(i), typeAns, "", false),idQ);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		
		
		//topic
		//type
		//questContent
		//mp3link
		
		//answerContent 
		//desc_answer
		//isTrue => num chercher avec reponseX
		
		//Query idquest
		
		//INSERT INTO answers (id_quest, typeAnswer, answerContent, desc_answer, isTrue)
		//INSERT INTO questions (typeQuest, topicQuest, questContent, mp3_link, id_submitter, validation) 
		
		//Tester si mp3link "" => null
	}
	
	public String getMessage(){
		return this.message;
	}

	public static List<Topic> getTopics() {
		return DataBase.getDataBase().getTopics();
	}

	public static List<String> getTypeAnswer() {
		return DataBase.getDataBase().getTypeAnswer();
	}
}
