package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.ExerciseDAO;
import com.skilldistillery.springfit.data.WorkoutDAO;
import com.skilldistillery.springfit.entities.Exercise;

@Controller
public class WorkoutController {
	
	private WorkoutDAO workoutDAO;
//	@Autowired
//	private ExerciseDAO exerciseDao;	
	
	
	@RequestMapping(path = "GetWorkoutPagealternate.do")
	public ModelAndView displayWorkoutPage() {	
		ModelAndView mv = new ModelAndView();
		
		
		
		mv.setViewName("workout");
		return mv;
	}

}
