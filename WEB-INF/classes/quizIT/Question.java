package quizIT;

import java.util.List;

import data.DataBase;

public abstract class Question {
	protected List<Answer> answer;
	protected String entitled;
	protected int id = 0;
	protected String topic;
	protected int submitter;
	protected boolean validate;

	public Question(List<Answer> listAwnser, String entit, int ID, String topic, int Submitter) {
		this.answer = listAwnser;
		this.entitled = entit;
		this.id = ID;
		this.validate = false;
		this.topic=topic;
	}

	public Question(String entitled2, String topic2, int submitter2) {
		this.entitled=entitled2;
		this.topic=topic2;
		this.submitter=submitter2;
	}

	public void valid(User u) throws Exception {
		if (u.isAdmin())
			this.validate = true;
		else
			throw new Exception("Vous n'avez pas les droits admin pour faire �a");
	}

	public boolean getValidate() {
		return this.validate;
	}

	public String getTopic() {
		return this.topic;
	}
	
	public String getType() {
		return DataBase.getDataBase().getTypeByNameTopic(this.topic);
	}

	public int getSubmitter() {
		return this.submitter;
	}

	public String getEntitled() {
		return this.entitled;
	}

	public boolean isCorrect(int i) {
		return this.answer.get(i).isCorrect();
	}

	public int getId() {
		return this.id;
	}

	public List<Answer> getAnswers() {
		return this.answer;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj == null) {
			return false;
		}
		if (!Question.class.isAssignableFrom(obj.getClass())) {
			return false;
		}
		final Question other = (Question) obj;
		if ((this.id == 0) ? (other.getId() != 0) : !(this.getId() == other.getId())) {
			return false;
		}
		return true;
	}

	public void setId(int ID) {
		if (this.id == 0)
			this.id = ID;
	}

	public int getGoodAnswer() throws Exception {
		for (int i = 0; i < this.answer.size(); ++i) {
			if (answer.get(i).correct)
				return i + 1;
		}
		throw new Exception("Question sans bonne r�ponse");
	}

}
