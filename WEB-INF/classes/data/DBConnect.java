package data;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import quizIT.Answer;
import quizIT.Blindtest;
import quizIT.Factory;
import quizIT.Question;
import quizIT.Topic;
import quizIT.User;

public class DBConnect {

	private Connection connect;

	public DBConnect() {
		File file = new File(
				DBConnect.class.getProtectionDomain().getCodeSource().getLocation().getPath() + "config.txt");

		try {
			FileReader fis = new FileReader(file);
			@SuppressWarnings("resource")
			BufferedReader buff = new BufferedReader(fis);
			try {
				String className = buff.readLine();
				String url = buff.readLine();
				String login = buff.readLine();
				String password = buff.readLine();
				try {
					Class.forName(className);// "oracle.jdbc.OracleDriver"
					// Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e1) {

					e1.printStackTrace();
				}
				try {
					this.connect = DriverManager.getConnection(url, login, password);// ("jdbc:oracle:thin:@localhost:1521:xe",
																						// "SYSTEM",
																						// "andy")
					// this.connect =
					// DriverManager.getConnection("jdbc:mysql://127.0.0.1:8000/javagency",
					// "root", "");
				} catch (SQLException e) {

					e.printStackTrace();
				}
			} catch (FileNotFoundException e2) {
				e2.printStackTrace();
			}
		} catch (IOException e2) {
			e2.printStackTrace();
		}
	}

