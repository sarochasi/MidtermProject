package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.Exercise;

public interface ExerciseDAO {
	
	List<Exercise> showAllExercises();
	
	List<Exercise> showExercisesByKeyword(String keyword);
	
	Exercise showExerciseById(int id);
	
	// Exercise updateExercise(int id, Exercise e);

}
