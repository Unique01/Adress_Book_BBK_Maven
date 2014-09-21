package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import model.Contact;


public class DAOContact {

	private static Map<Integer, Contact> bdd = new HashMap<Integer, Contact>();
	private static int i = 4;
	private static int temp = 0;
	
	static {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		try {			 
			bdd.put(1, new Contact(1,"Adnane","Koumira","ak@gmail.fr", simpleDateFormat.parse("25/12/1992")));
			bdd.put(2, new Contact(2,"Vincent","Baulin","vb@gmail.fr", simpleDateFormat.parse("03/07/1990")));
			bdd.put(3, new Contact(3,"Julien","Baron","jb@gmail.fr", simpleDateFormat.parse("11/06/1992")));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public static Map<Integer, Contact> getAllContacts() {
		return bdd;
	}
	
	public static void add(Contact contact) {
		contact.setId(i);
		bdd.put(i, contact);
		i++;
	}

	public static void delete(Contact contact) {
		bdd.get(contact.getId()).delete();				//met a true la variable de supression de l'objet contact		
	}

	public static void update(Contact contact) {
		temp = contact.getId();
		bdd.remove(temp);
		bdd.put(temp, contact);	
	}

}
