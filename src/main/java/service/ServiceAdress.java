package service;

import java.util.Map;

import dao.DAOAdress;
import model.Adress;


public class ServiceAdress {

	public static Map<Integer, Adress> getAllAdresses() {
		
		return DAOAdress.getAllAdresses();
		
	}
	
	public void addAdress(Adress adress) {
		
		DAOAdress.add(adress);
		
	}
	
	public void deleteAdress(Adress adress) {
		
		DAOAdress.delete(adress);
		
	}
	
	public void updateAdress(Adress adress) {
		
		DAOAdress.update(adress);
		
	}
	
}
