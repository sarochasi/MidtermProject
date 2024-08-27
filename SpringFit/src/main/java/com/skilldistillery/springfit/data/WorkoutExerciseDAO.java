package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.WorkoutExercise;

public interface WorkoutExerciseDAO {
	public WorkoutExercise getWorkoutExerciseById(int id);

	public WorkoutExercise createWorkoutExercise(int exerciseId, int workoutId, WorkoutExercise workoutExercise);

	
	
	

}
