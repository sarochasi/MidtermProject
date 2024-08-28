package com.skilldistillery.springfit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.springfit.data.NutritionDAO;
import com.skilldistillery.springfit.entities.Nutrition;
import com.skilldistillery.springfit.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class NutritionController {
	
	@Autowired
	private NutritionDAO nutritionDao;
	
	// ADD - Nutrition (to a loggedInUser)
    @RequestMapping(path = "addNutrition.do", method = RequestMethod.POST)
    public String addNutrition(@ModelAttribute("nutrition") Nutrition nutrition, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            nutrition.setUser(loggedInUser);
            nutritionDao.addNutrition(nutrition);
            model.addAttribute("nutritionAdded", true);
            
            return "redirect:profile.do"; 
        } else {
            model.addAttribute("errorMessage", "You must be logged in to add nutrition information.");
            
            return "login";
        }
    }
    

}
