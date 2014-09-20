package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Contact {

	private String name;
	private String surname;
	private String email;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthDate;
	
	boolean deleted = false;
	

	public Contact(String name, String surname, String email, Date birthDate){
		this.name = name;
		this.surname = surname;
		this.email =email;
		this.birthDate = birthDate;
	}
	
	public Contact(){
		
	}
	
	public void delete(){
		deleted = true;
	}
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}
	
	public String getEmail(){
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
			
}
