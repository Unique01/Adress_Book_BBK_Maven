package service;

import java.util.Map;

import dao.DAOAdress;
import model.Adress;


public class ServiceAdress {

	public static Map<Integer, Adress> getAllAdresses() {
		
		return DAOAdress.getAllAdresses();
		
	}
	
	public static void addAdress(Adress adress) {
		
		DAOAdress.add(adress);
		
	}
	
	public static void deleteAdress(Adress adress) {
		
		DAOAdress.delete(adress);
		
	}
	
	public static void updateAdress(Adress adress) {
		
		DAOAdress.update(adress);
		
	}
	
}
