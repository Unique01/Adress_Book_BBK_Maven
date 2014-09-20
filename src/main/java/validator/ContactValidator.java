package validator;


import model.Contact;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ContactValidator implements Validator {
	
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    
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

	
	}
	
}
