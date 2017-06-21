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
import quizIT.MCQ;
import quizIT.Question;
import quizIT.SimpleAnswer;
import quizIT.Topic;
import quizIT.User;

public class DBConnect {

	private Connection connect;

	public DBConnect() {
		File file = new File("Z:\\git\\config.txt");
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

	// Vérifié que le login n'est pas déjà pris
	public boolean existLogin(String login) {
		Statement request;
		ResultSet res;
		boolean tmp = false;
		try {
			String sql = "SELECT * FROM USERS WHERE login = '" + login + "'";
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
			String sql = "SELECT * FROM USERS WHERE login = '" + loginConnect + "' and password = '" + passConnect
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
		return this
				.getQuestions("select * from questions where typeQuest='" + type + "' and topicQuest='" + topic + "'");
	}

	public void playGame(User user,int scoreGame) {
		int score=user.getScore()+scoreGame;
		String sql = "Update users set score=" + score + " where id_user=" + user.getId();
		this.setUpdate(sql);
	}

	public List<Topic> getAllTopic(){
		return this.getTopics("select * from topic");
	}
	
	public void addQuestion(Question q) throws Exception {
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
	}

	public List<User> getTopUser() {
		return this.getUsers("SELECT * FROM users ORDER BY score DESC LIMIT 20");
	}
	
	public void createUser(String formPseudo, String formPwd, String formMail) {
		this.setUpdate("Insert into users(login,password,email,isAdmin) Values('" + formPseudo + "','" + formPwd + "','"
				+ formMail + "' false )");
	}

	public User getUser(String formPseudo) {
		return this.getUsers("select * from users where login='" + formPseudo + "'").get(0);
	}

	public Question getRandQuestion(String type, String topic) {
		return this.getQuestions("select * from questions where typeQuest='" + type + "' and topicQuest='" + topic
				+ "' order by rand() limit 1").get(0);
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
		String answerEnti = null, typeAns = null;
		boolean correct = false;
		List<Answer> lAnswer = new ArrayList<Answer>();
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				id_answer = resultSet.getInt("id_answer");
				typeAns = resultSet.getString("typeAnswer");
				answerEnti = resultSet.getString("answerContent");
				correct = resultSet.getBoolean("isTrue");
				try {
					lAnswer.add(Factory.getAnswer(id_answer, answerEnti, typeAns, correct));
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

	private List<Topic> getTopics(String sql){
		Statement request;
		ResultSet resultSet;
		List<Topic> lTopic=new ArrayList<Topic>();
		String name,url,desc;
		
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while(resultSet.next()){
				name=resultSet.getString("topicName");
				url=resultSet.getString("pictureURL");
				desc=resultSet.getString("descriptionTopic");
				lTopic.add(Factory.getTopic(name,url,desc));
				
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

	

}
