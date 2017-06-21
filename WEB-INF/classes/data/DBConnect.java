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
import java.util.HashMap;
import java.util.List;
import quizIT.Question;

public class DBConnect {
	private Connection connect;

	public DBConnect() {
		File file = new File("Z:\\git\\config.txt");
		try {
			FileReader fis = new FileReader(file);
			@SuppressWarnings("resource")
			BufferedReader buff = new BufferedReader(fis);
			try {
				String className = buff.readLintomcat debian create new webappe();
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
			String sql = "SELECT * FROM USER WHERE id_user = '" + loginConnect + "' and password = '" + passConnect + "'";
			request = connect.createStatement();
			res = request.executeQuery(sql);
			tmp = res.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tmp;

	}

	public int getSizeQuestion(String type) {
		String sql = "select * from Question where typeQuest='"+type+"'";
		Statement request;
		ResultSet resultSet;
		int cpt = 0;
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				++cpt;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cpt;
	}

	public HashMap<String, String> getQuestion(int id, String type) {
		HashMap<String, String> hm = new HashMap<String, String>();
		Statement request;
		ResultSet resultSet;
		String sql = "select * from Question where id_quest= " + id+" and typeQuest='"+type+"'";
		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				 hm.put("id_quest",String.valueOf(resultSet.getInt("id_quest")));
				 hm.put("typeQuestion",resultSet.getString("typeQuestion"));
				 hm.put("topicQuestion",resultSet.getString("topicQuestion"));
				 hm.put("mp3_link",resultSet.getString("mp3_link"));
				 hm.put("id_Submitter",String.valueOf(resultSet.getInt("id_Submitter")));
				 hm.put("validation",String.valueOf(resultSet.getBoolean("validation")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return hm;
	}

	private HashMap<String, List<String>> getUsers(String sql) {
		HashMap<String, List<String>> hm = new HashMap<String, List<String>>();
		Statement request;
		ResultSet resultSet;
		List<String> listIdUser = new ArrayList<String>();
		List<String> listLogin = new ArrayList<String>();
		List<String> listPassword = new ArrayList<String>();
		List<String> listEmail = new ArrayList<String>();
		List<String> listScore = new ArrayList<String>();
		List<String> listIsAdmin = new ArrayList<String>();

		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				listIdUser.add(String.valueOf(resultSet.getInt("id_user")));
				listLogin.add(resultSet.getString("login"));
				listPassword.add(resultSet.getString("password"));
				listEmail.add(resultSet.getString("email"));
				listScore.add(String.valueOf(resultSet.getInt("score")));
				listIsAdmin.add(String.valueOf(resultSet.getBoolean("isAdmin")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		hm.put("id_user", listIdUser);
		hm.put("login", listLogin);
		hm.put("password", listPassword);
		hm.put("email", listEmail);
		hm.put("score", listScore);
		hm.put("isAdmin", listIsAdmin);

		return hm;
	}

	private HashMap<String, List<String>> getQuestions(String sql) {
		HashMap<String, List<String>> hm = new HashMap<String, List<String>>();
		Statement request;
		ResultSet resultSet;
		List<String> listIdQuest = new ArrayList<String>();
		List<String> listTypeQuest = new ArrayList<String>();
		List<String> listTopicQuestion = new ArrayList<String>();
		List<String> listMP3Link = new ArrayList<String>();
		List<String> listIdSubmitter = new ArrayList<String>();
		List<String> listValidation = new ArrayList<String>();

		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				listIdQuest.add(String.valueOf(resultSet.getInt("id_quest")));
				listTypeQuest.add(resultSet.getString("typeQuest"));
				listTopicQuestion.add(resultSet.getString("topicQuestion"));
				listMP3Link.add(resultSet.getString("mp3_link"));
				listIdSubmitter.add(String.valueOf(resultSet.getInt("id_submitter")));
				listValidation.add(String.valueOf(resultSet.getBoolean("validation")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		hm.put("id_quest", listIdQuest);
		hm.put("typeQuest", listTypeQuest);
		hm.put("topicQuestion", listTopicQuestion);
		hm.put("mp3_link", listMP3Link);
		hm.put("id_submitter", listIdSubmitter);
		hm.put("validation", listValidation);

		return hm;
	}

	private HashMap<String, List<String>> getAnswers(String sql) {
		HashMap<String, List<String>> hm = new HashMap<String, List<String>>();
		Statement request;
		ResultSet resultSet;
		List<String> listIdUser = new ArrayList<String>();
		List<String> listLogin = new ArrayList<String>();
		List<String> listPassword = new ArrayList<String>();
		List<String> listEmail = new ArrayList<String>();
		List<String> listScore = new ArrayList<String>();
		List<String> listIsAdmin = new ArrayList<String>();

		try {
			request = connect.createStatement();
			resultSet = request.executeQuery(sql);
			while (resultSet.next()) {
				listIdUser.add(String.valueOf(resultSet.getInt("id_user")));
				listLogin.add(resultSet.getString("login"));
				listPassword.add(resultSet.getString("password"));
				listEmail.add(resultSet.getString("email"));
				listScore.add(String.valueOf(resultSet.getInt("score")));
				listIsAdmin.add(String.valueOf(resultSet.getBoolean("isAdmin")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		hm.put("id_user", listIdUser);
		hm.put("login", listLogin);
		hm.put("password", listPassword);
		hm.put("email", listEmail);
		hm.put("score", listScore);
		hm.put("isAdmin", listIsAdmin);

		return hm;
	}

}
