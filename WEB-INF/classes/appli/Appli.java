package appli;

import data.DataBase;
import tools.Hashage;

public class Appli {

	public static void main(String[] args) {
		String pseudo = "Ketedaro";
		String oldMdp = "hello";
		String formMdp = "rr";
		String formMdp2 = "rr";
		String message = "";


		if (DataBase.getDataBase().existUser(pseudo, oldMdp)) {

			if (!formMdp.equals(formMdp2)) {
				message = "Les deux mots de passes sont différents.";

			} else {
				DataBase.getDataBase().changePassword(pseudo, formMdp);
				message = "Mot de passe modifié.";
			}
		} else {
			message = "Mot de passe incorrect.";
		}
		System.out.println(message);
	}

}
