package service;

import java.util.Map;

import dao.DAOContact;
import model.Contact;

public class ServiceContact {
	public static Map<Integer, Contact> getAllContacts() {
		
		return DAOContact.getAllContacts();
		
	}
	
	public static void addContacts(Contact contact) {
		
		DAOContact.add(contact);
		
	}
	
	public static  void deleteContacts(Contact contact) {
		
		DAOContact.delete(contact);
		
	}
	
	public static void updateContacts(Contact contact) {
		
		DAOContact.update(contact);
		
	}
}
