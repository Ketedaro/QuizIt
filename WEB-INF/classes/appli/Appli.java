package appli;

import data.DataBase;
import tools.Hashage;

public class Appli {

	public static void main(String[] args) {
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

}
