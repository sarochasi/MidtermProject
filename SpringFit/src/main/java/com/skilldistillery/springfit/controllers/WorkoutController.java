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

import com.skilldistillery.springfit.data.ExerciseDAO;
import com.skilldistillery.springfit.data.UserDAO;
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
	private UserDAO userDao;

	@Autowired
	private WorkoutExerciseDAO workoutExerciseDao;

	// Takes user data for Workout (name desicription, etc), does not take exercises
	// yet.
	@RequestMapping(path = "InitializeWorkout.do")
	public ModelAndView initializeWorkout(Workout workout, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			Workout newWorkout = workoutDao.createNewWorkoutInitialize(workout, loggedInUser.getId());
			mv.addObject("workout", newWorkout);

			mv.setViewName("redirect:GetWorkoutPage.do?workoutId=" + newWorkout.getId());
		} else {
			mv.setViewName("home");
		}

		return mv;
	}

	@RequestMapping(path = "addMoreExercise.do", params = "workoutId")
	public ModelAndView addMoreExercise(@RequestParam("workoutId") int workoutId) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("exerciseTypes", exerciseDao.findAllExerciseTypes());

//		=============================================
		List<WorkoutExercise> workoutExercises = workoutDao.getExercisesByWorkoutId(workoutId);
		
		mv.addObject("workoutExercises", workoutExercises);
//	    ==============================================

		mv.addObject("workoutId", workoutId);

		mv.setViewName("createWorkout");

		return mv;
	}

	@RequestMapping(path = "GetWorkoutPage.do", params = "workoutId")
	public ModelAndView getExerciseType(@RequestParam("workoutId") int workoutId) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("exerciseTypes", exerciseDao.findAllExerciseTypes());

//		=============================================
		List<WorkoutExercise> workoutExercises = workoutDao.getExercisesByWorkoutId(workoutId);
		;
		mv.addObject("workoutExercises", workoutExercises);
