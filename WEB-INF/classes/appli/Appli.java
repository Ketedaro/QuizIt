package appli;

import data.DataBase;
import tools.Hashage;

public class Appli {

	public static void main(String[] args) {
		createUser("Test", "Test");
	}

	public void existUser() {
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

	public static void createUser(String pseudo, String password) {
		String formPseudo = pseudo;
		String formPwd = Hashage.sha256(password);
		String formPwd2 = Hashage.sha256(password);
		String formMail = "hey@hey.fr";
		String message = "ok";

		if (DataBase.getDataBase().existLogin(formPseudo)) {
			message = "Ce nom d'utilisateur est déjà pris.";

		} else if (!formPwd.equals(formPwd2)) {
			System.out.println(formPwd + " " + formPwd2);
			message = "Les deux mots de passes sont différents.";
		} else {
			message = "Vous êtes inscrit et vous pouvez maintenant vous connecter.";
			DataBase.getDataBase().createNewUser(formPseudo, formPwd, formMail);
		}
		System.out.println(message);
	}
}
