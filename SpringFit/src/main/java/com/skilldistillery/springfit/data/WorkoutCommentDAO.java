package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.User;
import com.skilldistillery.springfit.entities.WorkoutComment;

public interface WorkoutCommentDAO {
	
	List<WorkoutComment> findByUserId(int id);
	List<WorkoutComment> findByWorkoutId(int id);
	public WorkoutComment getById(int workoutCommentId);
	
	public WorkoutComment createWorkoutComment(WorkoutComment workoutComment, int userId, int workoutId);
	
	public List<WorkoutComment> getCommentByWorkoutId(int workoutId);

}
