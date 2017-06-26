package appli;

import data.DataBase;
import tools.Hashage;

public class Appli {

	public static void main(String[] args) {
		System.out.println(Hashage.sha256("admin"));
		System.out.println(Hashage.sha256("lucas"));
		System.out.println(Hashage.sha256("victor"));
		System.out.println(Hashage.sha256("andy"));
		System.out.println(Hashage.sha256("kilian"));
		
	}

}
