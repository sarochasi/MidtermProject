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
import com.skilldistillery.springfit.data.WorkoutDAO;
import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutExercise;

import jakarta.servlet.http.HttpSession;

@Controller
public class WorkoutController {

	@Autowired
	private WorkoutDAO workoutDao;
	@Autowired
	private ExerciseDAO exerciseDao;

	// Methods
	// * navigateToCreateWorkoutJSP
	// * addExerciseToWorkout
	// * save workout from session to database

//	//I think this method can be deleted, exercise
//	@RequestMapping(path = "GetWorkoutPagealternate.do")
//	public ModelAndView displayWorkoutPage() {	
//		ModelAndView mv = new ModelAndView();	
//		mv.setViewName("workout");
//		return mv;
//	}

	// Takes user data for Workout (name desicription, etc), does not take exercises
	// yet.
	@RequestMapping(path = "InitializeWorkout.do")
	public ModelAndView initializeWorkout(Workout workout, User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			mv.addObject("workout", workoutDao.createNewWorkoutInitialize(workout, loggedInUser.getId()));
		}
		mv.setViewName("createWorkout");
		
		return mv;
	}

	@RequestMapping(path = "GetWorkoutPage.do")
	public ModelAndView getExerciseType() {
		ModelAndView mv = new ModelAndView();

		mv.addObject("exerciseTypes", exerciseDao.findAllExerciseTypes());

		mv.setViewName("createWorkout");

		return mv;
	}

	// Opens createWorkout page when user selected from account page
	@RequestMapping(path = "GetWorkoutPage.do", params = "exerciseType")
	public ModelAndView displayWorkoutPage(@RequestParam("exerciseType") int typeId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			List<Exercise> exercises = exerciseDao.showExercisesByType(typeId);

			mv.addObject("exercises", exercises);
			mv.setViewName("createWorkout");
		} else {
			mv.setViewName("home");

		}

		return mv;
	}

	@RequestMapping(path = "addExercise.do", method = RequestMethod.POST)
	public String addExerciseToWorkout(HttpSession session, @RequestParam("id") int exerciseId,
			WorkoutExercise workoutExercise, Model model) {

		// exercise Id recieved

		return "createWorkout";

	}

	@RequestMapping(path = "CreateWorkout.do")
	public ModelAndView createWorkout() {
		ModelAndView mv = new ModelAndView();
		// TODO: Fix, saves workout

		return mv;
	}

}
