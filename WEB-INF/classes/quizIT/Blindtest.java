package quizIT;

import java.util.List;

public class Blindtest extends Question{
	private String linkMp3;
	
	public Blindtest(List<Answer> listAwnser, String entit, int ID, String topic, int Submitter, String linkMP3) {
		super(listAwnser, entit, ID, topic, Submitter);
		this.setLinkMp3(linkMP3);			
	}

	public Blindtest(String entitled, String topic, int submitter, String mp3Link) {
		super(entitled,topic,submitter);
		this.linkMp3=mp3Link;
	}

	public String getLinkMp3() {
		return linkMp3;
	}

	public void setLinkMp3(String linkMp3) {
		this.linkMp3 = linkMp3;
	}

}
