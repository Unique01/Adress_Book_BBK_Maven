package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import model.Contact;
import model.ItemJsonObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import service.ServiceContact;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("/")
public class HomeController {

	@RequestMapping(method = RequestMethod.GET)
	public String initPage(ModelMap model) {
        Boolean contactAddedAlert = Boolean.FALSE;
        model.addAttribute("contactAddedAlert", contactAddedAlert);
		return "Home";

	}
	
	 @RequestMapping(value = "/springPaginationDataTables.web", method = RequestMethod.GET, produces = "application/json")
	 public @ResponseBody String springPaginationDataTables() throws IOException {
	 		 
		ItemJsonObject contactJsonObject = new ItemJsonObject();
		List<Contact> list = new ArrayList<Contact>(ServiceContact.getAllContacts().values());
		contactJsonObject.setiTotalDisplayRecords(ServiceContact.getAllContacts().size());
		contactJsonObject.setiTotalRecords(ServiceContact.getAllContacts().size());
		contactJsonObject.setAaData(list);
		    
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		String json2 = gson.toJson(contactJsonObject);

		return json2;
	 }
}
