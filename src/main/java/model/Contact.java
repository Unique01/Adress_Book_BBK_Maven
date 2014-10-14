package model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Contact {

	private int id;
	private String name;
	private String surname;
	private String email;
	
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date birthDate;
	
	boolean deleted = false;
	

	public Contact(int id, String name, String surname, String email, Date birthDate){
		this.id=id;
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
	
	public int getId(){
		return id;
	}

	public void setId(int id) {
		this.id = id;
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
	
	public boolean isDeleted(){
		return deleted;
	}
		
}
