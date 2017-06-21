package controllers;

import javax.servlet.http.HttpServletRequest;

import data.DataBase;

public class InscriptionForm {
	private String message;
	private boolean correct;
	
	public void valider(HttpServletRequest request){
		String formPseudo = request.getParameter("login");
		String formPwd = request.getParameter("password");
		String formPwd2 = request.getParameter("password2");
		String formMail = request.getParameter("mail");
		
		
		this.correct = true;
		
		if (DataBase.getDataBase().existLogin(formPseudo)) {
			this.message = "Ce nom d'utilisateur est d�j� pris.";
			this.correct = false;
		}else if (!formPwd.equals(formPwd2)) {
			System.out.println(formPwd+" "+formPwd2);
			this.message = "Les deux mots de passes sont diff�rents.";
			this.correct = false;
		} else {
			this.message = "Vous �tes inscrit et vous pouvez maintenant vous connecter.";
			//Changer le password
		DataBase.getDataBase().createNewUser(formPseudo,formPwd, formMail);
		}
	}
	
	public String getMessage() {
		return this.message;
	}

	public boolean isCorrect() {
		return correct;
	}
	}
