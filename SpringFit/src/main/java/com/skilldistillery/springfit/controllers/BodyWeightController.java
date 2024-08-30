package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.BodyWeightDAO;
import com.skilldistillery.springfit.entities.BodyWeight;
import com.skilldistillery.springfit.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class BodyWeightController {
	
	@Autowired
	private BodyWeightDAO bodyWeightDao;
	
	
	//DELETE COMMENT - initializeWorkout example 
	@RequestMapping(path="submitWeight.do", method = RequestMethod.POST)
	public ModelAndView submitWeight(BodyWeight bodyWeight, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			BodyWeight newBodyWeight = bodyWeightDao.createNewBodyWeight(bodyWeight, loggedInUser.getId());
			mv.addObject("bodyWeight", newBodyWeight);
			
	
			
			mv.setViewName("redirect:profile.do");		
			//mv.setViewName("account");		
			}
		else {
			mv.setViewName("home");
		}
				
		
		return mv;
	}
	
	@RequestMapping(path ="openWeight.do")
	public ModelAndView openBodyWeightData(HttpSession session)
	{
		ModelAndView mv = new ModelAndView();
		
		User user = (User)session.getAttribute("loggedInUser");
		List<BodyWeight> bodyWeightListByUser = bodyWeightDao.showAllBodyWeightsForUser(user);
		mv.addObject("bodyWeightListByUser",bodyWeightListByUser);
		mv.setViewName("displayBodyWeight");
		System.out.println("----------------------------------------");
		System.out.println("----------------------------------------");
		System.out.println("----------------------------------------");
		System.out.println(bodyWeightListByUser.get(0).getDateWeighted());
		System.out.println("----------------------------------------");
		System.out.println("----------------------------------------");
		System.out.println("----------------------------------------");
		System.out.println("----------------------------------------");
		return mv;
		
		
	}

}
