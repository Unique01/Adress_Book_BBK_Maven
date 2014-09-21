package model;

public class Adress {
	
	private int id;
	private String number;
	private String street;
	private String postalCode;
	private String city;
	
	public Adress(int id, String number, String street, String postalCode, String city){
		this.id=id;
		this.number = number;
		this.street = street;
		this.postalCode = postalCode;
		this.city = city;
	}
	
	public Adress(){
		
	}	
	
	@Override
	public String toString() {
		return number + " " + street + ", " + postalCode + ", " + city;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}


}
