package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.WorkoutComment;

public interface WorkoutCommentDAO {
	
	List<WorkoutComment> findByUserId(int id);
	List<WorkoutComment> findByWorkoutId(int id);

}
