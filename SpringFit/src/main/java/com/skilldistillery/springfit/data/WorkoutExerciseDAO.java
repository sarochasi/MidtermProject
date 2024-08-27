package com.skilldistillery.springfit.data;

import com.skilldistillery.springfit.entities.Exercise;
import com.skilldistillery.springfit.entities.WorkoutExercise;

public interface WorkoutExerciseDAO {
	public WorkoutExercise getWorkoutExerciseById(int id);
	public WorkoutExercise updateWorkoutExerciseById(int id);
	public WorkoutExercise createWorkoutExerciseById(int exerciseId);
	public WorkoutExercise createWorkoutExerciseByExercise(Exercise exercise);
	public WorkoutExercise deleteWorkoutExerciseById(int id);
	
	
	

}
