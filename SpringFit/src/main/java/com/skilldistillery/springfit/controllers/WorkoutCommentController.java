package com.skilldistillery.springfit.controllers;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.springfit.data.UserDAO;
import com.skilldistillery.springfit.data.WorkoutCommentDAO;
import com.skilldistillery.springfit.data.WorkoutDAO;
import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.Workout;
import com.skilldistillery.springfit.entities.WorkoutComment;

import jakarta.servlet.http.HttpSession;

@Controller
public class WorkoutCommentController {

	@Autowired
	private WorkoutCommentDAO workoutCommentDao;

	@Autowired
	private WorkoutDAO workoutDao;

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "commentByUser.do", method = RequestMethod.POST)
	public String getCommentsByUser(HttpSession session, @RequestParam("userId") int userId, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null && loggedInUser.getId() == userId) {

			List<WorkoutComment> comments = workoutCommentDao.findByUserId(userId);

			model.addAttribute("comments", comments);

			return "CreatingComment.do";
		} else {
			return "redirect:login.do";
		}

	}

	@RequestMapping(path = "CreatingComment.do")
    public ModelAndView createComment(@RequestParam("workoutId") int workoutId, @RequestParam("content") String content, WorkoutComment workoutComment, HttpSession session) {
    	ModelAndView mv = new ModelAndView();
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
    	if(loggedInUser != null) {
    		Workout workout = workoutDao.getWorkoutById(workoutId);
    		WorkoutComment newComment = workoutCommentDao.createWorkoutComment(workoutComment, loggedInUser.getId(), workout.getId());
    		newComment.setWorkout(workout);
            newComment.setUser(loggedInUser);
            newComment.setContent(content);
            newComment.setCreateDate(LocalDateTime.now());
            newComment.setEnabled(true);
    		mv.addObject("workoutComment", newComment);
    		mv.setViewName("redirect:showCommunity.do");
    }else {
    	mv.setViewName("home");
    }return mv;
	
	}
	

	@RequestMapping(path = "commentForm.do", method = RequestMethod.GET)
    public ModelAndView showCommentForm(@RequestParam("workoutId") int workoutId) {

        ModelAndView mv = new ModelAndView();
        Workout workout = workoutDao.getWorkoutById(workoutId);
        
        if (workout == null) {
            mv.setViewName("redirect:workouts.do"); // Redirect if workout not found
        } else {
            mv.addObject("workout", workout);
            mv.setViewName("commentForm"); // Display the form for adding a comment
        }
        
        return mv;
    }

	// Process adding a comment to a workout
    @RequestMapping(path = "addComment.do", method = RequestMethod.POST)
    public String addComment(@RequestParam("workoutId") int workoutId,
                             @RequestParam("userId") int userId,
                             @RequestParam("content") String content,
                             @RequestParam(value = "replyId", required = false) Integer replyId) {

        Workout workout = workoutDao.getWorkoutById(workoutId);
        
        User user = userDao.getUserById(userId);

        if (workout != null && user != null) {
            WorkoutComment comment = new WorkoutComment();
            comment.setWorkout(workout);
            comment.setUser(user);
            comment.setContent(content);
            comment.setCreateDate(LocalDateTime.now());
            comment.setEnabled(true);

            if (replyId != null) {
                WorkoutComment reply = workoutCommentDao.getById(replyId);
                comment.setReply(reply);
            }

            // workoutCommentDao.save(comment);
        }

        return "redirect:workoutDetails.do?workoutId=" + workoutId; // Redirect back to the workout details page
    }

	@RequestMapping(path = "showCommunity.do", method = RequestMethod.GET)
	public String list(Model model) {
		List<Workout> allWorkouts = workoutDao.showAllWorkouts();
		model.addAttribute("allWorkouts", allWorkouts);
		return "communityWorkouts";
	}

	@RequestMapping(path = "GetCommetnBox.do", params = "commentId")
	public ModelAndView getWorkoutForm(@RequestParam("comment") int commentId) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("comment", workoutCommentDao.getById(commentId));
		mv.setViewName("communityWorkouts");
		return mv;
	}
	}	
	

