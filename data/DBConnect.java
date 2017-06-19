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
import quizIT.Factory;
import quizIT.Question;
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
	
	//Vérifié que le login n'est pas déjà pris 
	public boolean existLogin(String login) {
		Statement request;
		ResultSet res;
		boolean tmp = false;
		try {
			String sql = "SELECT * FROM USER WHERE id_user = '" + login + "'";
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
			String sql = "SELECT * FROM USER WHERE id_user = '" + loginConnect + "' and password = '" + passConnect
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
		String sql = "select * from Question where typeQuest='" + type + "'";
		return this.getQuestions(sql);
	}
	
	public Question getRandQuestion(String type){
		String sql="select * from Question where typeQuest='"+type+"' order by rand() limit 1";
		return this.getQuestions(sql).get(0);
	}

	// Récupérer une question avec son id
	public Question getQuestion(int id) {
		return this.getQuestions("select * from Question where id_quest="+id).get(0);
	}

	// Récupérer un user avec son id
	public User getUser(int id) {
		return this.getUsers("select * from user where id_user=" + id).get(0);
	}

	public List<Question> getQuestion(String type,String topic){
		String sql="select * from Question where typequest='"+type+"' and topicQuestion='"+topic+"'";
		return this.getQuestions(sql);
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
				id = resultSet.getInt("id");
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
		String answerEnti = null, typeAns = null;
		boolean correct = false;
		List<Answer> lAnswer = new ArrayList<Answer>();
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				answerEnti = resultSet.getString("answer");
				typeAns = resultSet.getString("type");
				correct = resultSet.getBoolean("correct");
				lAnswer.add(Factory.getAnswer(answerEnti, typeAns, correct));
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
				type = resultSet.getString("typeQuestion");
				topic = resultSet.getString("topicQuestion");
				entitled = resultSet.getString("questContent");
				mp3Link = resultSet.getString("mp3_link");
				submitter = resultSet.getInt("id_Submitter");
				valid = resultSet.getBoolean("validation");
				listAnw = this.getAnswers("select * from Anwser where id_quest=" + id);

				lQuestion.add(Factory.getQuestion(id, type, topic, entitled, mp3Link, submitter, valid, listAnw));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return lQuestion;
	}

}


