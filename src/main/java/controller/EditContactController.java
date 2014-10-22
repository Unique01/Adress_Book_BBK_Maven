package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import model.Contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ServiceContact;

@Controller
public class EditContactController {
	
	
	@Autowired
	@Qualifier("ContactValidator")
	private Validator validator;
	
    @InitBinder
	private void initBinder(WebDataBinder binder) {
    	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    	dateFormat.setLenient(false);
    	binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    	
	    binder.setValidator(validator);
	}
	
    
	@RequestMapping(value = "/EditContact", method = RequestMethod.GET)
	public String initForm(@RequestParam("id") int id, ModelMap model) {
		Contact myContact = ServiceContact.getContactById(id);
		
		model.addAttribute("contact", myContact);
		return "EditContact";	
	}

	
	@RequestMapping(value = "/EditContact", method = RequestMethod.POST)
	public String submitForm(Model model, @Validated Contact contact, BindingResult result) {
	    model.addAttribute("contact", contact);
	    String returnVal = "Home";
	    if(result.hasErrors()) {
	        returnVal = "EditContact";
	    } else {
	    	ServiceContact.updateContacts(contact);
	        model.addAttribute("contact", contact);
	        Boolean contactUpdatedAlert = Boolean.TRUE;
	        model.addAttribute("contactUpdatedAlert", contactUpdatedAlert);	 
	    }      
	    return returnVal;
	}
	
	@RequestMapping(value = "/DeleteContact", method = RequestMethod.GET)
	public String deleteContact(@RequestParam("id") int id, ModelMap model) {
		Contact myContact = ServiceContact.getContactById(id);
		
		if(myContact!=null){
			ServiceContact.deleteContacts(myContact);

		}
		
		model.addAttribute("contact", myContact);
		return "Home";	
	}
	
	
}
