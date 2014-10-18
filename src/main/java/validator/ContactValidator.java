package validator;


//import model.Adress;
import model.Contact;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ContactValidator implements Validator {
	
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
    //private static final String NUMBER_PATTERN = "^\\d+$";

    
	public boolean supports(Class<?> aClass) {
		return Contact.class.equals(aClass);
	}
 
	public void validate(Object obj, Errors errors) {
		Contact contact = (Contact) obj;
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "surname", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "field.required");
		if(!contact.getEmail().matches(EMAIL_PATTERN)) {
			errors.rejectValue("email","valid.email");
		}
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "birthDate", "field.required");
		
		/*ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adressList.number", "field.required");
		for (int i = 0; i < contact.getAdressList().size(); i++) {
			Adress ad = contact.getAdressList().get(i);

	    	if(!ad.getNumber().matches(NUMBER_PATTERN)) {
	    		errors.rejectValue("adressList[" + i + "].number","valid.number");
	    	}
	    }
		 
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adressList.street", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adressList.postalCode", "field.required");
		for (int i = 0; i < contact.getAdressList().size(); i++) {
			Adress ad = contact.getAdressList().get(i);

			if(!ad.getPostalCode().matches(NUMBER_PATTERN)) {
				errors.rejectValue("adressList[" + i + "].postalCode","valid.postalCode");
			}
	    }
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "adressList.city", "field.required");*/

	
	}
	
}
