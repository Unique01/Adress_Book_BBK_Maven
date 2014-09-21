package controller;


import model.Adress;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

import service.ServiceAdress;

@Controller
@RequestMapping("/AddAdress")
public class AddAdressController {
	
	@Autowired
	@Qualifier("AdressValidator")
	private Validator validator;
	
    @InitBinder
	private void initBinder(WebDataBinder binder) {
    	
	    binder.setValidator(validator);
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String initForm(ModelMap model) {
		model.addAttribute("adress", new Adress());
		return "AddAdress";
		
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String submitForm(Model model, @Validated Adress adress, BindingResult result) {
	    model.addAttribute("adress", adress);
	    String returnVal = "Home";
	    if(result.hasErrors()) {
	        returnVal = "AddAdress";
	    } else {
	    	ServiceAdress.addAdress(adress);
	        model.addAttribute("adress", adress);
	    }      
	    return returnVal;
	}
}
