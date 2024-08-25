package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.springfit.entities.Exercise;

@Controller
public class ExerciseController {

	@Autowired
	private Exercise exerciseDao;
	
	@RequestMapping(path = "exercise.do", method = RequestMethod.GET)
	public String showAllExercises(Model model) {
		List<Exercise> exercises = exerciseDao.
		model.addAttribute("allExercises", exercises);
		return exercises;
	}
	
}
