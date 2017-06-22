package controllers;

import java.util.ArrayList;
import java.util.List;

import data.DataBase;
import quizIT.Topic;

public class Home {
	
	public static List<List<Topic>> getTopics(){
		List<List<Topic>> lTopics= new ArrayList<List<Topic>>();
		List<String> listNameType=DataBase.getDataBase().getListNameType();
		for(int i=0;i<listNameType.size();++i){
			lTopics.add(DataBase.getDataBase().getTopicByType(listNameType.get(i)));
		}
		return lTopics;
		
	}
}
