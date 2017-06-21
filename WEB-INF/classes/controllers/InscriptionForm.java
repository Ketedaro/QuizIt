package controllers;

import javax.servlet.http.HttpServletRequest;

import data.DataBase;
import tools.Hashage;

public class InscriptionForm {
	private String message;
	private boolean correct;

	public void valider(HttpServletRequest request) {
		String formPseudo = request.getParameter("pseudo");
		String formPwd = Hashage.sha256(request.getParameter("password1"));
		String formPwd2 = Hashage.sha256(request.getParameter("password2"));
		String formMail = request.getParameter("email");

		this.correct = true;

		if (DataBase.getDataBase().existLogin(formPseudo)) {
			this.message = "Ce nom d'utilisateur est déjà pris.";
			this.correct = false;
		} else if (!formPwd.equals(formPwd2)) {
			System.out.println(formPwd + " " + formPwd2);
			this.message = "Les deux mots de passes sont différents.";
			this.correct = false;
		} else {
			this.message = "Vous êtes inscrit et vous pouvez maintenant vous connecter.";
			// Changer le password
			DataBase.getDataBase().createNewUser(formPseudo, formPwd, formMail);
		}
	}

	public String getMessage() {
		return this.message;
	}

	public boolean isCorrect() {
		return correct;
	}
}
