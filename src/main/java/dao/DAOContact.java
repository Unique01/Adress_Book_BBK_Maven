package dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import model.Contact;
import model.Adress;;


public class DAOContact {

	private static Map<Integer, Contact> bdd = new HashMap<Integer, Contact>();
	private static int i = 4;
	private static int temp = 0;
	
	static {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd/MM/yyyy");

		try {			 
			List<Adress> adressList = new ArrayList<Adress>();
			adressList.add(new Adress(0, "12", "Général de Gaulle", "92290", "Châtenay-Malabry"));
			adressList.add(new Adress(0, "15", "Rue de la République", "75007", "Paris"));
			adressList.add(new Adress(0, "30", "Rue des Fleures", "75005", "Paris"));

			bdd.put(1, new Contact(1,"Adnane","Koumira","ak@gmail.fr", simpleDateFormat.parse("25/12/1992"), adressList));		
			bdd.put(2, new Contact(2,"Vincent","Baulin","vb@gmail.fr", simpleDateFormat.parse("03/07/1990"), adressList));
			bdd.put(3, new Contact(3,"Julien","Baron","jb@gmail.fr", simpleDateFormat.parse("11/06/1992"), adressList));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
	
	public static Map<Integer, Contact> getAllContacts() {
		Map<Integer, Contact> map = new HashMap<Integer, Contact>();

		for(int j=1; j<i; j++){
			Contact cont = bdd.get(j);
			
			if(!cont.isDeleted()){
				map.put(j, cont);
			}
		}

		return map;
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

	public static Contact getContactById(int id) {
		
		return bdd.get(id);
		
	}

}
