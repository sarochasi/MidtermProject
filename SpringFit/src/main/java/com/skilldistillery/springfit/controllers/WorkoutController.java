package com.skilldistillery.springfit.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.WorkoutDAO;

@Controller
public class WorkoutController {
	private WorkoutDAO workoutDAO;
	
	@RequestMapping(path = "GetWorkoutPage.do")
	public ModelAndView displayWorkoutPage() {	
		ModelAndView mv = new ModelAndView();
		System.out.println("Workout CONTRoler called?????????????????????????");
		mv.setViewName("workout");
		return mv;
	}

}
