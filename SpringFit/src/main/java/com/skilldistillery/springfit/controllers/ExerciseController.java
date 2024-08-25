package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.springfit.data.ExerciseDAO;
import com.skilldistillery.springfit.entities.Exercise;

@Controller
public class ExerciseController {

	@Autowired
	private ExerciseDAO exerciseDao;

	// SHOW ALL EXERCISES
	@RequestMapping(path = "exercise.do", method = RequestMethod.GET)
	public String showAllExercises(Model model) {
		List<Exercise> exercises = exerciseDao.showAllExercises(); 
		model.addAttribute("allExercises", exercises);
		return "exercises";
	}

	// SEARCH BY ID
	@RequestMapping(path = "searchById.do", method = RequestMethod.GET)
	public String searchById(@RequestParam("id") int id, Model model) {
		Exercise exercise = exerciseDao.showExerciseById(id);
		if (exercise != null) { 
			model.addAttribute("searchResults", exercise);
		} else { 
			model.addAttribute("error", "No exercise found with ID: " + id);
		}
		return "exercises";
	}

	// SEARCH BY KEYWORD
	@RequestMapping(path = "searchByKeyword.do", method = RequestMethod.GET)
	public String searchByKeyword(@RequestParam("keyword") String keyword, Model model) {
		List<Exercise> exercises = exerciseDao.showExercisesByKeyword(keyword);
		if (exercises.isEmpty()) {
			model.addAttribute("error", "No exercises found with keyword: " + keyword);
		} else {
			model.addAttribute("searchResults", exercises);
		}
		return "exercises";
	}

}
