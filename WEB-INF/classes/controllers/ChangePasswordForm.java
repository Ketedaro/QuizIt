package controllers;

import javax.servlet.http.HttpServletRequest;
import data.DataBase;
import tools.Hashage;

public class ChangePasswordForm {
	
	private String message;
	private boolean correct;
	
	public void valider(HttpServletRequest request){
		String pseudo = request.getParameter("pseudo");
		String oldMdp =  Hashage.sha256(request.getParameter("oldpassword"));
		String formMdp = Hashage.sha256(request.getParameter("password1"));
		String formMdp2 = Hashage.sha256(request.getParameter("password2"));
		
		this.correct = false;
		
		if (DataBase.getDataBase().existUser(pseudo, oldMdp)) {
			this.correct = true;
			if (!formMdp.equals(formMdp2)) {
				this.message = "Les deux mots de passes sont différents.";
				this.correct = false;
			} else {
				DataBase.getDataBase().changePassword(pseudo, formMdp);
				this.message = "Mot de passe modifié.";
				this.correct = true;
			}
		} else {
			this.message = "Mot de passe incorrect.";
		}
	}
	

	
	public String getMessage() {
		return this.message;
	}

	public boolean isCorrect() {
		return correct;
	}

}
