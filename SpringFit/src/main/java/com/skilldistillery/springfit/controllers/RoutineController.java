package com.skilldistillery.springfit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.RoutineDAO;
import com.skilldistillery.springfit.data.RoutineWorkoutDAO;
import com.skilldistillery.springfit.data.WorkoutDAO;
import com.skilldistillery.springfit.entities.Routine;
import com.skilldistillery.springfit.entities.RoutineWorkout;
import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;

import jakarta.servlet.http.HttpSession;

@Controller
public class RoutineController {

	@Autowired
	private RoutineDAO routineDao;

	@Autowired
	private WorkoutDAO workoutDao;

	@Autowired
	private RoutineWorkoutDAO routineWorkoutDao;

	//Opens createRoutine.jsp, generates routineID, SENDS createRoutine.jsp list of user workouts,
	//routineId, and routine Object
	@RequestMapping(path = "goTocreateRoutinePage.do")
	public ModelAndView goToCreateRoutineAndInitializeRoutineObjWithUserId(Routine routine, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			//Generates newroutine's ID (from persist in DAOImpl)
			Routine newRoutine = routineDao.createNewRoutine(routine, loggedInUser.getId());
			List<Workout> workouts = workoutDao.getWorkoutByUserId(loggedInUser.getId());
			mv.addObject("workouts", workouts);
			mv.addObject("routineId", newRoutine.getId());
			mv.addObject("routine", newRoutine);
			System.out.println();
			System.out.println();
			System.out.println(routine);
			System.out.println();

			mv.setViewName("createRoutine");
		} else {
			mv.setViewName("home");
		}
		return mv;
	}

	@RequestMapping(path = "createRoutine.do", params = "routineId")
	public ModelAndView createRoutine(@RequestParam("routineId") int routineId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			routineWorkoutDao.createRoutineWorkout(routineId, routineId, routineId, null);
			mv.setViewName("createRoutine");
		} else {
			mv.setViewName("home");
		}
		return mv;
	}

//---------------Receives routineId and WorkoutId, Command Object of RoutineWorkout -----------------
//	RoutineWorkout made from workoutId, day number. routineId is not part of RoutineWorkout command
//  Object because its explicitly called in the RequestParam
	@RequestMapping(path = "addWorkoutToRoutine.do", params = "routineId", method = RequestMethod.POST)
	public String getRoutineDay(@RequestParam("routineId") int routineId, HttpSession session,
			RoutineWorkout routineWorkout) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {

			Routine routine = routineDao.getRoutineById(routineId);
			
			//Creates RoutineWorkout object with routineId and routineWorkout obj, 
			//DAOIMPL persists and adds RoutineWorkout ID
			RoutineWorkout newRoutineWorkout = routineWorkoutDao.createRoutineWorkout(0, 0, routineId, routineWorkout);

			mv.setViewName("createRoutine");
			mv.addObject("routineId", routineId);



			List<Workout> workouts = workoutDao.getWorkoutByUserId(loggedInUser.getId());
			return "redirect:addWorkoutToRoutine.do?routineId=" + routineId;
		} else {
			mv.setViewName("home");
			return "home";
		}
	}

	//creates workouts list, 
	@RequestMapping(path = "addWorkoutToRoutine.do", params = "routineId", method = RequestMethod.GET)
	public ModelAndView goToAddWorkoutToRoutine(@RequestParam("routineId") int routineId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			List<Workout> workouts = workoutDao.getWorkoutByUserId(loggedInUser.getId());
			Routine routine = routineDao.getRoutineById(routineId);
			mv.addObject("workouts", workouts);
			mv.addObject("routineId", routine.getId());
			mv.addObject("routine", routine);
			mv.setViewName("createRoutine");
		} else {
			mv.setViewName("home");
		}
		return mv;
	}
	
	@RequestMapping(path = "deleteRoutine.do", params = "routineId", method = RequestMethod.POST)
	public ModelAndView deleteRoutine(@RequestParam("routineId") int routineId) {
		ModelAndView mv = new ModelAndView();
		routineDao.deleteRoutineById(routineId);
		mv.setViewName("account");
		return mv;
	}
}
