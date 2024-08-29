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
    public String getCommentsByUser(HttpSession session,@RequestParam("userId") int userId, Model model) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if(loggedInUser != null) {
		
        List<WorkoutComment> comments = workoutCommentDao.findByUserId(userId);
        
        model.addAttribute("comments", comments);
        
        return "redirect:commentForm.do";
        }
		else {
        	return "error";
        }
		
        }
		
    
	
	

	@RequestMapping(path = "commentForm.do", method = RequestMethod.GET)
    public ModelAndView addComment(@RequestParam("workoutId") int workoutId,
                             @RequestParam("userId") int userId,
                             @RequestParam("content") String content,
                             @RequestParam(value = "replyId", required = false) Integer replyId) {

		ModelAndView mv = new ModelAndView();
        WorkoutComment comment = new WorkoutComment();
        comment.setWorkout(workoutDao.getWorkoutById(workoutId));
        comment.setContent(content);
        comment.setCreateDate(LocalDateTime.now());
        comment.setEnabled(true);
        
        mv.addObject("comment",comment);
        mv.setViewName("communityWorkouts");

        return mv; 
    }

	

	
}
