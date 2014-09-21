package service;

import java.util.Map;

import dao.DAOContact;
import model.Contact;

public class ServiceContact {
	public static Map<Integer, Contact> getAllContacts() {
		
		return DAOContact.getAllContacts();
		
	}
	
	public void addContacts(Contact contact) {
		
		DAOContact.add(contact);
		
	}
	
	public void deleteContacts(Contact contact) {
		
		DAOContact.delete(contact);
		
	}
	
	public void updateContacts(Contact contact) {
		
		DAOContact.update(contact);
		
	}
}