//	    ==============================================

		mv.addObject("workoutId", workoutId);

		mv.setViewName("createWorkout");

		return mv;
	}

	// Opens createWorkout page when user selected from account page
	@RequestMapping(path = "GetWorkoutPage.do", params = { "exerciseType", "workoutId" })
	public ModelAndView displayWorkoutPage(@RequestParam("exerciseType") int typeId,
			@RequestParam("workoutId") int workoutId, HttpSession session) {
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

	public String addExerciseToWorkout(HttpSession session, @RequestParam("exerciseId") int exerciseId,
			@RequestParam("workoutId") Integer workoutId,

			WorkoutExercise workoutExercise, Model model) {
		// rep int
		// set int
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

		model.addAttribute("workoutExercise", workoutExercise);

//		Workout newWorkout = workoutDao.getWorkoutById(workoutId);
//		workoutDao.getWorkoutById(workoutId);
//		newWorkout.addWorkoutExercise(workoutExercise);

		// workoutExercise = workoutDao.createNewWorkout(workoutExercise);

		// exercise Id recieved

		return "redirect:GetWorkoutPage.do?workoutId=" + workoutId;

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

	@RequestMapping(path = "workoutByUser.do", method = RequestMethod.GET)
	public String getWorkoutByUserId(HttpSession session, @RequestParam("userId") int userId, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			List<Workout> myWorkouts = workoutDao.getWorkoutByUserId(userId);
			// List<Workout> userLikedWorkouts = userDao.getLikedWorkouts(userId);

//			for (Workout workout : myWorkouts) {
//				System.out.println("Workout Name: " + workout.getName());
//			}

			model.addAttribute("myWorkouts", myWorkouts);
			// model.addAttribute("userLikedWorkouts", userLikedWorkouts);

			System.out.println("======================================");
			System.out.println("User ID: " + userId);
			System.out.println("Number of Workouts: " + myWorkouts.size());
			for (Workout workout : myWorkouts) {
				System.out.println("Workout Name: " + workout.getName());
			}
			System.out.println("======================================");

			model.addAttribute("myWorkouts", myWorkouts);
			return "account";
		} else {

			System.out.println("==================No user=============");
			return "account";
		}
	}

	@RequestMapping(path = "showExercisesWithinWorkout.do", method = RequestMethod.GET)
	public ModelAndView viewWorkoutDetails(@RequestParam("workoutId") int workoutId) {
		ModelAndView mv = new ModelAndView();
		Workout workout = workoutDao.getWorkoutById(workoutId);
		List<WorkoutExercise> workoutExercises = workoutDao.getExercisesByWorkoutId(workoutId);

		mv.addObject("workout", workout);
		mv.addObject("workoutExercises", workoutExercises);
		mv.setViewName("viewWorkoutDetails");

		return mv;
	}

	@RequestMapping(path = "deleteWorkout.do", method = RequestMethod.POST)
	public ModelAndView deleteWorkout(@RequestParam("workoutId") int workoutId) {

		ModelAndView mv = new ModelAndView();
		Workout workout = workoutDao.getWorkoutById(workoutId);

		if (workout == null) {
			mv.setViewName("error");
		} else {
			boolean deleted = workoutDao.deleteWorkout(workoutId);
			if (!deleted) {
				mv.addObject("errorMessage", "Failed to delete the workout");
				mv.setViewName("error");
			} else {
				mv.setViewName("redirect:profile.do");
			}
		}

		return mv;

	}

	@RequestMapping(path = "updateWorkoutForm.do", method = RequestMethod.GET)
	public ModelAndView showUpdateWorkoutForm(@RequestParam("workoutId") int id) {
		ModelAndView mv = new ModelAndView();
		Workout workout = workoutDao.getWorkoutById(id);

		if (workout != null) {
			mv.addObject("workout", workout);
			mv.setViewName("updateForm");
		} else {
			mv.addObject("errorMessage", "Workout not found");
			mv.setViewName("error");
		}
		return mv;

	}

	@RequestMapping(path = "updateWorkout.do", method = RequestMethod.POST)
	public ModelAndView updateWorkout(@ModelAttribute("workout") Workout workout) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println();
		System.out.println(workout);
		try {
			Workout updatedWorkout = workoutDao.updateWorkout(workout.getId(), workout);
			if (updatedWorkout != null) {
				mv.addObject("workout", updatedWorkout);
				mv.setViewName("redirect:updateWorkoutExerciseForm.do?workoutId=" + updatedWorkout.getId());
			}

		} catch (Exception e) {
			mv.addObject("errorMessage", "Error occured while updating the Workout.");
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(path = "updateWorkoutExerciseForm.do", method = RequestMethod.GET)
	public ModelAndView showUpdateWorkoutExerciseForm(@RequestParam("workoutId") int workoutId) {
		ModelAndView mv = new ModelAndView();
//		WorkoutExercise workoutExercise = workoutExerciseDao.getWorkoutExerciseById(id);
		List<WorkoutExercise> workoutExercises = workoutDao.getExercisesByWorkoutId(workoutId);

		if (workoutExercises != null) {
			mv.addObject("workoutExercises", workoutExercises);
			mv.setViewName("updateWorkoutExerciseform");
		} else {
			mv.addObject("errorMessage", "WorkoutExercise not found");
			mv.setViewName("error");
		}
		return mv;

	}

	@RequestMapping(path = "updateWorkoutExercise.do", method = RequestMethod.POST)
	public ModelAndView updateWorkoutExercise(@ModelAttribute("workout") WorkoutExercise workoutExercise,
			@RequestParam("workoutExerciseId") Integer workoutExerciseId,
			@RequestParam("workoutId") Integer workoutId) {
		ModelAndView mv = new ModelAndView();
		try {
			workoutExerciseDao.updateWorkoutExercise(workoutExerciseId, workoutExercise);
			mv.setViewName("redirect:updateWorkoutExerciseForm.do?workoutId=" + workoutId);
		} catch (Exception e) {
			mv.addObject("errorMessage", "Error occurred while updating the workout exercises.");
			mv.setViewName("error");
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(path = "deleteWorkoutExercise.do", method = RequestMethod.POST)
	public ModelAndView deleteWorkoutExercise(@ModelAttribute("workout") WorkoutExercise workoutExercise,
			@RequestParam("workoutExerciseId") Integer workoutExerciseId,
			@RequestParam("workoutId") Integer workoutId) {

		ModelAndView mv = new ModelAndView();

		if (workoutExercise == null) {
			mv.addObject("errorMessage", "WorkoutExercise not found with ID: " + workoutExerciseId);
			mv.setViewName("error");
		} else {
			boolean deleted = workoutExerciseDao.deleteWorkoutExercise(workoutExerciseId);
			if (!deleted) {
				mv.addObject("errorMessage", "Failed to delete");
				mv.setViewName("error");
			} else {
				mv.setViewName("redirect:updateWorkoutExerciseForm.do?workoutId=" + workoutId);
			}
		}

		return mv;

	}

	// LIKE
	@RequestMapping(path = "likeWorkout.do", method = RequestMethod.POST)
	public String likeWorkout(@RequestParam("workoutId") Integer workoutId, HttpSession session, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		Workout workout = workoutDao.getWorkoutById(workoutId);

		if (currentUser != null && workout != null) {
			
			currentUser = userDao.getUserById(currentUser.getId());
			
			if (currentUser.getLikedWorkout() != null) {
				currentUser.getLikedWorkout().size();
				userDao.saveUser(currentUser);
			}
			 
			if (!currentUser.getLikedWorkout().contains(workout)) {
				currentUser.getLikedWorkout().add(workout);
				workout.addLikeByUser(currentUser);
				workout.setLikeCount(workout.getLikeCount());
				userDao.saveUser(currentUser);
				workoutDao.save(workout);
			}
			
//			currentUser.addLikedWorkout(workout);
//			workout.addLikeByUser(currentUser);
//			session.setAttribute("loggedInUser", currentUser);
//			workoutDao.save(workout);
				
			}

		return "redirect:profile.do";
	}

	// UNLIKE
	@RequestMapping(path = "unlikeWorkout.do", method = RequestMethod.POST)
	public String unlikeWorkout(@RequestParam("workoutId") Integer workoutId, HttpSession session) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		Workout workout = workoutDao.getWorkoutById(workoutId);

		if (currentUser != null && workout != null) {
			currentUser = userDao.getUserById(currentUser.getId());
			if (currentUser.getLikedWorkout().contains(workout)) {
				currentUser.getLikedWorkout().remove(workout);
				workout.getUsers().remove(currentUser);
				
				userDao.saveUser(currentUser);
				workoutDao.save(workout);
			}
//			currentUser.removeLikedWorkout(workout);
//			session.setAttribute("loggedInUser", currentUser);
//			workoutDao.save(workout);
		
		}

		return "redirect:profile.do";
	}

	@RequestMapping(path = "communityBoard.do", method = RequestMethod.GET)
	public String showCommunityBoard(Model model) {
		List<Workout> allWorkouts = workoutDao.showAllWorkouts();
		model.addAttribute("allWorkouts", allWorkouts);
		return "communityWorkouts";
	}

}
