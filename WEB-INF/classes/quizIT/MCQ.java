package quizIT;

import java.util.List;

public class MCQ extends Question{

	public MCQ(List<Answer> listAwnser, String entit, int ID, String topic, int Submitter) {
		super(listAwnser, entit, ID, topic, Submitter);
	}

	public MCQ(String entitled, String topic, int submitter) {
		super(entitled,topic,submitter);
	}

}