	// Vérifié que le login n'est pas déjé pris
	public boolean existLogin(String login) {
		Statement request;
		ResultSet res;
		boolean tmp = false;
		try {
			String sql = "SELECT * FROM users WHERE login = '" + login + "'";
			request = connect.createStatement();
			res = request.executeQuery(sql);
			tmp = res.next();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return tmp;

	}

	// Verifie qu'un utilisateur existe
	public boolean existUser(String loginConnect, String passConnect) {
		Statement request;
		ResultSet res;
		boolean tmp = false;
		try {
			String sql = "SELECT * FROM users WHERE login = '" + loginConnect + "' and password = '" + passConnect
					+ "'";
			request = connect.createStatement();
			res = request.executeQuery(sql);
			tmp = res.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tmp;

	}

	// Récupérer le nombre de ligne de la table Question
	public List<Question> getQuestion(String type) {
		return this.getQuestions("select * from questions where typeQuest='" + type + "'");
	}

	public Question getRandQuestion(String type) {
		return this.getQuestions("select * from questions where typeQuest='" + type + "' order by rand() limit 1")
				.get(0);
	}

	// Récupérer une question avec son id
	public Question getQuestion(int id) {
		return this.getQuestions("select * from questions where id_quest=" + id).get(0);
	}

	// Récupérer un user avec son id
	public User getUser(int id) {
		return this.getUsers("select * from users where id_user=" + id).get(0);
	}

	public List<Question> getQuestion(String type, String topic) {
		System.out.println("select * from questions where typeQuest='" + type + "' and topicQuest='" + topic + "' and validation=1");
		return this
				.getQuestions("select * from questions where typeQuest='" + type + "' and topicQuest='" + topic + "' and validation=1");
	}

	public void playGame(int scoreGame,int id) {
		int score = scoreGame;
		this.setUpdate("Update users set score=" + score + " where id_user=" + id);
	}

	/*public void addQuestion(Question q) throws Exception {
		String sql = "";
		Statement request = null;
		switch (q.getClass().getSimpleName()) {
		case "MCQ":
			MCQ mcq = (MCQ) q;
			sql = "Insert into questions (typeQuest,topicQuest,questContent,id_submitter,validation)" + " Values ('MCQ'"
					+ mcq.getTopic() + "','" + mcq.getEntitled() + "','" + mcq.getSubmitter() + "','"
					+ mcq.getValidate() + "')";
			break;

		case "Blindtest":
			Blindtest blt = (Blindtest) q;
			sql = "Insert into questions (typeQuest,topicQuest,questContent,mp3_link,id_submitter,validation)"
					+ " Values ('Blindtest','" + blt.getTopic() + "','" + blt.getEntitled() + "','" + blt.getLinkMp3()
					+ "','" + blt.getSubmitter() + "','" + blt.getValidate() + "')";
			break;
		default:
			throw new Exception("Typage incorrect pour une question");
		}
		try {
			request = connect.createStatement();
			request.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		ResultSet resultSet = request.executeQuery("select id_quest from questions where typeQuest='"
				+ q.getClass().getSimpleName() + "' and topicQuest='" + q.getTopic() + "' and questContent="
				+ q.getEntitled() + "' and id_submitter=" + q.getSubmitter() + " and validation='" + q.getValidate());
		resultSet.next();
		q.setId(resultSet.getInt("id_quest"));

		List<Answer> lA = q.getAnswers();
		String sql2 = "";
		for (int i = 0; i < lA.size(); ++i) {
			switch (lA.get(i).getClass().getSimpleName()) {
			case "SimpleAnswer":
				SimpleAnswer sA = (SimpleAnswer) lA.get(i);
				sql2 = "Insert into answers (id_answer,id_quest,typeAnswer,answerContent,isTrue)" + " Values ('"
						+ sA.getId() + "','" + q.getId() + "','SimpleAnswer','" + sA.getAnswer() + "','"
						+ sA.isCorrect() + "')";
				break;

			default:
				throw new Exception("Typage incorrect pour une réponse");
			}
			try {
				request.executeUpdate(sql2);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}*/

	public void createUser(String formPseudo, String formPwd, String formMail) {
		this.setUpdate("Insert into users(login,password,email,isAdmin) Values('" + formPseudo + "','" + formPwd + "','"
				+ formMail + "', false )");
	}

	public User getUser(String formPseudo) {
		return this.getUsers("select * from users where login='" + formPseudo + "'").get(0);
	}

	public Question getRandQuestion(String type, String topic) {
		return this.getQuestions("select * from questions where typeQuest='" + type + "' and topicQuest='" + topic
				+ "' and validation=1 order by rand() limit 1").get(0);
	}

	private List<User> getUsers(String sql) {
		Statement request;
		ResultSet resultSet;
		String login = null, password = null, email = null;
		int id = 0, score = 0;
		boolean isAdmin = false;
		List<User> lUser = new ArrayList<User>();
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);

			while (resultSet.next()) {
				id = resultSet.getInt("id_user");
				login = resultSet.getString("login");
				password = resultSet.getString("password");
				email = resultSet.getString("email");
				score = resultSet.getInt("score");
				isAdmin = resultSet.getBoolean("isAdmin");
				lUser.add(Factory.getUser(id, login, password, email, score, isAdmin));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lUser;
	}

	private List<Answer> getAnswers(String sql) {
		Statement request;
		ResultSet resultSet;
		int id_answer = 0;
		String answerEnti = null, typeAns = null, desc = null;
		boolean correct = false;
		List<Answer> lAnswer = new ArrayList<Answer>();
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				id_answer = resultSet.getInt("id_answer");
				typeAns = resultSet.getString("typeAnswer");
				answerEnti = resultSet.getString("answerContent");
				desc = resultSet.getString("desc_answer");
				correct = resultSet.getBoolean("isTrue");
				try {
					lAnswer.add(Factory.getAnswer(id_answer, answerEnti, typeAns, correct, desc));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lAnswer;
	}

	private List<Question> getQuestions(String sql) {
		Statement request;
		ResultSet resultSet;
		List<Question> lQuestion = new ArrayList<Question>();

		String entitled = null, type = null, topic = null, mp3Link = null;
		int submitter = 0, id;
		boolean valid = false;
		List<Answer> listAnw = new ArrayList<Answer>();
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				id = resultSet.getInt("id_quest");
				type = resultSet.getString("typeQuest");
				topic = resultSet.getString("topicQuest");
				entitled = resultSet.getString("questContent");
				mp3Link = resultSet.getString("mp3_link");
				submitter = resultSet.getInt("id_submitter");
				valid = resultSet.getBoolean("validation");
				listAnw = this.getAnswers("select * from answers where id_quest=" + id);

				try {
					lQuestion.add(Factory.getQuestion(id, type, topic, entitled, mp3Link, submitter, valid, listAnw));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lQuestion;
	}

	private List<Topic> getTopics(String sql) {
		Statement request;
		ResultSet resultSet;
		List<Topic> lTopic = new ArrayList<Topic>();
		String name, url, desc;

		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				name = resultSet.getString("topicName");
				url = resultSet.getString("pictureURL");
				desc = resultSet.getString("descriptionTopic");
				lTopic.add(Factory.getTopic(name, url, desc));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lTopic;
	}

	private void setUpdate(String sql) {
		Statement request = null;
		try {
			request = connect.createStatement();
			request.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<User> getTopUser() {
		return this.getUsers("SELECT * FROM users ORDER BY score DESC LIMIT 20");
	}

	public List<Topic> getTopics() {
		return this.getTopics("SELECT * FROM topic");
	}

	public List<String> getListNameType() {
		Statement request;
		ResultSet resultSet;
		List<String> listName = new ArrayList<String>();
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery("SELECT distinct typeQuest FROM questions ORDER BY id_quest");
			while (resultSet.next()) {
				listName.add(resultSet.getString("typeQuest"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listName;
	}

	public List<Topic> getTopicByType(String type) {
		List<Question> listQuestion = this.getQuestions("select * from questions where typeQuest='" + type + "'");
		List<String> tampon = new ArrayList<String>();
		List<Topic> lTopic = new ArrayList<Topic>();

		for (int i = 0; i < listQuestion.size(); ++i) {
			if (!tampon.contains(listQuestion.get(i).getTopic()))
				tampon.add(listQuestion.get(i).getTopic());
		}
		for (int i = 0; i < tampon.size(); ++i) {
			lTopic.add(this.getTopicbyName(tampon.get(i)));
		}

		return lTopic;
	}

	public String getTypeByNameTopic(String name) {
		return this.getQuestions("Select * from questions where topicQuest='" + name + "'").get(0).getClass()
				.getSimpleName();
	}

	public Topic getTopicbyName(String name) {
		return this.getTopics("Select * from topic where topicName='" + name + "'").get(0);
	}

	public void changePassword(String login, String password) {
		this.setUpdate("update users set password ='" + password + "' where login = '" + login + "'");
	}

	public void setNewQuestion(Question q) {
		if (q.getClass().getSimpleName().equals("Blindtest")) {
			Blindtest b = (Blindtest) q;
			this.setUpdate("Insert into questions (typeQuest, topicQuest, questContent, mp3_link, id_submitter, validation) Values ('"
			+ q.getClass().getSimpleName() + "' , '" + q.getTopic() + "' , '" + q.getEntitled() + "' , '" + b.getLinkMp3()
			+ "' , '" + q.getSubmitter() + " , false)");
		}
		else{
			this.setUpdate(	
					"Insert into questions (typeQuest, topicQuest, questContent, mp3_link, id_submitter, validation) Values ('"
							+ q.getClass().getSimpleName() + "' , '" + q.getTopic() + "' , '" + q.getEntitled() + "' , null " 
							+ " , " + q.getSubmitter() + " , false)");
		}
		
	}

	public void setNewAnswer(Answer a,int idQ) {
			this.setUpdate("INSERT INTO answers (id_quest, typeAnswer, answerContent, desc_answer, isTrue)"
				+ " Values ("+idQ+" , '"+ a.getClass().getSimpleName()+"' , '"+a.getAnswer()+"' , '"+a.getDescription()+"',"+a.isCorrect()+")");
	}

	public int getIdQuestion(Question q) {
		System.out.println("Select * from questions where typeQuest='" + q.getClass().getSimpleName()
				+ "' and topicQuest='" + q.getTopic() + "' and questContent='" + q.getEntitled()
				+ "' and id_submitter=" + q.getSubmitter() + " and validation=" + q.getValidate());
		return this
				.getQuestions("Select * from questions where typeQuest='" + q.getClass().getSimpleName()
						+ "' and topicQuest='" + q.getTopic() + "' and questContent='" + q.getEntitled()
						+ "' and id_submitter=" + q.getSubmitter() + " and validation=" + q.getValidate())
				.get(0).getId();
	}

	public List<String> getTypeAnswer() {
		List<Answer> lA=this.getAnswers("select distinct * from answers");
		List<String> lR=new ArrayList<String>();
		for(int i=0;i<lA.size();++i){
			if(!lR.contains(lA.get(i).getClass().getSimpleName()))
			lR.add(lA.get(i).getClass().getSimpleName());
		}
		return lR;
		}

	public void validateQUestion(int id) {
		this.setUpdate("update questions set validation=true where id_quest="+id );
	}

	public List<Question> getQuestionUnvalidate() {
		return this.getQuestions("select * from questions where validation=false");
	}

}
