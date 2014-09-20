package validator;

import model.Adress;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class AdressValidator implements Validator {
	
    
	public boolean supports(Class<?> aClass) {
		return Adress.class.equals(aClass);
	}
 
	public void validate(Object obj, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "number", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "street", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "postalCode", "field.required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "city", "field.required");

	}
	
}
