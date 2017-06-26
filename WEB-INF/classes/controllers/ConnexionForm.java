package controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import data.DataBase;
import quizIT.User;
import tools.Hashage;

public class ConnexionForm {
	private String message;
	private boolean correct;
	
	public void valider(HttpServletRequest request){
		String formPseudo = request.getParameter("pseudo");
		String formMdp = Hashage.sha256(request.getParameter("password"));
		
		
		
		this.correct = false;
		
		try {
			if (DataBase.getDataBase().existUser(formPseudo, formMdp)) {
				this.correct = true;
			} else {
				this.message = "Mot de passe incorrect.";
			}
		} catch (Exception e) {
			this.message = "Cet utilisateur n'existe pas.";
			this.correct = false;
		}
	}
	
	public HttpServletRequest creerSession(HttpServletRequest request) throws Exception{
		if (!this.correct) {
			throw new Exception("Le formulaire de connexion n'a pas été validé ou est incorrect.");
		}
		
		String formPseudo = request.getParameter("pseudo");
		User user = DataBase.getDataBase().getUser(formPseudo);
		
		/* Cr�ation ou r�cup�ration de la session */
		HttpSession session = request.getSession();
		
		session.setAttribute("utilisateur", user);
		
		return request;
	}
	
	public String getMessage() {
		return this.message;
	}

	public boolean isCorrect() {
		return correct;
	}
}
