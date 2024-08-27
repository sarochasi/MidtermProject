package com.skilldistillery.springfit.controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.springfit.data.UserDAO;
import com.skilldistillery.springfit.data.WorkoutDAO;
import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private WorkoutDAO workoutDao;
	
	// HOME	- (could inject session also) - THIS IS WHAT ROB HELPED SET UP
	@RequestMapping(path = { "/", "home.do" } )
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDao.authenticateUser("admin", "test")); // ** Temporary **
		return "home";
	}
	
	// LOGIN FORM - OUTPUT (POST) 
    @RequestMapping(path = "login.do", method = RequestMethod.POST)
    public String doLogin(@ModelAttribute("user") User user, HttpSession session, Model model) {
    	
        User authUser = userDao.authenticateUser(user.getUsername(), user.getPassword());
        
        if (authUser != null) {

        	session.setAttribute("loggedInUser", authUser);
            session.setAttribute("loginTime", LocalDateTime.now());
            return "account";
        } else {
            return "error"; 
        }
    }
    
    @RequestMapping(path = "profile.do", method = RequestMethod.GET)
    public String showProfile(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
            
            List<Workout> myWorkouts  = workoutDao.getWorkoutByUserId(loggedInUser.getId());
            model.addAttribute("myWorkouts", myWorkouts);
            return "account"; 
        } else {
            model.addAttribute("errorMessage", "You must be logged in to view your profile.");
            return "login"; 
        }
    }

    
    @RequestMapping(path="registerForm.do", method=RequestMethod.GET)
    public String showRegisterForm(Model model) {
    	model.addAttribute("user", new User());
    	return "register";
    }
    
    @RequestMapping(path = "Register.do", method = RequestMethod.POST)
    public String doRegister(@ModelAttribute("user") User user, HttpSession session, Model model) {
    	
    	user.setEnabled(true);
    	
    	if (userDao.usernameExists(user.getUsername())) {
    		model.addAttribute("errorMessage", "Username already exists. Please choose a different username.");
    		return "register";
    	}
    	
    	User registeredUser = userDao.registerUser(user);
    	
    	if (registeredUser != null) {
    		session.setAttribute("loggedInUser", registeredUser);
    		session.setAttribute("loginTime", LocalDateTime.now());
    		
    		return "account";
    	}else {
    		model.addAttribute("errorMessage", "Registration failed. Please try again.");
    		return "register";
    	}
    }
    
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "home";
	}
	
	@RequestMapping(path="profileAfterWorkout.do")
	public String returnToProfileAfterWorkoutCompletion(HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            model.addAttribute("user", loggedInUser);
            return "account"; 
        } else {
            model.addAttribute("errorMessage", "You must be logged in to view your profile.");
            return "login"; 
        }
	}
	
}



