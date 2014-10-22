package controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import model.Contact;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import service.ServiceContact;

@Controller
public class SeeContactController {	
	
    @InitBinder
	private void initBinder(WebDataBinder binder) {
    	SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    	dateFormat.setLenient(false);
    	binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	  
	@RequestMapping(value = "/SeeContact", method = RequestMethod.GET)
	public String initForm(@RequestParam("id") int id, ModelMap model) {
		Contact myContact = ServiceContact.getContactById(id);
		
		model.addAttribute("contact", myContact);
		return "SeeContact";	
	}
		
}
