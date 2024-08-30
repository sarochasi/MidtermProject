
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
	
	@RequestMapping(path = "goTocreateRoutinePage.do")
	public ModelAndView goToCreateRoutineAndInitializeRoutineObjWithUserId(Routine routine, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
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

			
		}
		else {
			mv.setViewName("home");
		}
		
		
		return mv;
		
	}
	@RequestMapping(path = "getRoutineDay.do", params = "routineId")
	public ModelAndView getRoutineDay(@RequestParam("routineId") int routineId,@RequestParam("workoutId") int workoutId,@RequestParam("dayNumber")Integer dayNumber, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {
			System.out.println();
			System.out.println();
			System.out.println();
			System.out.println(routineId);
			System.out.println(workoutId);
			System.out.println(dayNumber);
System.out.println();
System.out.println();
System.out.println();
			mv.setViewName("createRoutine");
			mv.addObject("routineId", routineId);
			
		}
		else {
			mv.setViewName("home");
		}
		
		
		return mv;
		
	}
	
	//---------------Receives routineId and WorkoutId, Command Object of RoutineWorkout -----------------
//	@RequestMapping(path = "recieveRoutineDayAndWorkoutAndCreateRoutineWorkout.do", params = "routineId")
	@RequestMapping(path = "addWorkoutToRoutine.do", params = "routineId", method = RequestMethod.POST)
	public String getRoutineDay(@RequestParam("routineId") int routineId, HttpSession session,
			RoutineWorkout routineWorkout) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null) {

			Routine routine = routineDao.getRoutineById(routineId);
//			Workout workout = workoutDao.getWorkoutById(workoutId);
			RoutineWorkout newRoutineWorkout = routineWorkoutDao.createRoutineWorkout(0, 0, routineId, routineWorkout);

			mv.setViewName("createRoutine");
			mv.addObject("routineId", routineId);

//			Routine newRoutine = routineDao.getRoutineById(routineId);
//			newRoutine.addRoutineWorkout(newRoutineWorkout);

			List<Workout> workouts = workoutDao.getWorkoutByUserId(loggedInUser.getId());
//			return "redirect:createRoutine.do?routineId=" +newRoutine.getId() + "&workouts="+workouts;
//			return "redirect:goTocreateRoutinePage.do";		//works but creates multiple routines
			return "redirect:addWorkoutToRoutine.do?routineId=" + routineId;
		} else {
			mv.setViewName("home");
			return "home";
		}
	}

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
		routineDao.deleteRoutineByIdSqlStmt(routineId);
		mv.setViewName("redirect:profile.do");
		return mv;
	}
}
