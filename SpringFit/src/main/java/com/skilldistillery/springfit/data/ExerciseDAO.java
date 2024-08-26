
package com.skilldistillery.springfit.data;

import java.util.List;

import com.skilldistillery.springfit.entities.Exercise;

public interface ExerciseDAO {
	
	// Exercise
	List<Exercise> showAllExercises();
	List<Exercise> showExercisesByKeyword(String keyword);
	Exercise showExerciseById(int id);
	// Exercise updateExercise(int id, Exercise e);
	
	// Exercise (By ExerciseType)
	List<Exercise> showExercisesByType(int id);
	
	public List<Exercise> findAllExercises();


}

