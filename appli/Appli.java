package appli;

import data.DataBase;
import quizIT.Factory;
import quizIT.Game;
import tools.Hashage;

public class Appli {

	public static void main(String[] args) {
		testNewGame();
	}

	public static void testCreateAccount() {
		String formPseudo = "Test";
		String formPwd = Hashage.sha256("Test");
		String formPwd2 = Hashage.sha256("Test");
		String formMail = "hey@hey.fr";
		String message;
		boolean correct;
		correct = true;

		if (DataBase.getDataBase().existLogin(formPseudo)) {
			message = "Ce nom d'utilisateur est déjà pris.";
			correct = false;
		} else if (!formPwd.equals(formPwd2)) {
			System.out.println(formPwd + " " + formPwd2);
			message = "Les deux mots de passes sont différents.";
			correct = false;
		} else {
			message = "Vous êtes inscrit et vous pouvez maintenant vous connecter.";
			// Changer le password
			DataBase.getDataBase().createNewUser(formPseudo, formPwd, formMail);
		}

		System.out.println(message + " " + correct);
	}

	public static void testConnexion() {
		String formPseudo = "Test";
		String formMdp = Hashage.sha256("Test");

		String message = "";
		boolean correct = false;

		try {
			if (DataBase.getDataBase().existUser(formPseudo, formMdp)) {
				correct = true;
			} else {
				message = "Mot de passe incorrect.";
			}
		} catch (Exception e) {
			message = "Cet utilisateur n'existe pas.";
			correct = false;
		}
		System.out.println(message + " " + correct);
	}

	public static void testNewGame() {
		String type = "MCQ";
		String topic = "Culture du monde";
		int nbQ = 4;
		Class<?> classe = null;
		try {
			classe = Class.forName("quizIT." + type);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		Game game = Factory.getGame(nbQ, classe, topic);
		game.play(1);
		System.out.println(game.getCpt());
		game.play(1);
		System.out.println(game.getCpt());
		game.play(1);
		System.out.println(game.getCpt());
		game.play(1);
		System.out.println(game.getCpt());
		game.play(1);
		System.out.println(game.getCpt());
	}

}
