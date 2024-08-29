package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.NutritionDAO;
import com.skilldistillery.springfit.data.UserDAO;
import com.skilldistillery.springfit.entities.Nutrition;
import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutExercise;

import jakarta.servlet.http.HttpSession;

@Controller
public class NutritionController {
	
	@Autowired
	private NutritionDAO nutritionDao;
	
	@Autowired
	private UserDAO userDao;
	
	// ADD - Nutrition (to a loggedInUser)
    @RequestMapping(path = "addNutrition.do", method = RequestMethod.POST)
    public String addNutrition(Nutrition nutrition, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            nutrition.setUser(loggedInUser);
            // System.out.println(nutrition);
            nutritionDao.addNutrition(nutrition);
            model.addAttribute("nutritionAdded", true); 
            
            return "redirect:profile.do"; 
        } else {
            model.addAttribute("errorMessage", "You must be logged in to add nutrition information.");
            
            return "login";
        }
    }
    
    // VIEW 
    @RequestMapping(path = "showAllNutrition.do", method = RequestMethod.POST)
    public ModelAndView showAllNutrition(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User loggedInUser = (User) session.getAttribute("loggedInUser");

        if (loggedInUser != null) {
            List<Nutrition> allNutrition = nutritionDao.findAllByUser(loggedInUser.getId());
            mv.addObject("allNutrition", allNutrition);
            mv.setViewName("displayNutrition");
        } else {
            mv.addObject("errorMessage", "You must be logged in to view nutrition information.");
            mv.setViewName("login");
        }

        return mv;
    }
    
	

}
