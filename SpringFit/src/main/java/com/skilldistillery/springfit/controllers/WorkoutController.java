

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
import com.skilldistillery.springfit.data.WorkoutExerciseDAO;
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
	
	@Autowired
	private WorkoutExerciseDAO workoutExerciseDao;

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
	public ModelAndView initializeWorkout(Workout workout, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			Workout newWorkout = workoutDao.createNewWorkoutInitialize(workout, loggedInUser.getId());
			mv.addObject("workout", newWorkout);
			
			mv.setViewName("redirect:GetWorkoutPage.do?workoutId="+newWorkout.getId());
		}
		else {
			mv.setViewName("home");
		}
		
		
		return mv;
	}

	@RequestMapping(path = "GetWorkoutPage.do", params="workoutId")
	public ModelAndView getExerciseType(@RequestParam("workoutId")int workoutId) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("exerciseTypes", exerciseDao.findAllExerciseTypes());

		mv.addObject("workoutId",workoutId );

		mv.setViewName("createWorkout");

		return mv;
	}

	// Opens createWorkout page when user selected from account page
	@RequestMapping(path = "GetWorkoutPage.do", params = {"exerciseType", "workoutId"})
	public ModelAndView displayWorkoutPage(@RequestParam("exerciseType") int typeId, @RequestParam("workoutId") int workoutId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			List<Exercise> exercises = exerciseDao.showExercisesByType(typeId);
			mv.addObject("workoutId", workoutId);
			mv.addObject("exercises", exercises);
			mv.setViewName("createWorkout");
		} else {
			mv.setViewName("home");

		}

		return mv;
	}

	@RequestMapping(path = "addExercise.do", method = RequestMethod.POST)

	public String addExerciseToWorkout(HttpSession session,
			@RequestParam("exerciseId") int exerciseId, 
			@RequestParam("workoutId") Integer workoutId,

			WorkoutExercise workoutExercise, Model model) {
		//rep int
		//set int
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println("***********************************");
		System.out.println(workoutExercise);
		System.out.println("***********************************");
		System.out.println();
		System.out.println();
		System.out.println();
		workoutExercise = workoutExerciseDao.createWorkoutExercise(exerciseId, workoutId, workoutExercise);
		//////FIX THIS I THINK createWorkout.jsp needs to get sets and reps and send here
		
		
		
		//workoutExerciseDao.createWorkoutExerciseByExercise(null);
		
		

		
		Workout newWorkout = workoutDao.getWorkoutById(workoutId);
		workoutDao.getWorkoutById(workoutId);
		newWorkout.addWorkoutExercise(workoutExercise);
		
		//////FIX THIS I THINK createWorkout.jsp needs to get sets and reps and send here
		
		

		
		

		
		// workoutExercise = workoutDao.createNewWorkout(workoutExercise);
		
		// exercise Id recieved

		return "createWorkout";

	}

	@RequestMapping(path = "CreateWorkout.do")
	public ModelAndView createWorkout() {
		ModelAndView mv = new ModelAndView();
		// TODO: Fix, saves workout

		return mv;
	}
	
	@RequestMapping(path = "showAllWorkouts.do", method = RequestMethod.GET)
	public String list(Model model) {
		List<Workout> allWorkouts = workoutDao.showAllWorkouts();
		model.addAttribute("allWorkouts", allWorkouts);
		return "communityWorkouts";
	}
	
	

}
