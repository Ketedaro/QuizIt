package quizIT;

import data.DataBase;

public class Topic {
	
	private String name;
	private String url;
	private String desc;
	
	public Topic(String name,String url,String desc){
		this.name=name;
		this.url=url;
		this.desc=desc;
	}
	
	public String getUrl(){
		return this.url;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getDesc(){
		return this.desc;
	}
	
	public String getType(){
		return DataBase.getDataBase().getTypeByNameTopic(name);
}
}
