package dao;

import java.util.HashMap;
import java.util.Map;

import model.Adress;

public class DAOAdress {
	private static Map<Integer, Adress> bdd = new HashMap<Integer, Adress>();
	private static int j=4;
	private static int temp;

	
	static {
		
		bdd.put(1, new Adress(1, "5", "Rue du général De Gaule","75008", "Paris"));
		bdd.put(2, new Adress(2, "11", "Rue de Londres","75009", "Paris"));
		bdd.put(3, new Adress(3, "86", "Rue du Faubourg Saint-Honoré","75008", "Paris"));

	}
	
	public static  Map<Integer, Adress> getAllAdresses() {
		return bdd;
	}

	public static void add(Adress adress) {
		adress.setId(j);
		bdd.put(j, adress);
		j++;
	}

	public static void delete(Adress adress) {
		bdd.remove(adress.getId());		
	}

	public static void update(Adress adress) {
		temp = adress.getId();
		bdd.remove(temp);
		bdd.put(temp, adress);			
	}
}
