package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import model.Contact;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;

import service.ServiceContact;


@Controller
@RequestMapping("/AddContact")
public class AddContactController {
	
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
	
	@RequestMapping(method = RequestMethod.GET)
	public String initForm(ModelMap model) {
		model.addAttribute("contact", new Contact());
		return "AddContact";	
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submitForm(Model model, @Validated Contact contact, BindingResult result) {
	    model.addAttribute("contact", contact);
	    String returnVal = "Home";
	    if(result.hasErrors()) {
	        returnVal = "AddContact";
	    } else {
	    	ServiceContact.addContacts(contact);
	        model.addAttribute("contact", contact);
	    }      
	    return returnVal;
	}
}
