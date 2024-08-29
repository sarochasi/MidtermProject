
package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.ExerciseDAO;
import com.skilldistillery.springfit.entities.Exercise;

@Controller
public class ExerciseController {

	@Autowired
	private ExerciseDAO exerciseDao;

	// SHOW ALL EXERCISES
	@RequestMapping(path = "testingexercise.do", method = RequestMethod.GET) // Will need to update once we know where we want to display exercises.
	public String showAllExercises(Model model) {
		List<Exercise> exercises = exerciseDao.showAllExercises(); 
		model.addAttribute("allExercises", exercises);
		return "testingexercise";
	}
	//Displays all exercises on workout page
	@RequestMapping(path = "showAllExercices.do", method = RequestMethod.GET) // Will need to update once we know where we want to display exercises.
	public String showAllExercisesForWorkoutPage(Model model) {
		List<Exercise> exercises = exerciseDao.showAllExercises(); 
		model.addAttribute("allExercises", exercises);
		return "workout";
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
		return "testingexercise";
	}
	
    // SEARCH BY EXERCISE TYPE
    @RequestMapping(path = "searchByType.do", method = RequestMethod.GET)
    public String searchByType(@RequestParam("typeId") int id, Model model) {
        List<Exercise> exercises = exerciseDao.showExercisesByType(id);
        if (exercises.isEmpty()) {
            model.addAttribute("error", "No exercises found for this type.");
        } else {
            model.addAttribute("exercises", exercises);
        }
        return "Display"; 
    }
	
	
    @RequestMapping(path = "deleteExercise.do", method = RequestMethod.POST)
    public ModelAndView deleteExercise(@RequestParam("exerciseId") int exerciseId) {
    	ModelAndView mv = new ModelAndView();
    	Exercise exercise = exerciseDao.showExerciseById(exerciseId);
    	
    	if(exercise == null) {
    		mv.addObject("errorMsg", "Exercise not found with ID: " + exerciseId);
    		mv.setViewName("error");
    	}else {
    		boolean deleted = exerciseDao.deleteExercise(exerciseId);
    		if(!deleted) {
    			mv.addObject("errorMsg", "Failed to delete the exercise");
				mv.setViewName("error");
    		}else {
    			mv.setViewName("updateForm");
    		}
    	}
    	
    	return mv;
    }
	
	
	
	
	
	
	
	
	
	

}
