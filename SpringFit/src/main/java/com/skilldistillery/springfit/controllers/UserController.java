package com.skilldistillery.springfit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.springfit.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	// HOME	- (could inject session also)
	@RequestMapping(path = { "/", "home.do" } )
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDao.authenticateUser("admin", "test")); // ** Temporary **
		
		return "home";
	}
	
	
	

}



